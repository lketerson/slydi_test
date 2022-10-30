import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_slidy/app/modules/digimon/module/digimon_module.dart';

import 'counter_cubit.dart';
import 'home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => CounterCubit()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute,
        child: (context, args) => const HomePage()),
    ModuleRoute('/digimon', module: DigimonModule())
  ];
}
