import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dudu/models/models.dart';
import 'package:dudu/services/services.dart';
import 'package:equatable/equatable.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  Future<void> signIn(String email, String password) async {
    ApiReturnValue<User> result = await UserServices.signIn(email, password);

    if (result.value != null) {
      emit(UserLoaded(result.value!));
    } else {
      emit(UserLoadingFailed(result.message!));
    }
  }

  Future<bool> logout() async {
    ApiReturnValue<bool> result = await UserServices.logout();

    if (result.value != null) {
      emit(UserLoaded(User()));
      return true;
    } else {
      emit(UserLoadingFailed(result.message!));
      return false;
    }
  }

  Future<void> signUp(User user, String password, {File? pictureFile}) async {
    ApiReturnValue<User> result =
        await UserServices.signUp(user, password, pictureFile: pictureFile);

    if (result.value != null) {
      emit(UserLoaded(result.value!));
    } else {
      emit(UserLoadingFailed(result.message!));
    }
  }

  Future<void> uploadProfilePicture(File pictureFile) async {
    ApiReturnValue<String> result =
        await UserServices.uploadProfilePicture(pictureFile);

    if (result.value != null) {
      emit(UserLoaded((state as UserLoaded).user.copyWith(
          profile_photo_path:
              "https://staging.dudu.co.id/storage/" + result.value!)));
    }
  }
}
