part of 'digimon_cubit.dart';

abstract class IDigimonGetState extends Equatable {
  const IDigimonGetState();
  @override
  List<Object> get props => [];
}

class DigimonGetInitial extends IDigimonGetState {}

class DigimonGetLoading extends IDigimonGetState {}

class DigimonGetLoaded extends IDigimonGetState {
  final List<DigimonModel> digimonList;

  const DigimonGetLoaded(this.digimonList);

  @override
  List<Object> get props => [digimonList];
}

class DigimonGetError extends IDigimonGetState {
  final String error;

  const DigimonGetError(this.error);

  @override
  List<Object> get props => [error];
}
