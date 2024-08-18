import 'package:benmore_amos/core/network/app_config.dart';
import 'package:benmore_amos/core/network/network_provider.dart';
import 'package:benmore_amos/features/posts/data/models/create_post_response.dart';
import 'package:benmore_amos/features/posts/data/models/like_response.dart';
import 'package:benmore_amos/features/posts/data/models/post_response.dart';
import 'package:benmore_amos/features/posts/data/repositories/post_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../mock.dart';
import '../../../auth/data/repositories/auth_repository_test.mocks.dart';

void main() {
  late PostRepository postRepository;
  late MockNetworkProvider mockNetworkProvider;

  setUp(() {
    mockNetworkProvider = MockNetworkProvider();
    postRepository = PostRepository(networkProvider: mockNetworkProvider);
  });

  group('PostRepository fetchPosts', () {


    test('returns PostsResponse on successful fetchPosts', () async {
      when(mockNetworkProvider.call(path: AppConfig.fetchPosts(1, userId), method: RequestMethod.get))
          .thenAnswer((_) async => Response(data: posts.toJson(), statusCode: 200, requestOptions: RequestOptions()));

      final result = await postRepository.fetchPosts(page: 1, userId: userId);

      result.fold((l) => null, (r) {
        expect(r, isA<PostsResponse>());
        expect(r, equals(posts));
      });
    });

    test('returns error message on failed fetchPosts', () async {
      when(mockNetworkProvider.call(path: AppConfig.fetchPosts(1, userId), method: RequestMethod.get))
          .thenAnswer((_) async => Response(data: {'message': 'Posts not found'}, statusCode: 404, requestOptions: RequestOptions()));

      final result = await postRepository.fetchPosts(page: 1, userId: userId);

      result.fold((l) {
        expect(l, isA<String>());
        expect(l, equals('Posts not found'));
      }, (r) => null);
    });

    test('returns DioException message on network error during fetchPosts', () async {
      when(mockNetworkProvider.call(path: AppConfig.fetchPosts(1, userId), method: RequestMethod.get))
          .thenThrow(DioException(requestOptions: RequestOptions(path: AppConfig.fetchPosts(1, userId))));

      final result = await postRepository.fetchPosts(page: 1, userId: userId);

      result.fold((l) {
        expect(l, isA<String>());
      }, (r) => null);
    });
  });

  group('PostRepository toggleLike', () {

    test('returns LikeResponse on successful toggleLike', () async {
      when(mockNetworkProvider.call(path: AppConfig.toggleLike(postId), method: RequestMethod.get))
          .thenAnswer((_) async => Response(data: likeResponse.toJson(), statusCode: 200, requestOptions: RequestOptions()));

      final result = await postRepository.toggleLike(postId);

      result.fold((l) => null, (r) {
        expect(r, isA<LikeResponse>());
        expect(r, equals(likeResponse));
      });
    });

    test('returns error message on failed toggleLike', () async {
      when(mockNetworkProvider.call(path: AppConfig.toggleLike(postId), method: RequestMethod.get))
          .thenAnswer((_) async => Response(data: {'message': 'Action failed'}, statusCode: 400, requestOptions: RequestOptions()));

      final result = await postRepository.toggleLike(postId);

      result.fold((l) {
        expect(l, isA<String>());
        expect(l, equals('Action failed'));
      }, (r) => null);
    });

    test('returns DioException message on network error during toggleLike', () async {
      when(mockNetworkProvider.call(path: AppConfig.toggleLike(postId), method: RequestMethod.get))
          .thenThrow(DioException(requestOptions: RequestOptions(path: AppConfig.toggleLike(postId))));

      final result = await postRepository.toggleLike(postId);

      result.fold((l) {
        expect(l, isA<String>());
      }, (r) => null);
    });
  });

  group('PostRepository createPost', () {

    test('returns CreatePostResponse on successful createPost', () async {
      when(mockNetworkProvider.call(
        path: AppConfig.createPost,
        method: RequestMethod.upload,
        body: anyNamed('body'),
      )).thenAnswer((_) async => Response(data: createPostResponse.toJson(), statusCode: 200, requestOptions: RequestOptions()));

      final result = await postRepository.createPost(createPostRequest: createPostRequest, file: file);

      result.fold((l) => null, (r) {
        expect(r, isA<CreatePostResponse>());
        expect(r, equals(createPostResponse));
      });
    });

    test('returns error message on failed createPost', () async {
      when(mockNetworkProvider.call(
        path: AppConfig.createPost,
        method: RequestMethod.upload,
        body: anyNamed('body'),
      )).thenAnswer((_) async => Response(data: {'message': 'Creation failed'}, statusCode: 400, requestOptions: RequestOptions()));

      final result = await postRepository.createPost(createPostRequest: createPostRequest, file: file);

      result.fold((l) {
        expect(l, isA<String>());
        expect(l, equals('Creation failed'));
      }, (r) => null);
    });

    test('returns DioException message on network error during createPost', () async {
      when(mockNetworkProvider.call(
        path: AppConfig.createPost,
        method: RequestMethod.upload,
        body: anyNamed('body'),
      )).thenThrow(DioException(requestOptions: RequestOptions(path: AppConfig.createPost)));

      final result = await postRepository.createPost(createPostRequest: createPostRequest, file: file);

      result.fold((l) {
        expect(l, isA<String>());
      }, (r) => null);
    });
  });

  group('PostRepository updatePost', () {

    test('returns CreatePostResponse on successful updatePost', () async {
      when(mockNetworkProvider.call(
        path: AppConfig.posts(postId),
        method: RequestMethod.put,
        body: anyNamed('body'),
      )).thenAnswer((_) async => Response(data: createPostResponse.toJson(), statusCode: 200, requestOptions: RequestOptions()));

      final result = await postRepository.updatePost(postId: postId, createPostRequest: createPostRequest, file: file);

      result.fold((l) => null, (r) {
        expect(r, isA<CreatePostResponse>());
        expect(r, equals(createPostResponse));
      });
    });

    test('returns error message on failed updatePost', () async {
      when(mockNetworkProvider.call(
        path: AppConfig.posts(postId),
        method: RequestMethod.put,
        body: anyNamed('body'),
      )).thenAnswer((_) async => Response(data: {'message': 'Update failed'}, statusCode: 400, requestOptions: RequestOptions()));

      final result = await postRepository.updatePost(postId: postId, createPostRequest: createPostRequest, file: file);

      result.fold((l) {
        expect(l, isA<String>());
        expect(l, equals('Update failed'));
      }, (r) => null);
    });

    test('returns DioException message on network error during updatePost', () async {
      when(mockNetworkProvider.call(
        path: AppConfig.posts(postId),
        method: RequestMethod.put,
        body: anyNamed('body'),
      )).thenThrow(DioException(requestOptions: RequestOptions(path: AppConfig.posts(postId))));

      final result = await postRepository.updatePost(postId: postId, createPostRequest: createPostRequest, file: file);

      result.fold((l) {
        expect(l, isA<String>());
      }, (r) => null);
    });
  });

  group('PostRepository deletePost', () {


    test('returns void on successful deletePost', () async {
      when(mockNetworkProvider.call(path: AppConfig.posts(postId), method: RequestMethod.delete))
          .thenAnswer((_) async => Response(statusCode: 200, requestOptions: RequestOptions()));

      final result = await postRepository.deletePost(postId);

      result.fold((l) => null, (r) {

      });
    });

    test('returns error message on failed deletePost', () async {
      when(mockNetworkProvider.call(path: AppConfig.posts(postId), method: RequestMethod.delete))
          .thenAnswer((_) async => Response(data: {'message': 'Deletion failed'}, statusCode: 400, requestOptions: RequestOptions()));

      final result = await postRepository.deletePost(postId);

      result.fold((l) {
        expect(l, isA<String>());
        expect(l, equals('Deletion failed'));
      }, (r) => null);
    });

    test('returns DioException message on network error during deletePost', () async {
      when(mockNetworkProvider.call(path: AppConfig.posts(postId), method: RequestMethod.delete))
          .thenThrow(DioException(requestOptions: RequestOptions(path: AppConfig.posts(postId))));

      final result = await postRepository.deletePost(postId);

      result.fold((l) {
        expect(l, isA<String>());
      }, (r) => null);
    });
  });
}