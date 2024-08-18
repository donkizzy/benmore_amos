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
  final ProfileResponse profile;

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


final class ToggleFollowLoading extends ProfileState {
  @override
  List<Object> get props => [];
}

final class ToggleFollowSuccess extends ProfileState {
  final FollowResponse followResponse;

  const ToggleFollowSuccess({required this.followResponse});
  @override
  List<Object> get props => [followResponse];
}

final class ToggleFollowError extends ProfileState {
  final String error ;

  const ToggleFollowError({required this.error});
  @override
  List<Object> get props => [error];
}


final class ToggleLikeLoading extends ProfileState {
  @override
  List<Object> get props => [];
}

final class ToggleLikeSuccess extends ProfileState {
  final FollowResponse followResponse;

  const ToggleLikeSuccess({required this.followResponse});
  @override
  List<Object> get props => [followResponse];
}

final class ToggleLikeError extends ProfileState {
  final String error ;

  const ToggleLikeError({required this.error});
  @override
  List<Object> get props => [error];
}
