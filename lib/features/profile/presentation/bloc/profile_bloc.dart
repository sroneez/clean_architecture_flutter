import 'package:clean_architecture_flutter/features/profile/presentation/bloc/event/profile_event.dart';
import 'package:clean_architecture_flutter/features/profile/presentation/bloc/state/profile_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<LoadProfileEvent>((event, emit) async {
      emit(ProfileLoading());
      try {
        await Future.delayed(Duration(seconds: 2));
        emit(ProfileLoaded(email: 'johndoe1234@gmail.com', name: "John Doe"));
      } catch (e) {
        emit(ProfileError(message: 'Failed to Fetch Profile'));
      }
    });
  }
}
