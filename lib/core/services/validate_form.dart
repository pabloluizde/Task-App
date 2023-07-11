import 'package:flutter/material.dart';

class ValidateForm {
  static bool validateForm(GlobalKey<FormState> formKey) {
    final formState = formKey.currentState;

    if (formState == null) {
      return false;
    }

    if (!formState.validate()) {
      return false;
    }

    return true;
  }
}
