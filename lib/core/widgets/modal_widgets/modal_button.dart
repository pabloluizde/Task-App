import 'package:flutter/material.dart';
import 'package:teste_eclipse/core/themes/app_colors.dart';

class ModalButton extends StatelessWidget {
  final String text;
  final Size size;
  final VoidCallback onTap;
  final Color color;

  const ModalButton({
    Key? key,
    required this.text,
    required this.size,
    required this.onTap,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 20,
        top: 20,
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10),
              border: color == AppColors.defaultWhite
                  ? Border.all(
                      color: AppColors.defaultBlue,
                      width: 1.5,
                    )
                  : null),
          height: size.height * 0.075,
          width: double.infinity,
          child: Center(
            child: Text(
              text.toUpperCase(),
              style: TextStyle(
                color: color == AppColors.defaultWhite
                    ? AppColors.defaultBlue
                    : AppColors.defaultWhite,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
