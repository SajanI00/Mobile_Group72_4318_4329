import 'package:flutter/material.dart';

class RoundTextField extends StatelessWidget {
  const RoundTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.textInputAction,
    this.keyboardType = TextInputType.text,
    this.validator,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      validator: validator,
    );
  }
}
