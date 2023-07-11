import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';

import 'package:teste_eclipse/core/themes/app_colors.dart';
import 'package:teste_eclipse/modules/home/controller/home_getx.dart';
import 'package:teste_eclipse/modules/home/home_module.dart';

class BottomMenuHome extends StatelessWidget {
  const BottomMenuHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Container(
          height: 70,
          margin: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            color: AppColors.defaultBlack.withOpacity(0.8),
            borderRadius: const BorderRadius.all(Radius.circular(50)),
          ),
          child: GetBuilder<HomeGetx>(
              init: HomeGetx(),
              builder: (_) {
                return BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.lock_clock),
                      label: 'Pending',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.done),
                      label: 'Done',
                    ),
                  ],
                  currentIndex: _.selectIndex.value,
                  selectedItemColor: AppColors.defaultBlue,
                  onTap: (int index) {
                    switch (index) {
                      case 0:
                        Modular.to.navigate('.${HomeModule.list}');
                        _.updateIndex(index);
                        break;
                      case 1:
                        Modular.to.navigate('.${HomeModule.pendingTask}');
                        _.updateIndex(index);
                        break;
                      case 2:
                        Modular.to.navigate('.${HomeModule.doneTask}');
                        _.updateIndex(index);
                        break;

                      default:
                    }
                  },
                );
              }),
        ),
      ),
    );
  }
}
