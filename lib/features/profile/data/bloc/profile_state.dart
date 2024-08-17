part of 'profile_cubit.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();
}

final class ProfileInitial extends ProfileState {
  @override
  List<Object> get props => [];
}

final class FetchProfileLoading extends ProfileState {
  @override
  List<Object> get props => [];
}

final class FetchProfileSuccess extends ProfileState {
  final AuthResponse profile;

  const FetchProfileSuccess({required this.profile});
  @override
  List<Object> get props => [];
}

final class FetchProfileError extends ProfileState {
  final String error ;

  const FetchProfileError({required this.error});
  @override
  List<Object> get props => [error];
}
