import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:teste_eclipse/core/themes/app_colors.dart';

class TextFormSheet extends StatefulWidget {
  final Function(String)? onChanged;
  final bool isDesc;
  final bool isTitle;
  final String title;
  final String? Function(String? value)? validate;
  const TextFormSheet({
    required this.onChanged,
    required this.isDesc,
    required this.isTitle,
    required this.title,
    this.validate,
    super.key,
  });

  @override
  State<TextFormSheet> createState() => _TextFormSheetState();
}

class _TextFormSheetState extends State<TextFormSheet> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: TextFormField(
        validator: widget.validate,
        inputFormatters: widget.isTitle == true
            ? [LengthLimitingTextInputFormatter(20)]
            : [],
        minLines: widget.isDesc == true ? 4 : 1,
        maxLines: widget.isDesc == true ? 4 : 1,
        onChanged: widget.onChanged,
        style: const TextStyle(color: AppColors.defaultWhite),
        decoration: InputDecoration(
          hintText: widget.title,
          hintStyle:
              const TextStyle(color: AppColors.defaultWhite, fontSize: 20),
          hintTextDirection: TextDirection.ltr,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: AppColors.defaultWhite,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: AppColors.defaultWhite,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: AppColors.defaultWhite,
            ),
          ),
        ),
      ),
    );
  }
}
