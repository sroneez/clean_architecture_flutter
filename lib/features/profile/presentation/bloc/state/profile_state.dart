abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final String email;
  final String name;

  ProfileLoaded({required this.email, required this.name});
}

class ProfileError extends ProfileState {
  final String message;

  ProfileError({required this.message});
}
