import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_slidy/app/modules/digimon/models/digimon_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_slidy/app/modules/digimon/repositories/digimon_repository.dart';

part 'digimon_state.dart';

class DigimonCubit extends Cubit<DigimonGetState> {
  DigimonCubit() : super(DigimonGetInitial());

  Future<void> getDigimon() async {
    emit(DigimonGetLoading());
    try {
      final List<DigimonModel> digimonList =
          await Modular.get<DigimonRepository>().getDigimon();
      emit(DigimonGetLoaded(digimonList));
    } catch (e) {
      debugPrint(e.toString());
      emit(DigimonGetError(e.toString()));
    }
  }
}
