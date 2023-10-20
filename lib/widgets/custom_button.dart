import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key, required this.buttonName,
  });
  final String buttonName;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),

      ),
      child: Center(child: Text(buttonName,style: const TextStyle(fontSize: 24,color: Colors.black),)),
    );
  }
}
