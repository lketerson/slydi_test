// import 'package:equatable/equatable.dart';
// import 'package:flutter_slidy/app/modules/digimon/digimon_model.dart';
part of 'digimon_cubit.dart';

class DigimonGetState extends Equatable {
  const DigimonGetState();
  @override
  List<Object> get props => [];
}

class DigimonGetInitial extends DigimonGetState {}

class DigimonGetLoading extends DigimonGetState {}

class DigimonGetLoaded extends DigimonGetState {
  final List<DigimonModel> digimonList;

  const DigimonGetLoaded(this.digimonList);

  @override
  List<Object> get props => [digimonList];
}

class DigimonGetError extends DigimonGetState {
  final String error;

  const DigimonGetError(this.error);

  @override
  List<Object> get props => [error];
}
