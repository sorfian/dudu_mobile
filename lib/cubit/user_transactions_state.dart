part of 'user_transactions_cubit.dart';

abstract class UserTransactionsState extends Equatable {
  const UserTransactionsState();

  @override
  List<Object> get props => [];
}

class UserTransactionsInitial extends UserTransactionsState {}

class UserTransactionLoaded extends UserTransactionsState {
  final List<UserTransaction> transactions;

  const UserTransactionLoaded(this.transactions);

  @override
  List<Object> get props => [transactions];
}

class UserTransactionLoadingFailed extends UserTransactionsState {
  final String message;

  const UserTransactionLoadingFailed(this.message);

  @override
  List<Object> get props => [message];
}
