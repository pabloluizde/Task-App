import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_eclipse/modules/home/controller/home_getx.dart';
import 'package:teste_eclipse/modules/home/home_module.dart';
import 'package:teste_eclipse/modules/home/widgets/bottom_menu.dart';

class HomePage extends StatefulWidget {
  final HomeGetx controller;
  const HomePage({required this.controller, super.key});

  static const route = '/';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Modular.to.navigate('.${HomeModule.list}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          SizedBox(
            height: size.height,
            width: size.width,
            child: const RouterOutlet(),
          ),
          const BottomMenuHome(),
        ],
      ),
    );
  }
}
