import 'package:flutter/material.dart';

TextFormField customTextfield({required TextEditingController controller, required TextInputType inputType, required String labelText, required String validatorValue}) {
  return TextFormField(
    controller: controller,
    keyboardType: inputType,
    decoration: InputDecoration(labelText: labelText),
    validator: (value) => value!.isEmpty ? validatorValue: null,
  );
}