import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  final String text;
  final TextAlign textAlign;

  const CustomTitle({
    super.key,
    required this.text,
    this.textAlign = TextAlign.center,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: (0)),
      child: Text(
        text,
        textAlign: textAlign,
        style: const TextStyle(
          fontFamily: 'Nunito',
          fontSize: 28,
          height: 1.2,
          fontWeight: FontWeight.w700
      
        ),
      ),
    );
  }
}
