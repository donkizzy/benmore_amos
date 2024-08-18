import 'package:benmore_amos/core/network/app_config.dart';
import 'package:benmore_amos/core/network/network_provider.dart';
import 'package:benmore_amos/features/posts/data/models/comment_response.dart';
import 'package:benmore_amos/features/posts/data/models/like_response.dart';
import 'package:benmore_amos/features/posts/data/models/post_response.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class PostRepository{
  final NetworkProvider networkProvider ;

  PostRepository({required this.networkProvider});

  Future<Either<String,  CommentResponse>> fetchComment(String postId) async {
    try {
      final response = await networkProvider.call(path: AppConfig.fetchComment(postId), method: RequestMethod.get);
      if (response?.statusCode == 200) {
        final comments =  CommentResponse.fromJson(response?.data);
        return Right(comments);
      } else {
        return Left(response?.data['message']);
      }
    } on DioException catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, PostsResponse>> fetchPosts({required int page,String? userId}) async {
    try {
      final response = await networkProvider.call(path: AppConfig.fetchPosts(page,userId), method: RequestMethod.get);
      if (response?.statusCode == 200) {
        final posts =  PostsResponse.fromJson(response?.data);
        return Right(posts);
      } else {
        return Left(response?.data['message']);
      }
    } on DioException catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, LikeResponse>> toggleLike( String? postId) async {
    try {
      final response = await networkProvider.call(path: AppConfig.toggleLike(postId!), method: RequestMethod.get);
      if (response?.statusCode == 200) {
        final likes =  LikeResponse.fromJson(response?.data);
        return Right(likes);
      } else {
        return Left(response?.data['message']);
      }
    } on DioException catch (e) {
      return Left(e.toString());
    }
  }

}