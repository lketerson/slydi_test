import 'package:dio/dio.dart';
import 'package:flutter_slidy/app/modules/digimon/models/digimon_model.dart';
import 'package:flutter_slidy/app/modules/digimon/repositories/digimon_respository_interface.dart';

class DigimonRepository implements IDigimonRespositoryInterface {
  final Dio _dio;

  DigimonRepository(this._dio);

  @override
  Future<List<DigimonModel>> getDigimon() async {
    List<DigimonModel> digimontList = [];
    try {
      var response =
          await _dio.get('https://digimon-api.vercel.app/api/digimon/');

      digimontList = (response.data as List).map((item) {
        return DigimonModel.fromMap(item);
      }).toList();
      print(digimontList);

      return digimontList;
    } on DioError catch (e) {
      throw (e);
    }
  }
}
