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
  final  List<CommentResponse> comments ;

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

