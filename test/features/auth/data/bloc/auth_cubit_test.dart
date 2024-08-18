import 'package:benmore_amos/core/storage_manager.dart';
import 'package:benmore_amos/features/auth/data/bloc/auth_cubit.dart';
import 'package:benmore_amos/features/auth/data/repositories/auth_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../mock.dart';
import 'auth_cubit_test.mocks.dart';

@GenerateMocks([AuthRepository, StorageManager])
void main() {
  late AuthCubit authCubit;
  late MockAuthRepository mockAuthRepository;
  late MockStorageManager mockStorageManager;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    mockStorageManager = MockStorageManager();
    authCubit = AuthCubit(authRepository: mockAuthRepository, storageManager: mockStorageManager);
  });
  test('initial state is correct', () {
    expect(authCubit.state, AuthInitial());
  });
  group('AuthCubit login', () {

    blocTest<AuthCubit, AuthState>(
      'emits LoginLoading and then LoginSuccess on successful login',
      build: () {
        when(mockAuthRepository.login(loginRequest)).thenAnswer((_) async =>  Right(authResponse));
        when(mockStorageManager.saveToken(any)).thenAnswer((_) async => authResponse.token);
        when(mockStorageManager.saveUserId(any)).thenAnswer((_) async => authResponse.user?.email);
        return authCubit;
      },
      act: (cubit) => cubit.login(loginRequest),
      expect: () => [LoginLoading(),  LoginSuccess(authResponse: authResponse)],
    );

    blocTest<AuthCubit, AuthState>(
      'emits LoginLoading and then LoginError on failed login',
      build: () {
        when(mockAuthRepository.login(loginRequest)).thenAnswer((_) async => const Left('Invalid credentials'));
        return authCubit;
      },
      act: (cubit) => cubit.login(loginRequest),
      expect: () => [LoginLoading(), const LoginError(error: 'Invalid credentials')],
    );

    blocTest<AuthCubit, AuthState>(
      'emits LoginError on exception during login',
      build: () {
        when(mockAuthRepository.login(loginRequest)).thenThrow(DioException(requestOptions: RequestOptions(),type: DioExceptionType.cancel,));
        return authCubit;
      },
      act: (cubit) => cubit.login(loginRequest),
      expect: () => [isA<LoginLoading>(),  isA<LoginError>()],
    );
  });

  group('AuthCubit register', () {

    blocTest<AuthCubit, AuthState>(
      'emits RegisterLoading and then RegisterSuccess on successful registration',
      build: () {
        when(mockAuthRepository.register(registerRequest)).thenAnswer((_) async =>  Right(authResponse));
        return authCubit;
      },
      act: (cubit) => cubit.register(registerRequest),
      expect: () => [RegisterLoading(),  RegisterSuccess(authResponse: authResponse)],
    );

    blocTest<AuthCubit, AuthState>(
      'emits RegisterLoading and then RegisterError on failed registration',
      build: () {
        when(mockAuthRepository.register(registerRequest)).thenAnswer((_) async => const Left('Email already exists'));
        return authCubit;
      },
      act: (cubit) => cubit.register(registerRequest),
      expect: () => [RegisterLoading(), const RegisterError(error: 'Email already exists')],
    );

    blocTest<AuthCubit, AuthState>(
      'emits RegisterError on exception during registration',
      build: () {
        when(mockAuthRepository.register(registerRequest)).thenThrow(Exception('Network error'));
        return authCubit;
      },
      act: (cubit) => cubit.register(registerRequest),
      expect: () => [RegisterLoading(), const RegisterError(error: 'Exception: Network error')],
    );
  });
}