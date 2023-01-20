import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Color color;
  final void Function() onPressed;
  final String label;

  const CustomButton(
      {super.key,
      required this.color,
      required this.onPressed,
      required this.label});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: color, shape: const StadiumBorder()),
      onPressed: onPressed,
      child: Text(
        label,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
