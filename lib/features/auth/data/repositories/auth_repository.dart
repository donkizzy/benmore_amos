import 'package:benmore_amos/core/network/app_config.dart';
import 'package:benmore_amos/core/network/network_provider.dart';
import 'package:benmore_amos/features/auth/data/models/auth_response.dart';
import 'package:benmore_amos/features/auth/data/models/login_request.dart';
import 'package:benmore_amos/features/auth/data/models/register_request.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class AuthRepository {
  final NetworkProvider networkProvider ;

  AuthRepository({required this.networkProvider});

  Future<Either<String, AuthResponse>> login(LoginRequest loginRequest) async {
    try {
      final response = await networkProvider.call(path: AppConfig.login, method: RequestMethod.post,body: loginRequest.toJson());
      if (response?.statusCode == 200) {
        final authData = AuthResponse.fromJson(response?.data);
        return Right(authData);
      } else {
        return Left(response?.data['message']);
      }
    } on DioException catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, AuthResponse>> register(RegisterRequest registerRequest) async {
    try {
      final response = await networkProvider.call(path: AppConfig.register, method: RequestMethod.post,body: registerRequest.toJson());
      if (response?.statusCode == 200) {
        final authData = AuthResponse.fromJson(response?.data);
        return Right(authData);
      } else {
        return Left(response?.data['message']);
      }
    } on DioException catch (e) {
      return Left(e.toString());
    }
  }
}