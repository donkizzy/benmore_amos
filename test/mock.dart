import 'dart:io';

import 'package:benmore_amos/features/auth/data/models/login_request.dart';
import 'package:benmore_amos/features/auth/data/models/register_request.dart';
import 'package:benmore_amos/features/auth/data/models/user_model.dart';
import 'package:benmore_amos/features/auth/data/models/auth_response.dart';
import 'package:benmore_amos/features/posts/data/models/comment_response.dart';
import 'package:benmore_amos/features/posts/data/models/create_post_request.dart';
import 'package:benmore_amos/features/posts/data/models/create_post_response.dart';
import 'package:benmore_amos/features/posts/data/models/follow_response.dart';
import 'package:benmore_amos/features/posts/data/models/like_response.dart';
import 'package:benmore_amos/features/posts/data/models/post_response.dart';
import 'package:benmore_amos/features/posts/data/models/profile_response.dart';

var file = File('assets/lock.svg');
final loginRequest = LoginRequest(email: 'test@example.com', password: 'password');
final registerRequest = RegisterRequest(email: 'test@example.com', password: 'password', username: 'Test-User');
User user = const User(id: '1', email: 'test@example.com', username: 'Test-User');
final authResponse = AuthResponse(token: 'token', user: user);
const userId = '123';
const profileResponse = ProfileResponse(id: '123', username: 'Test User', email: 'test@example.com');
const postId = '456';
final followResponse = FollowResponse(message: 'Followed', user: user);
final comments = CommentResponse(page: 1,limit: 10,totalComments: 100,comments: [Comment(id: '1', comment: 'Test comment', user: user, likes: 10,likedBy: const [])]);
final posts = PostsResponse(page: 1,limit: 10,totalPosts: 100,posts: [Post(id: '1', title: 'Test post', description: 'Test description', imageUrl: 'https://example.com/image.jpg', likes: 10, assignedTo: user, createdAt: DateTime.now())]);
const likeResponse = LikeResponse(message: 'Post has been liked successfully', likes: 10);
final createPostRequest = CreatePostRequest(title: 'Test', description: 'Test content');
final createPostResponse = CreatePostResponse(message: 'Post created successfully', post: Post(id: '1', title: 'Test', description: 'Test content', imageUrl: 'https://example.com/image.jpg', likes: 0, assignedTo: user, createdAt: DateTime.now()));
