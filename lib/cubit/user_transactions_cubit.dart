import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dudu/models/models.dart';
import 'package:dudu/services/services.dart';
import 'package:equatable/equatable.dart';

part 'user_transactions_state.dart';

class UserTransactionsCubit extends Cubit<UserTransactionsState> {
  UserTransactionsCubit() : super(UserTransactionsInitial());

  Future<void> getUserTransactions() async {
    ApiReturnValue<List<UserTransaction>> result =
        await UserTransactionServices.getTransactions();

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
}
