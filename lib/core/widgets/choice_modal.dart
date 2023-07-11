import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_eclipse/core/widgets/modal_widgets/modal_button.dart';
import 'package:teste_eclipse/core/themes/app_colors.dart';

class ChoiceModal extends StatefulWidget {
  final Function() onTap;
  final Size size;
  final String text;

  const ChoiceModal({
    Key? key,
    required this.size,
    required this.onTap,
    required this.text,
  }) : super(key: key);

  @override
  State<ChoiceModal> createState() => _ChoiceModalState();
}

class _ChoiceModalState extends State<ChoiceModal>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 450));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.elasticInOut);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: scaleAnimation,
      child: AlertDialog(
        titlePadding: const EdgeInsets.only(top: 5, right: 5),
        insetPadding: EdgeInsets.symmetric(
          horizontal: 30,
          vertical: widget.size.height * 0.32,
        ),
        backgroundColor: AppColors.defaultWhite,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 15),
        content: SizedBox(
          height: widget.size.height,
          width: widget.size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    widget.text,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                        color: AppColors.defaultBlue, fontSize: 20),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: widget.size.width * 0.28,
                    child: ModalButton(
                      text: 'CANCELAR',
                      size: widget.size,
                      onTap: () => Modular.to.pop(false),
                      color: AppColors.defaultWhite,
                    ),
                  ),
                  SizedBox(
                    width: widget.size.width * 0.28,
                    child: ModalButton(
                      text: 'SIM',
                      size: widget.size,
                      onTap: widget.onTap,
                      color: AppColors.defaultBlue,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
