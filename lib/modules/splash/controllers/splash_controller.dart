import 'package:flutter_modular/flutter_modular.dart';

import 'package:teste_eclipse/modules/home/home_module.dart';

class SplashController {
  Future<void> initSplash() {
    return Future.delayed(const Duration(seconds: 3))
        .then((value) => Modular.to.pushNamed(HomeModule.moduleRoute));
  }
}
