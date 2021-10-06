import 'package:bloc/bloc.dart';
import 'package:dudu/models/models.dart';
import 'package:dudu/services/services.dart';
import 'package:equatable/equatable.dart';

part 'talent_state.dart';

class TalentCubit extends Cubit<TalentState> {
  TalentCubit() : super(TalentInitial());

  Future<void> getTalents() async {
    ApiReturnValue<List<Talent>> result = await TalentServices.getTalents();

    if (result.value != null) {
      emit(TalentLoaded(result.value!));
    } else {
      emit(TalentLoadingFailed(result.message!));
    }
  }
}
