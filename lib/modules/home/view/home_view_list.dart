import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste_eclipse/core/themes/app_colors.dart';
import 'package:teste_eclipse/modules/home/controller/home_getx.dart';
import 'package:teste_eclipse/modules/home/widgets/all_tasks/list_home.dart';
import 'package:teste_eclipse/modules/home/widgets/app_bar_core.dart';

class TasksAllView extends StatelessWidget {
  const TasksAllView({super.key});

  @override
  Widget build(BuildContext context) {
    final yourController = Get.find<HomeGetx>();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.defaultBlack,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 70,
                child: Padding(
                  padding: EdgeInsets.only(top: 10.0, right: 8.0),
                ),
              ),
              AppBarCore(size: size, yourController: yourController),
              ListBuilderAllTasks(controller: yourController),
            ],
          ),
        ),
      ),
    );
  }
}
