import 'package:modular_test/modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_slidy/app/modules/digimon/digimon_module.dart';

void main() {
  setUpAll(() {
    initModule(DigimonModule());
  });
}
