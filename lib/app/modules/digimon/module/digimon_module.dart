import 'package:dio/dio.dart';
import 'package:flutter_slidy/app/modules/digimon/cubit/digimon_cubit.dart';
import 'package:flutter_slidy/app/modules/digimon/repositories/digimon_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_slidy/app/modules/digimon/view/digimon_page.dart';

class DigimonModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton<Dio>((i) => Dio()),
    Bind.singleton((i) => DigimonRepository(i<Dio>())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (context, args) => DigimonPage(
        digimonRepository: Modular.get<DigimonRepository>(),
      ),
    )
  ];
}
