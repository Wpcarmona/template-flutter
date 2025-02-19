import 'package:flutter/material.dart';

enum ButtonTheme { primary, secondary, tertiary }

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? themeColor;
  final IconData? icon; 

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.themeColor,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final buttonColor = themeColor ?? colors.primary; // Usa el color proporcionado o el primario por defecto
    final textColor = Colors.white;
    return FilledButton(
      style: FilledButton.styleFrom(
        backgroundColor: buttonColor,
        padding: const EdgeInsets.symmetric(vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: onPressed,
      child:Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, color: textColor, size: 24),
            const SizedBox(width: 10), // Espacio entre ícono y texto
          ],
          Text(
            text,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: textColor),
          ),
        ],
      ),
    );
  }
}
