import 'package:benmore_amos/core/injector.dart';
import 'package:benmore_amos/features/auth/data/models/auth_response.dart';
import 'package:benmore_amos/features/profile/data/repositories/profile_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  late ProfileRepository _profileRepository ;

  ProfileCubit({ProfileRepository? postRepository}) : super(ProfileInitial()){
    _profileRepository = postRepository ?? sl<ProfileRepository>();
  }

  void fetchProfile(String userId) async {
    emit(FetchProfileLoading());
    final result = await _profileRepository.fetchProfile(userId);
    result.fold(
          (l) => emit(FetchProfileError(error: l)),
          (r) => emit(FetchProfileSuccess(profile: r)),
    );
  }
}
