import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dudu/models/models.dart';
import 'package:dudu/services/services.dart';
import 'package:equatable/equatable.dart';

part 'talent_transactions_state.dart';

class TalentTransactionsCubit extends Cubit<TalentTransactionsState> {
  TalentTransactionsCubit() : super(TalentTransactionsInitial());

  Future<void> getTalentTransactions() async {
    ApiReturnValue<List<UserTransaction>> result =
        await TalentTransactionServices.getTransactions();

    if (result.value != null) {
      emit(TalentTransactionLoaded(result.value!));
    } else {
      emit(TalentTransactionLoadingFailed(result.message!));
    }
  }

  // Future<String?> submitTransaction(UserTransaction transaction,
  //     {File? videoFile, File? videoThumbnail}) async {
  //   ApiReturnValue<UserTransaction> result =
  //       await UserTransactionServices.submitTransaction(transaction,
  //           videoFile: videoFile, videoThumbnail: videoThumbnail);

  //   if (result.value != null) {
  //     emit(TalentTransactionLoaded(
  //         (state as TalentTransactionLoaded).transactions + [result.value!]));
  //     return result.value!.payment_url!;
  //   } else {
  //     return null;
  //   }
  // }
}
