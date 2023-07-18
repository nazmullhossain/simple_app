import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({Key? key,
    this.color,
    required this.text,
    required this.onTap}) : super(key: key);
  final String text;
  final Color?color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: color,
            minimumSize: Size(double.infinity, 50)
        ),
        onPressed: onTap,
        child: Text(text,style: TextStyle(
            color: color==null?Colors.white:Colors.black
        ),));
  }
}