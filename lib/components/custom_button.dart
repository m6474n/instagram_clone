import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  const CustomButton({Key? key, required this.title, required this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(height: 50,
        child: Center(child: Text(title, style: TextStyle(fontSize: 20),))
        ,decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: LinearGradient(colors: [
          Colors.orange, Colors.pink,Colors.purple,
        ],
        begin: Alignment.bottomLeft,end: Alignment.topRight)),),
    );
  }
}
