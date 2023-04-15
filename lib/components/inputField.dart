import 'package:flutter/material.dart';
class InputField extends StatelessWidget {
  String title;
   InputField({Key? key, required this.title}) : super(key: key,);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(hintText: title,
          fillColor: Colors.grey.withOpacity(.2),filled: true,
          labelStyle: TextStyle(color: Colors.white),
          label: Text(title),

          border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(8))
          ,focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey), borderRadius: BorderRadius.circular(8))),
    );
  }
}
