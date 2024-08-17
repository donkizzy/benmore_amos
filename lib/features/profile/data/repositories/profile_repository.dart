import 'package:benmore_amos/core/network/app_config.dart';
import 'package:benmore_amos/core/network/network_provider.dart';
import 'package:benmore_amos/features/auth/data/models/auth_response.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ProfileRepository {

  final NetworkProvider networkProvider ;

  ProfileRepository({required this.networkProvider});


  Future<Either<String, AuthResponse>> fetchProfile(String userId) async {
    try {
      final response = await networkProvider.call(path: AppConfig.fetchUser(userId), method: RequestMethod.post,);
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

  Future<Either<String, AuthResponse>> toggleFollow(String postId) async {
    try {
      final response = await networkProvider.call(path: AppConfig.toggleFollow(postId), method: RequestMethod.post);
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