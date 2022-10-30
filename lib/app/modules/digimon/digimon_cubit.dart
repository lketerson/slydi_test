import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_slidy/app/modules/digimon/digimon_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_slidy/app/modules/digimon/digimon_repository.dart';
part 'digimon_state.dart';

class DigimonCubit extends Cubit<DigimonGetState> {
  final DigimonRepository digimonRepository;
  DigimonCubit(this.digimonRepository) : super(DigimonGetInitial());

  Future<void> getDigimon() async {
    emit(const DigimonGetState());
    try {
      final List<DigimonModel> digimonList =
          await digimonRepository.getDigimon();
      emit(DigimonGetLoaded(digimonList));
    } catch (e) {
      debugPrint(e.toString());
      emit(DigimonGetError(e.toString()));
    }
  }
}
