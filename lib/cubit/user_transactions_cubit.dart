import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dudu/models/models.dart';
import 'package:dudu/services/services.dart';
import 'package:equatable/equatable.dart';

part 'user_transactions_state.dart';

class UserTransactionsCubit extends Cubit<UserTransactionsState> {
  UserTransactionsCubit() : super(UserTransactionsInitial());

  Future<void> getUserTransactions({String? user}) async {
    ApiReturnValue<List<UserTransaction>> result =
        await UserTransactionServices.getTransactions(
            user: (user != null) ? user : "");

    if (result.value != null) {
      emit(UserTransactionLoaded(result.value!));
    } else {
      emit(UserTransactionLoadingFailed(result.message!));
    }
  }

  Future<String?> submitTransaction(UserTransaction transaction,
      {File? videoFile, File? videoThumbnail}) async {
    ApiReturnValue<UserTransaction> result =
        await UserTransactionServices.submitTransaction(transaction,
            videoFile: videoFile, videoThumbnail: videoThumbnail);

    if (result.value != null) {
      emit(UserTransactionLoaded(
          (state as UserTransactionLoaded).transactions + [result.value!]));
      return result.value!.payment_url!;
    } else {
      return null;
    }
  }

  Future<UserTransactionStatus?> updateTransaction(
      UserTransaction transaction) async {
    ApiReturnValue<UserTransaction> result =
        await UserTransactionServices.updateTransaction(transaction);

    if (result.value != null) {
      emit(UserTransactionLoaded(
          (state as UserTransactionLoaded).transactions + [result.value!]));
      return result.value!.status!;
    } else {
      return null;
    }
  }

  Future<String?> uploadTalentVideo(UserTransaction transaction,
      {File? videoFile, File? videoThumbnail}) async {
    ApiReturnValue<String> result =
        await UserTransactionServices.uploadVideoTalent(
      videoFile!,
      videoThumbnail!,
      transaction.externalId!,
      userTransaction: transaction,
    );
    transaction.copyWith(
        videoPathTalent: result.videoFileTalent,
        videoThumbnailTalent: result.videoThumbnailTalent);

    if (result.videoFileTalent != null && result.videoThumbnailTalent != null) {
      emit(
          UserTransactionLoaded((state as UserTransactionLoaded).transactions));
      return result.videoFileTalent!;
    } else {
      return null;
    }
  }
}
