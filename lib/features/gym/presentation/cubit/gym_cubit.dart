import 'package:bloc/bloc.dart';

part 'gym_state.dart';

class GymCubit extends Cubit<GymState> {
  GymCubit() : super(GymInitial());
}
