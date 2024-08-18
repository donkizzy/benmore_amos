import 'dart:io';

import 'package:benmore_amos/core/injector.dart';
import 'package:benmore_amos/features/posts/data/models/comment_response.dart';
import 'package:benmore_amos/features/posts/data/models/create_post_request.dart';
import 'package:benmore_amos/features/posts/data/models/create_post_response.dart';
import 'package:benmore_amos/features/posts/data/models/like_response.dart';
import 'package:benmore_amos/features/posts/data/models/post_response.dart';
import 'package:benmore_amos/features/posts/data/repositories/post_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {

  List<Post>? posts = [];
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

  void fetchPosts({required int page, String? userId,bool isPagination = false}) async {
    if(!isPagination){
      emit(FetchPostLoading());
    }
    final result = await _postRepository.fetchPosts(page: page,userId: userId);
    result.fold(
          (l) => emit(FetchPostError(error: l)),
          (r) {
            posts?.addAll(r.posts ?? []);
            emit(FetchPostSuccess(posts: r));
          },
    );
  }

  void toggleLike(String postId) async {
    emit(ToggleLikeLoading());
    final result = await _postRepository.toggleLike(postId);
    result.fold(
          (l) => emit(ToggleLikeError(error: l)),
          (r) => emit(ToggleLikeSuccess(likeResponse: r)),
    );
  }

  void createPost({required CreatePostRequest createPostRequest,required File? file}) async {
    emit(CreatePostLoading());
    final result = await _postRepository.createPost(createPostRequest: createPostRequest, file: file);
    result.fold(
          (l) => emit(CreatePostError(error: l)),
          (r) {
            posts?.insert(0, r.post!);
            emit(FetchPostSuccess(posts: PostsResponse(posts: posts)));
            emit(CreatePostSuccess(createPostResponse: r));
          },
    );
  }

  void updatePost({required String postId, required CreatePostRequest createPostRequest, File? file}) async {
    emit(UpdatePostLoading());
    final result = await _postRepository.updatePost(postId: postId, createPostRequest: createPostRequest,file: file);
    result.fold(
          (l) => emit(UpdatePostError(error: l)),
          (r) => emit(UpdatePostSuccess(updatePostResponse: r)),
    );
  }

  void deletePost(String postId) async {
    emit(DeletePostLoading());
    final result = await _postRepository.deletePost(postId);
    result.fold(
          (l) => emit(DeletePostError(error: l)),
          (r) => emit(DeletePostSuccess()),
    );
  }
}
