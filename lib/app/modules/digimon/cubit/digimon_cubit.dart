import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_slidy/app/modules/digimon/models/digimon_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_slidy/app/modules/digimon/repositories/digimon_repository.dart';

part 'digimon_state.dart';

class DigimonCubit extends Cubit<IDigimonGetState> {
  final DigimonRepository digimonRepository;
  DigimonCubit(this.digimonRepository) : super(DigimonGetInitial());

  Future<void> fecthDigimon() async {
    emit(DigimonGetLoading());
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
