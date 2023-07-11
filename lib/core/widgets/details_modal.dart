import 'package:flutter/material.dart';
import 'package:teste_eclipse/core/widgets/modal_widgets/back_button_modal.dart';
import 'package:teste_eclipse/core/themes/app_colors.dart';
import 'package:teste_eclipse/core/widgets/modal_widgets/description_field_modal.dart';
import 'package:teste_eclipse/core/widgets/modal_widgets/title_field_modal.dart';

class DetailsModal extends StatefulWidget {
  final Size size;
  final String text;
  final String desc;

  const DetailsModal({
    Key? key,
    required this.size,
    required this.text,
    required this.desc,
  }) : super(key: key);

  @override
  State<DetailsModal> createState() => _DetailsModalState();
}

class _DetailsModalState extends State<DetailsModal>
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
          horizontal: 10,
          vertical: widget.size.height * 0.09,
        ),
        backgroundColor: AppColors.defaultGrey,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 15),
        content: SizedBox(
          height: widget.size.height,
          width: widget.size.width,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TitleTaskModal(title: widget.text, size: widget.size),
                FieldDescModal(
                  desc: widget.desc,
                  size: widget.size,
                ),
                BackButtonModal(
                  size: widget.size,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
