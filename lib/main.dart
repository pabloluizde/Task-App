import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:teste_eclipse/app/app.dart';
import 'package:teste_eclipse/app/app_module.dart';
import 'package:teste_eclipse/modules/home/controller/home_getx.dart';

void main() async {
  Intl.defaultLocale = 'pt_BR';
  initializeDateFormatting('pt_BR', null);
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(HomeGetx());
  runApp(
    ModularApp(
      module: AppModule(),
      child: const MyApp(),
    ),
  );
}
