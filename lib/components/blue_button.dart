import 'package:flutter/material.dart';
class BlueButton extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  const BlueButton({Key? key, required this.title, required this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: onPress,
      child: Container(height: 50,
        child: Center(child: Text(title, style: TextStyle(fontSize: 20),))
        ,decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(8),

          )),
    )         ;
  }
}