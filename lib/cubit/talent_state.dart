part of 'talent_cubit.dart';

abstract class TalentState extends Equatable {
  const TalentState();

  @override
  List<Object> get props => [];
}

class TalentInitial extends TalentState {}

class TalentLoaded extends TalentState {
  final List<Talent> talents;

  const TalentLoaded(this.talents);

  @override
  List<Object> get props => [talents];
}

class TalentLoadingFailed extends TalentState {
  final String message;

  const TalentLoadingFailed(this.message);

  @override
  List<Object> get props => [message];
}
