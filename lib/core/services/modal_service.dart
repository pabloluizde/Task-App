import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:teste_eclipse/core/widgets/choice_modal.dart';
import 'package:teste_eclipse/core/widgets/details_modal.dart';

class ModalServices {
  static Future<bool?> choiceModal(
    BuildContext context,
    dynamic Function() onTap,
    Size size,
    String text,
  ) {
    return showAnimatedDialog(
      duration: const Duration(milliseconds: 250),
      barrierDismissible: true,
      animationType: DialogTransitionType.sizeFade,
      context: context,
      builder: (BuildContext ctx) {
        return ChoiceModal(
          onTap: onTap,
          size: size,
          text: text,
        );
      },
    );
  }

  static Future<bool?> detailsModal(
    BuildContext context,
    Size size,
    String text,
    String desc,
  ) {
    return showAnimatedDialog(
      duration: const Duration(milliseconds: 250),
      barrierDismissible: true,
      animationType: DialogTransitionType.sizeFade,
      context: context,
      builder: (BuildContext ctx) {
        return DetailsModal(
          desc: desc,
          size: size,
          text: text,
        );
      },
    );
  }
}
