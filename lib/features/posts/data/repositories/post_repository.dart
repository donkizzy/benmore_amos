import 'package:benmore_amos/core/network/app_config.dart';
import 'package:benmore_amos/core/network/network_provider.dart';
import 'package:benmore_amos/features/posts/data/models/comment_response.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class PostRepository{
  final NetworkProvider networkProvider ;

  PostRepository({required this.networkProvider});

  Future<Either<String,  List<CommentResponse>>> fetchComment(String postId) async {
    try {
      final response = await networkProvider.call(path: AppConfig.fetchComment(postId), method: RequestMethod.post);
      if (response?.statusCode == 200) {
        final authData = List<CommentResponse>.from(response?.data.map((x) => CommentResponse.fromJson(x)));
        return Right(authData);
      } else {
        return Left(response?.data['message']);
      }
    } on DioException catch (e) {
      return Left(e.toString());
    }
  }

}