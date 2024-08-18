import 'package:benmore_amos/core/network/app_config.dart';
import 'package:benmore_amos/core/network/network_provider.dart';
import 'package:benmore_amos/features/posts/data/models/follow_response.dart';
import 'package:benmore_amos/features/posts/data/models/profile_response.dart';
import 'package:benmore_amos/features/profile/data/repositories/profile_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../mock.dart';
import '../../../auth/data/repositories/auth_repository_test.mocks.dart';

void main() {
  late ProfileRepository profileRepository;
  late MockNetworkProvider mockNetworkProvider;

  setUp(() {
    mockNetworkProvider = MockNetworkProvider();
    profileRepository = ProfileRepository(networkProvider: mockNetworkProvider);
  });

  group('ProfileRepository fetchProfile', () {


    test('returns ProfileResponse on successful fetchProfile', () async {
      when(mockNetworkProvider.call(path: AppConfig.fetchUser(userId), method: RequestMethod.get))
          .thenAnswer((_) async => Response(data: profileResponse.toJson(), statusCode: 200, requestOptions: RequestOptions()));

      final result = await profileRepository.fetchProfile(userId);

      result.fold((l) => null, (r) {
        expect(r, isA<ProfileResponse>());
        expect(r, equals(profileResponse));
      });
    });

    test('returns error message on failed fetchProfile', () async {
      when(mockNetworkProvider.call(path: AppConfig.fetchUser(userId), method: RequestMethod.get))
          .thenAnswer((_) async => Response(data: {'message': 'User not found'}, statusCode: 404,requestOptions: RequestOptions()));

      final result = await profileRepository.fetchProfile(userId);

      result.fold((l) {
        expect(l, isA<String>());
        expect(l, equals('User not found'));
      }, (r) => null);
    });

    test('returns DioException message on network error during fetchProfile', () async {
      when(mockNetworkProvider.call(path: AppConfig.fetchUser(userId), method: RequestMethod.get))
          .thenThrow(DioException(requestOptions: RequestOptions(path: AppConfig.fetchUser(userId))));

      final result = await profileRepository.fetchProfile(userId);

      result.fold((l) {
        expect(l, isA<String>());
      }, (r) => null);
    });
  });

  group('ProfileRepository toggleFollow', () {

    test('returns FollowResponse on successful toggleFollow', () async {
      when(mockNetworkProvider.call(path: AppConfig.toggleFollow(postId), method: RequestMethod.post))
          .thenAnswer((_) async => Response(data: followResponse.toJson(), statusCode: 200,requestOptions: RequestOptions()));

      final result = await profileRepository.toggleFollow(postId);

      result.fold((l) => null, (r) {
        expect(r, isA<FollowResponse>());
        expect(r, equals(followResponse));
      });

    });

    test('returns error message on failed toggleFollow', () async {
      when(mockNetworkProvider.call(path: AppConfig.toggleFollow(postId), method: RequestMethod.post))
          .thenAnswer((_) async => Response(data: {'message': 'Action failed'}, statusCode: 400,requestOptions: RequestOptions()));

      final result = await profileRepository.toggleFollow(postId);

      result.fold((l) {
        expect(l, isA<String>());
        expect(l, equals('Action failed'));
      }, (r) => null);
    });

    test('returns DioException message on network error during toggleFollow', () async {
      when(mockNetworkProvider.call(path: AppConfig.toggleFollow(postId), method: RequestMethod.post))
          .thenThrow(DioException(requestOptions: RequestOptions(path: AppConfig.toggleFollow(postId))));

      final result = await profileRepository.toggleFollow(postId);

      result.fold((l) {
        expect(l, isA<String>());
      }, (r) => null);
    });
  });
}