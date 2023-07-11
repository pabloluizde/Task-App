import 'package:flutter/material.dart';
import 'package:teste_eclipse/core/themes/app_colors.dart';

class TitleTaskModal extends StatelessWidget {
  const TitleTaskModal({
    super.key,
    required this.size,
    required this.title,
  });

  final String title;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: size.height * 0.04,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Text(
                  title,
                  style: const TextStyle(
                      color: AppColors.defaultWhite, fontSize: 25),
                ),
              ),
            ),
          ),
          const Divider(
            height: 3,
            color: AppColors.defaultWhite,
          ),
        ],
      ),
    );
  }
}
