import 'package:fitness_app/core/theme/app_colors.dart';
import 'package:fitness_app/features/exercise/presentation/view_model/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fitness_app/core/theme/app_styles.dart';
import 'package:fitness_app/features/exercise/domain/entites/get_exercise_entity.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ExerciseCard extends StatefulWidget {
  final ExercisesEntity exercise;
  final VoidCallback onTap;

  const ExerciseCard({super.key, required this.exercise, required this.onTap});

  @override
  State<ExerciseCard> createState() => _ExerciseCardState();
}

class _ExerciseCardState extends State<ExerciseCard> {
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

  void _showVideoDialog() {
    final videoId = _extractYoutubeId(
      widget.exercise.shortYoutubeDemonstrationLink,
    );
    if (videoId == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Try Again Later Please')));
      return;
    }

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.all(20.w),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(16),
          ),
          clipBehavior: Clip.hardEdge,
          child: YoutubePlayer(
            controller: YoutubePlayerController(
              initialVideoId: videoId,
              flags: const YoutubePlayerFlags(autoPlay: true, mute: false),
            ),
            showVideoProgressIndicator: true,
            progressIndicatorColor: Colors.orange,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final exercise = widget.exercise;
    final thumbnail = youtubeThumbnail(exercise.shortYoutubeDemonstrationLink);

    return GestureDetector(
      onTap: () {
        context.read<ExerciseCubit>().selectExercise(exercise);
        widget.onTap();
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        decoration: BoxDecoration(
          color: AppColors.grayy,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white10),
        ),
        padding: EdgeInsets.all(8.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                thumbnail ?? 'https://via.placeholder.com/150',
                height: 70.h,
                width: 70.h,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Container(
                    height: 70.h,
                    width: 70.h,
                    color: Colors.grey.shade800,
                    alignment: Alignment.center,
                    child: const CircularProgressIndicator(
                      color: Colors.orange,
                      strokeWidth: 2,
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 70.h,
                    width: 70.h,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade900,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    alignment: Alignment.center,
                    child: const Icon(
                      Icons.image_not_supported,
                      color: Colors.white54,
                      size: 32,
                    ),
                  );
                },
              ),
            ),

            SizedBox(width: 12.w),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    exercise.bodyRegion ?? "Unknown Region",
                    style: AppStyles.medium18whiteW400,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    exercise.exercise ?? "Unnamed Exercise",
                    style: AppStyles.font13WhiteW500,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),

            IconButton(
              icon: const Icon(
                Icons.play_circle_fill,
                color: Colors.orange,
                size: 36,
              ),
              onPressed: _showVideoDialog,
            ),
          ],
        ),
      ),
    );
  }
}
