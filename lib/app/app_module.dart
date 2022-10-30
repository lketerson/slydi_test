import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_slidy/app/modules/digimon/module/digimon_module.dart';
import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: DigimonModule()),
  ];
}
