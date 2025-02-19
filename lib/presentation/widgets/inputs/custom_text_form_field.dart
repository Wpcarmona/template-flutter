import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? errorMessage;
  final Function(String)? onChanged;
  final bool obscureText;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;

  const CustomTextFormField(
      {super.key,
      this.label,
      this.hint,
      this.errorMessage,
      this.onChanged,
      this.validator,
      this.obscureText = false, 
      required this.keyboardType});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final border = OutlineInputBorder(borderRadius: BorderRadius.circular(10));

    return TextFormField(
      onChanged: onChanged,
      validator: validator,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        filled: true, 
        fillColor: Colors.white, 
        enabledBorder: border.copyWith(
        borderSide: BorderSide(color: colors.primary, width: 1)),
        focusedBorder: border.copyWith( borderSide: BorderSide(color: colors.secondary, width: 1),),
        errorBorder: border.copyWith(borderSide: BorderSide(color: colors.error, width: 1),),
        focusedErrorBorder: border.copyWith(borderSide: BorderSide(color: colors.error, width: 1),),
        isDense: false, 
        contentPadding: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,   
        ),
        label: label != null ? Text(label!) : null,
        hintText: hint,
        errorText: errorMessage,
        focusColor: colors.primary,
      ),
    );
  }
}
