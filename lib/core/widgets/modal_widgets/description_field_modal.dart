import 'package:flutter/material.dart';
import 'package:teste_eclipse/core/themes/app_colors.dart';

class FieldDescModal extends StatelessWidget {
  const FieldDescModal({
    super.key,
    required this.desc,
    required this.size,
  });

  final Size size;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30.0, bottom: 25.0),
          child: Text(
            "Description".toUpperCase(),
            style: const TextStyle(color: AppColors.defaultWhite, fontSize: 20),
          ),
        ),
        Container(
          width: size.width * 0.9,
          height: size.height * 0.45,
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.defaultWhite,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Text(
                desc,
                style: const TextStyle(
                    color: AppColors.defaultWhite, fontSize: 20),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
