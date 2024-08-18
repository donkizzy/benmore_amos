import 'package:benmore_amos/core/injector.dart';
import 'package:benmore_amos/features/posts/data/models/comment_response.dart';
import 'package:benmore_amos/features/posts/data/models/post_response.dart';
import 'package:benmore_amos/features/posts/data/repositories/post_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {

  late PostRepository _postRepository;

  PostCubit({PostRepository? postRepository}) : super(PostInitial()) {
    _postRepository = postRepository ?? sl<PostRepository>();
  }


  void fetchComments(String? postId) async {
    emit(FetchCommentsLoading());
    final result = await _postRepository.fetchComment(postId ?? '');
    result.fold(
          (l) => emit(FetchCommentError(error: l)),
          (r) => emit(FetchCommentSuccess(comments: r)),
    );
  }

  void fetchPosts({required int page, String? userId}) async {
    emit(FetchPostLoading());
    final result = await _postRepository.fetchPosts(page: page,userId: userId);
    result.fold(
          (l) => emit(FetchPostError(error: l)),
          (r) => emit(FetchPostSuccess(posts: r)),
    );
  }
}
