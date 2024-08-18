import 'package:benmore_amos/features/auth/data/models/login_request.dart';
import 'package:benmore_amos/features/auth/data/models/register_request.dart';
import 'package:benmore_amos/features/auth/data/models/user_model.dart';
import 'package:benmore_amos/features/auth/data/models/auth_response.dart';


final loginRequest = LoginRequest(email: 'test@example.com', password: 'password');
final registerRequest = RegisterRequest(email: 'test@example.com', password: 'password', username: 'Test-User');
const authResponse = AuthResponse(token: 'token', user: User(id: '1', email: 'test@example.com', username: 'Test-User'));