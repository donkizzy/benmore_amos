part of 'auth_cubit.dart';

sealed class AuthState extends Equatable {
  const AuthState();
}

final class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

final class LoginLoading extends AuthState {
  @override
  List<Object> get props => [];
}

final class LoginSuccess extends AuthState {
  final AuthResponse authResponse;

  const LoginSuccess({required this.authResponse});

  @override
  List<Object> get props => [authResponse];
}

final class LoginError extends AuthState {
  final String error ;

  const LoginError({required this.error});
  @override
  List<Object> get props => [error];
}

final class RegisterLoading extends AuthState {
  @override
  List<Object> get props => [];
}

final class RegisterSuccess extends AuthState {
  final AuthResponse authResponse ;

  const RegisterSuccess({required this.authResponse});

  @override
  List<Object> get props => [authResponse];
}

final class RegisterError extends AuthState {
  final String error ;

  const RegisterError({required this.error});
  @override
  List<Object> get props => [error];
}
