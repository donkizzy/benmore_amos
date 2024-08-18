import 'package:benmore_amos/core/network/app_config.dart';
import 'package:benmore_amos/core/network/network_provider.dart';
import 'package:benmore_amos/features/posts/data/models/follow_response.dart';
import 'package:benmore_amos/features/posts/data/models/profile_response.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ProfileRepository {

  final NetworkProvider networkProvider ;

  ProfileRepository({required this.networkProvider});


  Future<Either<String, ProfileResponse>> fetchProfile(String userId) async {
    try {
      final response = await networkProvider.call(path: AppConfig.fetchUser(userId), method: RequestMethod.get,);
      if (response?.statusCode == 200) {
        final authData = ProfileResponse.fromJson(response?.data);
        return Right(authData);
      } else {
        return Left(response?.data['message']);
      }
    } on DioException catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, FollowResponse>> toggleFollow(String userId) async {
    try {
      final response = await networkProvider.call(path: AppConfig.toggleFollow(userId), method: RequestMethod.post);
      if (response?.statusCode == 200) {
        final authData = FollowResponse.fromJson(response?.data);
        return Right(authData);
      } else {
        return Left(response?.data['message']);
      }
    } on DioException catch (e) {
      return Left(e.toString());
    }
  }
}