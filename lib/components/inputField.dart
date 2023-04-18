import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final FocusNode focusNode;
  final FormFieldValidator validator;
  final TextInputType keyboardType;
  final bool obscure;
  final bool autoFocus;
   InputField({
    Key? key,
    required this.title,
    required this.controller,
    required this.focusNode,
    required this.validator,
    required this.keyboardType,
    this.obscure = false,
     this.autoFocus =true

  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      focusNode: focusNode,
      validator: validator,
      obscureText: obscure,
      autofocus: autoFocus,
      decoration: InputDecoration(
          hintText: title,
          fillColor: Colors.grey.withOpacity(.2),
          filled: true,
          labelStyle: TextStyle(color: Colors.white),
          label: Text(title),
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(8))),
    );
  }
}
