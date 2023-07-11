import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_eclipse/core/themes/app_colors.dart';

class BackButtonModal extends StatelessWidget {
  final Size size;
  const BackButtonModal({required this.size, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: size.width * 0.8,
        height: size.height * 0.07,
        child: InkWell(
          onTap: () {
            Modular.to.pop();
          },
          child: const Center(
            child: Text(
              "OK",
              style: TextStyle(color: AppColors.defaultWhite, fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
