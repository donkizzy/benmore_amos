import 'package:benmore_amos/core/injector.dart';
import 'package:benmore_amos/features/auth/data/models/auth_response.dart';
import 'package:benmore_amos/features/auth/data/models/login_request.dart';
import 'package:benmore_amos/features/auth/data/models/register_request.dart';
import 'package:benmore_amos/features/auth/data/repositories/auth_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;

  AuthCubit({AuthRepository? authRepository})
      : _authRepository = authRepository ?? sl<AuthRepository>(),
        super(AuthInitial());

  void login(LoginRequest loginRequest) async {
    try {
      emit(LoginLoading());
      var response = await _authRepository.login(loginRequest);
      response.fold((l) {
        emit(LoginError(error: l));
      }, (r) {
        emit(LoginSuccess(authResponse: r));
      });
    } catch (e) {
      emit(LoginError(error: e.toString()));
    }
  }

  void register(RegisterRequest registerRequest) async {
    try {
      emit(RegisterLoading());
      var response = await _authRepository.register(registerRequest);
      response.fold((l) {
        emit(RegisterError(error: l));
      }, (r) {
        emit(RegisterSuccess(authResponse: r));
      });
    } catch (e) {
      emit(RegisterError(error: e.toString()));
    }
  }
}
