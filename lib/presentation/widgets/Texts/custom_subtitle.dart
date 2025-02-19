import 'package:flutter/material.dart';

class CustomSubtitle extends StatelessWidget {
  final String text;
  final TextAlign textAlign;

  const CustomSubtitle({
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
          fontSize: 14,
          height: 20 / 14,
          fontWeight: FontWeight.w400,
          letterSpacing: 0, 
          color: Color(0xFF999999)
        ),
      ),
    );
  }
}
