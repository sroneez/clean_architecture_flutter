abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final String success;
  final String uid;

  AuthSuccess({required this.success, required this.uid});
}

class AuthFailed extends AuthState {
  final String error;

  AuthFailed({required this.error});
}
