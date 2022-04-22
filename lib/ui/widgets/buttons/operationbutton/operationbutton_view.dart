import 'package:flutter/material.dart';

class OperationButton extends StatelessWidget {
  const OperationButton({ Key? key , required this.onPressed, required this.title}) : super(key: key);

  final VoidCallback  onPressed;
  final String        title;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed, 
      child: Text(title)
    );
  }
}