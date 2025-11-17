import 'package:fitness_app/core/di/di.dart';
import 'package:fitness_app/core/gen/assets.gen.dart';
import 'package:fitness_app/features/profile/presentation/cubit/profiles_cubit.dart';
import 'package:fitness_app/features/profile/presentation/cubit/profiles_state.dart';
import 'package:fitness_app/features/profile/presentation/widgets/profile_options.dart';
import 'package:fitness_app/features/profile/presentation/widgets/user_information_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<ProfileViewModel>()..doIntent(ProfileClickedIntent()),
      child: BlocConsumer<ProfileViewModel, ProfileState>(
        listener: (context, state) {
          // if (state is LogoutSuccessState) {
          //   Navigator.pushNamedAndRemoveUntil(
          //     context,
          //     PagesRoutes.signIn,
          //         (route) => false,
          //   );
          // } else if (state is ErrorProfileState) {
          //   ScaffoldMessenger.of(context).showSnackBar(
          //     SnackBar(content: Text(state.message)),
          //   );
          // }
        },
        builder: (context, state) {
          if (state is LoadingProfileState) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.deepOrange),
            );
          } else if (state is SuccessProfileState) {
            final user = state.user;

            if (user == null) {
              return Center(child: Text("No user data"));
            }

            return Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Assets.image.background4.path),
                  fit: BoxFit.cover,
                ),
              ),
              child: SingleChildScrollView(
                padding: EdgeInsets.only(bottom: 100),
                child: Column(
                  children: [
                    const ProfileAppBarWidget(),
                    SizedBox(height: 24),
                    UserInformationWidget(userData: user),
                    SizedBox(height: 24),
                    //
                    ProfileOptionsSection(user: user),
                  ],
                ),
              ),
            );
          } else if (state is ErrorProfileState) {
            return Center(child: Text(state.message));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}

class ProfileAppBarWidget extends StatelessWidget {
  const ProfileAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;

    return Padding(
      padding: EdgeInsets.only(
        top: topPadding + 8,
        left: 16,
        right: 16,
        bottom: 8,
      ),
      child: SizedBox(
        width: double.infinity,
        height: 40,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Center(
              child: Text(
                "Profile",
                style: Theme.of(
                  context,
                ).textTheme.titleLarge!.copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
