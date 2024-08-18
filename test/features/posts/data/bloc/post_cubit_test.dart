import 'package:benmore_amos/features/posts/data/bloc/post_cubit.dart';
import 'package:benmore_amos/features/posts/data/repositories/post_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../mock.dart';
import 'post_cubit_test.mocks.dart';


@GenerateMocks([PostRepository])
void main() {
  late PostCubit postCubit;
  late MockPostRepository mockPostRepository;

  setUp(() {
    mockPostRepository = MockPostRepository();
    postCubit = PostCubit(postRepository: mockPostRepository);
  });

  test('initial state is correct', () {
    expect(postCubit.state, PostInitial());
  });


  group('PostCubit fetchComments', () {


    blocTest<PostCubit, PostState>(
      'emits FetchCommentsLoading and then FetchCommentSuccess on successful fetchComments',
      build: () {
        when(mockPostRepository.fetchComment(postId)).thenAnswer((_) async => Right(comments));
        return postCubit;
      },
      act: (cubit) => cubit.fetchComments(postId),
      expect: () => [FetchCommentsLoading(), FetchCommentSuccess(comments: comments)],
    );

    blocTest<PostCubit, PostState>(
      'emits FetchCommentsLoading and then FetchCommentError on failed fetchComments',
      build: () {
        when(mockPostRepository.fetchComment(postId)).thenAnswer((_) async => const Left('Error fetching comments'));
        return postCubit;
      },
      act: (cubit) => cubit.fetchComments(postId),
      expect: () => [FetchCommentsLoading(), const FetchCommentError(error: 'Error fetching comments')],
    );

  });

  group('PostCubit fetchPosts', () {


    blocTest<PostCubit, PostState>(
      'emits FetchPostLoading and then FetchPostSuccess on successful fetchPosts',
      build: () {
        when(mockPostRepository.fetchPosts(page: 1)).thenAnswer((_) async => Right(posts));
        return postCubit;
      },
      act: (cubit) => cubit.fetchPosts(page: 1),
      expect: () => [FetchPostLoading(), FetchPostSuccess(posts: posts)],
    );

    blocTest<PostCubit, PostState>(
      'emits FetchPostLoading and then FetchPostError on failed fetchPosts',
      build: () {
        when(mockPostRepository.fetchPosts(page: 1)).thenAnswer((_) async => const Left('Error fetching posts'));
        return postCubit;
      },
      act: (cubit) => cubit.fetchPosts(page: 1),
      expect: () => [FetchPostLoading(), const FetchPostError(error: 'Error fetching posts')],
    );


  });

  group('PostCubit toggleLike', () {

    blocTest<PostCubit, PostState>(
      'emits ToggleLikeLoading and then ToggleLikeSuccess on successful toggleLike',
      build: () {
        when(mockPostRepository.toggleLike(postId))
            .thenAnswer((_) async => const Right(likeResponse));
        return postCubit;
      },
      act: (cubit) => cubit.toggleLike(postId),
      expect: () => [
        ToggleLikeLoading(),
        const ToggleLikeSuccess(likeResponse: likeResponse),
      ],
    );

    blocTest<PostCubit, PostState>(
      'emits ToggleLikeLoading and then ToggleLikeError on failed toggleLike',
      build: () {
        when(mockPostRepository.toggleLike(postId))
            .thenAnswer((_) async => const Left('Action failed'));
        return postCubit;
      },
      act: (cubit) => cubit.toggleLike(postId),
      expect: () => [
        ToggleLikeLoading(),
        const ToggleLikeError(error: 'Action failed'),
      ],
    );
  });


  group('PostCubit createPost', () {


    blocTest<PostCubit, PostState>(
      'emits CreatePostLoading and then CreatePostSuccess on successful createPost',
      build: () {
        when(mockPostRepository.createPost(createPostRequest: createPostRequest,file: file))
            .thenAnswer((_) async => Right(createPostResponse));
        return postCubit;
      },
      act: (cubit) => cubit.createPost(createPostRequest: createPostRequest,file: file),
      expect: () => [
        CreatePostLoading(),
        CreatePostSuccess(createPostResponse: createPostResponse),
      ],
    );

    blocTest<PostCubit, PostState>(
      'emits CreatePostLoading and then CreatePostError on failed createPost',
      build: () {
        when(mockPostRepository.createPost(createPostRequest: createPostRequest,file: file))
            .thenAnswer((_) async => const Left('Creation failed'));
        return postCubit;
      },
      act: (cubit) => cubit.createPost(createPostRequest: createPostRequest,file: file),
      expect: () => [
        CreatePostLoading(),
        const CreatePostError(error: 'Creation failed'),
      ],
    );
  });

  group('PostCubit updatePost', () {

    blocTest<PostCubit, PostState>(
      'emits UpdatePostLoading and then UpdatePostSuccess on successful updatePost',
      build: () {
        when(mockPostRepository.updatePost(postId: postId, createPostRequest: createPostRequest))
            .thenAnswer((_) async => Right(createPostResponse));
        return postCubit;
      },
      act: (cubit) => cubit.updatePost(postId: postId, createPostRequest: createPostRequest),
      expect: () => [
        UpdatePostLoading(),
        UpdatePostSuccess(updatePostResponse: createPostResponse),
      ],
    );

    blocTest<PostCubit, PostState>(
      'emits UpdatePostLoading and then UpdatePostError on failed updatePost',
      build: () {
        when(mockPostRepository.updatePost(postId: postId, createPostRequest: createPostRequest))
            .thenAnswer((_) async => const Left('Update failed'));
        return postCubit;
      },
      act: (cubit) => cubit.updatePost(postId: postId, createPostRequest: createPostRequest),
      expect: () => [
        UpdatePostLoading(),
        const UpdatePostError(error: 'Update failed'),
      ],
    );
  });

  group('PostCubit deletePost', () {

    blocTest<PostCubit, PostState>(
      'emits DeletePostLoading and then DeletePostSuccess on successful deletePost',
      build: () {
        when(mockPostRepository.deletePost(postId))
            .thenAnswer((_) async => const Right(null));
        return postCubit;
      },
      act: (cubit) => cubit.deletePost(postId),
      expect: () => [
        DeletePostLoading(),
        DeletePostSuccess(),
      ],
    );

    blocTest<PostCubit, PostState>(
      'emits DeletePostLoading and then DeletePostError on failed deletePost',
      build: () {
        when(mockPostRepository.deletePost(postId))
            .thenAnswer((_) async => const Left('Deletion failed'));
        return postCubit;
      },
      act: (cubit) => cubit.deletePost(postId),
      expect: () => [
        DeletePostLoading(),
        const DeletePostError(error: 'Deletion failed'),
      ],
    );
  });
}