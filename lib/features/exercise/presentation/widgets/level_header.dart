import 'package:fitness_app/core/theme/app_colors.dart';
import 'package:fitness_app/core/theme/app_styles.dart';
import 'package:fitness_app/features/exercise/presentation/view_model/cubit.dart';
import 'package:fitness_app/features/exercise/presentation/view_model/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class LevelHeader extends StatelessWidget {
  final List<dynamic> levels;
  final String? primeMoverId;

  const LevelHeader({
    super.key,
    required this.levels,
    required this.primeMoverId,
  });

  String? _extractYoutubeId(String? url) {
    if (url == null || url.isEmpty) return null;
    try {
      return YoutubePlayer.convertUrlToId(url);
    } catch (_) {
      return null;
    }
  }

  String? youtubeThumbnail(String? url) {
    final id = _extractYoutubeId(url);
    return id != null ? 'https://img.youtube.com/vi/$id/0.jpg' : null;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExerciseCubit, ExerciseState>(
      buildWhen: (prev, curr) =>
          curr is ExercisesLoaded || curr is ExerciseSelected,
      builder: (context, state) {
        final cubit = context.read<ExerciseCubit>();
        final exercise = cubit.selectedExercise;
        final thumbnail = youtubeThumbnail(
          exercise?.shortYoutubeDemonstrationLink,
        );

        return Container(
          height: 380.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              image: NetworkImage(
                thumbnail ?? 'https://via.placeholder.com/150',
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, AppColors.grayy],
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      exercise?.bodyRegion ?? 'Select Exercise',
                      style: AppStyles.bold24white,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    exercise?.exercise ?? 'Select an exercise to view details',
                    style: AppStyles.font16WhiteW400,
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: Text(
                          // exercise?.bodyRegion ??
                          '30 MIN',
                          style: AppStyles.w80014white,
                        ),
                      ),
                      Spacer(),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: Text(
                          // exercise?.bodyRegion ??
                          '130 Cal',
                          style: AppStyles.w80014orange,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  TabBar(
                    isScrollable: true,
                    indicator: BoxDecoration(
                      color: AppColors.orange,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    dividerColor: Colors.transparent,
                    labelColor: Colors.white,
                    unselectedLabelColor: AppColors.grey,
                    onTap: (index) {
                      final selectedLevel = levels[index];
                      cubit.selectLevel(selectedLevel.id, selectedLevel.name);
                      cubit.getExercises(selectedLevel.id, primeMoverId);
                    },
                    tabs: levels
                        .map(
                          (level) => Tab(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12.w),
                              child: Text(
                                level.name ?? "Level",
                                style: AppStyles.w80014white,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
