import 'package:clean_architecture_flutter/features/auth/domain/repository/auth_repository.dart';
import 'package:clean_architecture_flutter/features/auth/presentation/bloc/auth_event.dart';
import 'package:clean_architecture_flutter/features/auth/presentation/bloc/auth_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repository;

  AuthBloc({required this.repository}) : super(AuthInitial()) {
    on<LoginRequested>((event, emit) async {
      emit(AuthLoading());

      try {
        // if (event.password.length <= 4) {
        //   return emit(AuthFailed(error: "Password cannot be less then 3 char"));
        // }
        final token = await repository.login(event.email, event.password);
        emit(AuthSuccess(success: 'Login success', uid: token));

        // await Future.delayed(Duration(seconds: 3));
      } catch (e) {
        emit(AuthFailed(error: e.toString()));
        debugPrint(e.toString());
      }
    });

    on<LogoutRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        await Future.delayed(Duration(seconds: 2));
        emit(AuthInitial());
      } catch (e) {
        emit(AuthFailed(error: e.toString()));
      }
    });
  }
}
