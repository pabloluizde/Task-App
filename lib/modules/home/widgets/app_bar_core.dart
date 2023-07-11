import 'package:flutter/material.dart';
import 'package:teste_eclipse/core/themes/app_colors.dart';
import 'package:teste_eclipse/modules/home/controller/home_getx.dart';
import 'package:teste_eclipse/modules/home/widgets/text_search.dart';

class AppBarCore extends StatelessWidget {
  const AppBarCore({
    super.key,
    required this.size,
    required this.yourController,
  });

  final Size size;
  final HomeGetx yourController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "TASK APP",
          style: TextStyle(
            color: AppColors.defaultBlue,
            fontSize: 60,
            fontWeight: FontWeight.bold,
          ),
        ),
        IconButton(
          iconSize: 30,
          color: AppColors.defaultBlue,
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              backgroundColor: AppColors.defaultGrey,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.only(
                  topEnd: Radius.circular(25),
                  topStart: Radius.circular(25),
                ),
              ),
              builder: (context) => SingleChildScrollView(
                padding: const EdgeInsetsDirectional.only(
                  start: 20,
                  end: 20,
                  bottom: 30,
                  top: 8,
                ),
                child: SizedBox(
                  height: size.height * 0.6,
                  child: Wrap(
                    children: [
                      Form(
                        key: yourController.formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10.0,
                                vertical: 15.0,
                              ),
                              child: Text(
                                "Bora criar Uma Task!".toUpperCase(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.defaultBlue,
                                    fontSize: 25),
                              ),
                            ),
                            TextFormSheet(
                                validate: (_) => yourController.validatorTask(),
                                isTitle: true,
                                isDesc: false,
                                onChanged: yourController.task,
                                title: "Task"),
                            TextFormSheet(
                                validate: (_) => yourController.validatorDesc(),
                                isDesc: true,
                                isTitle: false,
                                onChanged: yourController.description,
                                title: "Descrição"),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: GestureDetector(
                                onTap: () async {
                                  yourController.addTask(context).then(
                                    (value) {
                                      if (value == true) {
                                        Navigator.pop(context);
                                      }
                                    },
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.defaultBlue,
                                    borderRadius:
                                        BorderRadiusDirectional.circular(10),
                                  ),
                                  height: size.height * 0.06,
                                  child: const Center(
                                    child: Text('Adicionar Task'),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          icon: const Icon(Icons.add),
        )
      ],
    );
  }
}
