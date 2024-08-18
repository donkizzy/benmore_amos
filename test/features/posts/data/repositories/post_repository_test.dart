import 'package:benmore_amos/core/network/app_config.dart';
import 'package:benmore_amos/core/network/network_provider.dart';
import 'package:benmore_amos/features/posts/data/models/comment_response.dart';
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

  group('PostRepository fetchComment', () {


    test('returns CommentResponse on successful fetchComment', () async {
      when(mockNetworkProvider.call(path: AppConfig.fetchComment(postId), method: RequestMethod.get))
          .thenAnswer((_) async => Response(data: comments.toJson(), statusCode: 200, requestOptions: RequestOptions()));

      final result = await postRepository.fetchComment(postId);

      result.fold((l) => null, (r) {
        expect(r, isA<CommentResponse>());
        expect(r, equals(comments));
      });
    });

    test('returns error message on failed fetchComment', () async {
      when(mockNetworkProvider.call(path: AppConfig.fetchComment(postId), method: RequestMethod.get))
          .thenAnswer((_) async => Response(data: {'message': 'Comment not found'}, statusCode: 404, requestOptions: RequestOptions()));

      final result = await postRepository.fetchComment(postId);

      result.fold((l) {
        expect(l, isA<String>());
        expect(l, equals('Comment not found'));
      }, (r) => null);
    });

    test('returns DioException message on network error during fetchComment', () async {
      when(mockNetworkProvider.call(path: AppConfig.fetchComment(postId), method: RequestMethod.get))
          .thenThrow(DioException(requestOptions: RequestOptions(path: AppConfig.fetchComment(postId))));

      final result = await postRepository.fetchComment(postId);

      result.fold((l) {
        expect(l, isA<String>());
      }, (r) => null);
    });
  });

  group('PostRepository fetchPosts', () {

    test('returns PostsResponse on successful fetchPosts', () async {
      when(mockNetworkProvider.call(path: AppConfig.fetchPosts(1,userId), method: RequestMethod.get))
          .thenAnswer((_) async => Response(data: posts.toJson(), statusCode: 200, requestOptions: RequestOptions()));

      final result = await postRepository.fetchPosts(page: 1,userId: userId);

      result.fold((l) => null, (r) {
        expect(r, isA<PostsResponse>());
        expect(r, equals(posts));
      });
    });

    test('returns error message on failed fetchPosts', () async {
      when(mockNetworkProvider.call(path: AppConfig.fetchPosts(1,userId), method: RequestMethod.get))
          .thenAnswer((_) async => Response(data: {'message': 'Posts not found'}, statusCode: 404, requestOptions: RequestOptions()));

      final result = await postRepository.fetchPosts(page: 1,userId: userId);

      result.fold((l) {
        expect(l, isA<String>());
        expect(l, equals('Posts not found'));
      }, (r) => null);
    });

    test('returns DioException message on network error during fetchPosts', () async {
      when(mockNetworkProvider.call(path: AppConfig.fetchPosts(1,userId), method: RequestMethod.get))
          .thenThrow(DioException(requestOptions: RequestOptions(path: AppConfig.fetchPosts(1,userId))));

      final result = await postRepository.fetchPosts(page: 1,userId: userId);

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
}