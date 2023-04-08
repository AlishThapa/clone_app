import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    super.key, required this.buttonName, this.onTap,
  });
  final String buttonName;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Container(
        alignment: Alignment.center,
        height: 40,
        width: 200,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Colors.teal, Colors.orangeAccent],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(18),
        ),
        child:  Text(
          buttonName,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
