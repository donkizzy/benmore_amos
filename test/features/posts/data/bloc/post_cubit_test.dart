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
}