import 'package:fitness_app/core/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../view_model/cubit/home_cubit.dart';
import 'widgets/home_body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final HomeCubit viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = getIt<HomeCubit>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadInitialData();
    });
  }

  Future<void> _loadInitialData() async {
    await Future.wait([
      viewModel.doIntent(GetExerciseCategoriesAction()),
      viewModel.doIntent(GetDailyRecommendationExerciseAction()),
      viewModel.doIntent(GetFoodRecommendationAction()),
      viewModel.doIntent(GetAllMuscelsAction()),
      viewModel.doIntent(GetMusclesByGroupAction()),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: const Scaffold(body: HomeBody()),
    );
  }
}
