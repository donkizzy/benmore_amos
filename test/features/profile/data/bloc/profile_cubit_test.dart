import 'package:benmore_amos/features/profile/data/bloc/profile_cubit.dart';
import 'package:benmore_amos/features/profile/data/repositories/profile_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:bloc_test/bloc_test.dart';

import '../../../../mock.dart';
import 'profile_cubit_test.mocks.dart';

@GenerateMocks([ProfileRepository])
void main() {
  late ProfileCubit profileCubit;
  late MockProfileRepository mockProfileRepository;

  setUp(() {
    mockProfileRepository = MockProfileRepository();
    profileCubit = ProfileCubit(postRepository: mockProfileRepository);
  });
  test('initial state is correct', () {
    expect(profileCubit.state, ProfileInitial());
  });

  group('ProfileCubit fetchProfile', () {
    blocTest<ProfileCubit, ProfileState>(
      'emits FetchProfileLoading and then FetchProfileSuccess on successful fetchProfile',
      build: () {
        when(mockProfileRepository.fetchProfile(userId))
            .thenAnswer((_) async => Right(profileResponse));
        return profileCubit;
      },
      act: (cubit) => cubit.fetchProfile(userId),
      expect: () => [
        FetchProfileLoading(),
        FetchProfileSuccess(profile: profileResponse),
      ],
    );

    blocTest<ProfileCubit, ProfileState>(
      'emits FetchProfileLoading and then FetchProfileError on failed fetchProfile',
      build: () {
        when(mockProfileRepository.fetchProfile(userId))
            .thenAnswer((_) async => const Left('User not found'));
        return profileCubit;
      },
      act: (cubit) => cubit.fetchProfile(userId),
      expect: () => [
        FetchProfileLoading(),
        const FetchProfileError(error: 'User not found'),
      ],
    );
  });

  group('ProfileCubit toggleFollow', () {

    blocTest<ProfileCubit, ProfileState>(
      'emits ToggleFollowLoading and then ToggleFollowSuccess on successful toggleFollow',
      build: () {
        when(mockProfileRepository.toggleFollow(postId))
            .thenAnswer((_) async => Right(followResponse));
        return profileCubit;
      },
      act: (cubit) => cubit.toggleFollow(postId),
      expect: () => [
        ToggleFollowLoading(),
        ToggleFollowSuccess(followResponse: followResponse),
      ],
    );

    blocTest<ProfileCubit, ProfileState>(
      'emits ToggleFollowLoading and then ToggleFollowError on failed toggleFollow',
      build: () {
        when(mockProfileRepository.toggleFollow(postId))
            .thenAnswer((_) async => const Left('Action failed'));
        return profileCubit;
      },
      act: (cubit) => cubit.toggleFollow(postId),
      expect: () => [
        ToggleFollowLoading(),
        const ToggleFollowError(error: 'Action failed'),
      ],
    );
  });
}