import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class CustomInputList extends StatelessWidget {
  final String? label;
  final String? selectedValue;
  final void Function(String?)? onChanged;
  final List<String> items;
  final String? errorMessage;

  const CustomInputList({
    Key? key,
    required this.items,
    this.label,
    this.selectedValue,
    this.onChanged,
    this.errorMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return DropdownButtonFormField2<String>(
      value: selectedValue,
      isExpanded: true,
      decoration: InputDecoration(
        // Se quita el fondo
        filled: false,
        fillColor: Colors.transparent,
        // Líneas estilo subrayado
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 1),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 2),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: colors.error, width: 1),
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: colors.error, width: 2),
        ),
        contentPadding: EdgeInsets.zero,
        labelText: label,
        errorText: errorMessage,
      ),
      dropdownStyleData: DropdownStyleData(
        maxHeight: 200,
        // Para que el menú también sea sin fondo (o semitransparente si prefieres)
        decoration: BoxDecoration(
          color: Colors.white, // o Colors.transparent si quieres sin fondo
        ),
      ),
      menuItemStyleData: const MenuItemStyleData(
        padding: EdgeInsets.symmetric(horizontal: 15),
      ),
      items: items
          .map((value) => DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              ))
          .toList(),
      onChanged: onChanged,
    );
  }
}
