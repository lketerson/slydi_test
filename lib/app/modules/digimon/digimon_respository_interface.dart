import 'package:flutter_slidy/app/modules/digimon/digimon_model.dart';

abstract class IDigimonRespositoryInterface {
  Future<List<DigimonModel>> getDigimon();
}
