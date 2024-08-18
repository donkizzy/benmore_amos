part of 'post_cubit.dart';

sealed class PostState extends Equatable {
  const PostState();
}

final class PostInitial extends PostState {
  @override
  List<Object> get props => [];
}

final class FetchCommentsLoading extends PostState {
  @override
  List<Object> get props => [];
}

final class FetchCommentSuccess extends PostState {
  final  CommentResponse comments ;

  const FetchCommentSuccess({required this.comments});
  @override
  List<Object> get props => [comments];
}

final class FetchCommentError extends PostState {
  final String error ;

  const FetchCommentError({required this.error});

  @override
  List<Object> get props => [error];
}


final class FetchPostLoading extends PostState {
  @override
  List<Object> get props => [];
}

final class FetchPostSuccess extends PostState {
  final  PostsResponse posts ;

  const FetchPostSuccess({required this.posts});
  @override
  List<Object> get props => [posts];
}

final class FetchPostError extends PostState {
  final String error ;

  const FetchPostError({required this.error});

  @override
  List<Object> get props => [error];
}


final class ToggleLikeLoading extends PostState {
  @override
  List<Object> get props => [];
}

final class ToggleLikeSuccess extends PostState {
  final LikeResponse likeResponse;

  const ToggleLikeSuccess({required this.likeResponse});
  @override
  List<Object> get props => [likeResponse];
}

final class ToggleLikeError extends PostState {
  final String error ;

  const ToggleLikeError({required this.error});
  @override
  List<Object> get props => [error];
}


class CreatePostLoading extends PostState {
  @override
  List<Object?> get props => [];
}

class CreatePostSuccess extends PostState {
  final CreatePostResponse createPostResponse;

  const CreatePostSuccess({required this.createPostResponse});

  @override
  List<Object> get props => [createPostResponse];
}

class CreatePostError extends PostState {
  final String error;

  const CreatePostError({required this.error});

  @override
  List<Object> get props => [error];
}

class UpdatePostLoading extends PostState {
  @override
  List<Object?> get props => [];
}

class UpdatePostSuccess extends PostState {
  final CreatePostResponse updatePostResponse;

  const UpdatePostSuccess({required this.updatePostResponse});

  @override
  List<Object> get props => [updatePostResponse];
}

class UpdatePostError extends PostState {
  final String error;

  const UpdatePostError({required this.error});

  @override
  List<Object> get props => [error];
}

class DeletePostLoading extends PostState {
  @override
  List<Object?> get props => [];
}

class DeletePostSuccess extends PostState {
  @override
  List<Object?> get props => [];
}

class DeletePostError extends PostState {
  final String error;

  const DeletePostError({required this.error});

  @override
  List<Object> get props => [error];
}

