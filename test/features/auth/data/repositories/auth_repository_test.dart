import 'package:benmore_amos/core/network/app_config.dart';
import 'package:benmore_amos/core/network/network_provider.dart';
import 'package:benmore_amos/features/auth/data/models/auth_response.dart';
import 'package:benmore_amos/features/auth/data/repositories/auth_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../mock.dart';
import 'auth_repository_test.mocks.dart';

@GenerateMocks([NetworkProvider])
void main() {
  late AuthRepository authRepository;
  late MockNetworkProvider mockNetworkProvider;

  setUp(() {
    mockNetworkProvider = MockNetworkProvider();
    authRepository = AuthRepository(networkProvider: mockNetworkProvider);
  });

  group('Login', () {

    test('returns AuthResponse on successful login', () async {
      when(mockNetworkProvider.call(path: AppConfig.login, method: RequestMethod.post, body: loginRequest.toJson()))
          .thenAnswer(
              (_) async => Response(data: authResponse.toJson(), statusCode: 200, requestOptions: RequestOptions()));
      final result = await authRepository.login(loginRequest);
      result.fold((l) => null, (r) {
        expect(r, isA<AuthResponse>());
        expect(r, equals(authResponse));
      });

    });

    test('returns error message on failed login', () async {
      when(mockNetworkProvider.call(path: AppConfig.login, method: RequestMethod.post, body: loginRequest.toJson()))
          .thenAnswer((_) async =>
              Response(data: {'message': 'Invalid credentials'}, statusCode: 401, requestOptions: RequestOptions()));

      final result = await authRepository.login(loginRequest);
      result.fold((l) {
        expect(l, isA<String>());
        expect(l, equals('Invalid credentials'));
      }, (r) => null);

    });

    test('returns DioException message on network error during login', () async {
      when(mockNetworkProvider.call(path: AppConfig.login, method: RequestMethod.post, body: loginRequest.toJson()))
          .thenThrow(DioException(requestOptions: RequestOptions(),type: DioExceptionType.connectionTimeout,));

      final result = await authRepository.login(loginRequest);

      result.fold((l) {
        expect(l, isA<String>());
      }, (r) => null);
    });

  });

  group('Register', (){
    test('returns AuthResponse on successful registration', () async {
      when(mockNetworkProvider.call(
          path: AppConfig.register, method: RequestMethod.post, body: registerRequest.toJson()))
          .thenAnswer(
              (_) async => Response(data: authResponse.toJson(), statusCode: 200, requestOptions: RequestOptions()));

      final result = await authRepository.register(registerRequest);

      result.fold((l) => null, (r) {
        expect(r, isA<AuthResponse>());
        expect(r, equals(authResponse));
      });
    });

    test('returns error message on failed registration', () async {
      when(mockNetworkProvider.call(
          path: AppConfig.register, method: RequestMethod.post, body: registerRequest.toJson()))
          .thenAnswer((_) async =>
          Response(data: {'message': 'Email already exists'}, statusCode: 400, requestOptions: RequestOptions()));

      final result = await authRepository.register(registerRequest);

      result.fold((l) {
        expect(l, isA<String>());
        expect(l, equals('Email already exists'));
      }, (r) => null);
    });

    test('returns DioException message on network error during registration', () async {
      when(mockNetworkProvider.call(
          path: AppConfig.register, method: RequestMethod.post, body: registerRequest.toJson()))
          .thenThrow(DioException(requestOptions: RequestOptions(path: AppConfig.register)));

      final result = await authRepository.register(registerRequest);

      result.fold((l) {
        expect(l, isA<String>());
      }, (r) => null);

    });
  });
}
