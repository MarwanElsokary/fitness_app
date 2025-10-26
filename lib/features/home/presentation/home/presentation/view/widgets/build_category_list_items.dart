import 'package:fitness_app/core/base/base_state.dart';
import 'package:fitness_app/core/gen/assets.gen.dart';
import 'package:fitness_app/core/theme/app_colors.dart';
import 'package:fitness_app/features/home/domain/entities/category_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view_model/cubit/home_cubit.dart';
import 'category_item.dart';
import 'handler_error_widget.dart';

class BuildCategoryListItems extends StatelessWidget {
  const BuildCategoryListItems({super.key, this.categories});

  final List<CategoryEntity>? categories;

  @override
  Widget build(BuildContext context) {
    List<CategoryEntity>? categories = [
      CategoryEntity(
        titleEn: 'Gym',
        titleAr: '',
        imageUrl: Assets.image.gym.path,
      ),
      CategoryEntity(
        titleEn: 'Fitnes',
        titleAr: '',
        imageUrl: Assets.image.fitness.path,
      ),
      CategoryEntity(
        titleEn: 'Yoga',
        titleAr: '',
        imageUrl: Assets.image.yoga.path,
      ),
      CategoryEntity(
        titleEn: 'Aerobics',
        titleAr: '',
        imageUrl: Assets.image.arobre.path,
      ),
      CategoryEntity(
        titleEn: 'Trainer',
        titleAr: '',
        imageUrl: Assets.image.traning.path,
      ),
    ];

    var viewModel = context.read<HomeCubit>();
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Categories",
              style: Theme.of(
                context,
              ).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10.0),
            Container(
              height: 100.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.grey.shade800,
              ),
              child:
                  viewModel.state.getExerciseCategoriesState is BaseErrorState
                  ? const HandlerErrorWidget()
                  : Builder(
                      builder: (context) {
                        return ListView.separated(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            final category = categories?[index];
                            return CategoryItem(
                              title: category?.titleEn ?? '',
                              //  : category?.titleAr ?? '',
                              imageUrl: category?.imageUrl ?? '',
                            );
                          },
                          separatorBuilder: (context, index) => VerticalDivider(
                            width: 2.0,
                            thickness: 1.5,
                            color: AppColors.white,
                            indent: 10.0,
                            endIndent: 15.0,
                          ),
                          itemCount: categories?.length ?? 3,
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
