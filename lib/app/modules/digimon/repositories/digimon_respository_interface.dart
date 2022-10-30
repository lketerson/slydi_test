import 'package:flutter_slidy/app/modules/digimon/models/digimon_model.dart';

abstract class IDigimonRespositoryInterface {
  Future<List<DigimonModel>> getDigimon();
}
