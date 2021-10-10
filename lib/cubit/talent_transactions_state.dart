part of 'talent_transactions_cubit.dart';

abstract class TalentTransactionsState extends Equatable {
  const TalentTransactionsState();

  @override
  List<Object> get props => [];
}

class TalentTransactionsInitial extends TalentTransactionsState {}

class TalentTransactionLoaded extends TalentTransactionsState {
  final List<UserTransaction> transactions;

  const TalentTransactionLoaded(this.transactions);

  @override
  List<Object> get props => [transactions];
}

class TalentTransactionLoadingFailed extends TalentTransactionsState {
  final String message;

  const TalentTransactionLoadingFailed(this.message);

  @override
  List<Object> get props => [message];
}
