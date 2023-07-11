import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_eclipse/core/models/tasks_model.dart';
import 'package:teste_eclipse/core/services/modal_service.dart';
import 'package:teste_eclipse/modules/home/controller/home_getx.dart';

class ButtonsCard extends StatelessWidget {
  const ButtonsCard({
    super.key,
    required this.controller,
    required this.movies,
  });

  final HomeGetx controller;
  final TaksModel movies;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return IconButton(
      onPressed: () {
        ModalServices.choiceModal(
          context,
          () {
            Future.delayed(const Duration(milliseconds: 250))
                .then((value) => controller.removeItem(movies, context));

            Modular.to.pop();
          },
          size,
          "Deseja excluir essa Task?",
        );
      },
      icon: const Icon(Icons.delete),
    );
  }
}
