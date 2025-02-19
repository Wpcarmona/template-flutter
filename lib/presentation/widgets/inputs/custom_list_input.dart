import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class CustomInputList extends StatelessWidget {
  final String? label;
  final int? selectedValue;
  final Function(int?)? onChanged;
  final List<int> items;

  const CustomInputList({
    super.key,
    required this.items,
    this.label,
    this.selectedValue,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final border = OutlineInputBorder(borderRadius: BorderRadius.circular(10));

    return DropdownButtonFormField2<int>(
      value: selectedValue,
      isExpanded: true, // Evita que el botón se recorte
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        enabledBorder: border.copyWith(
          borderSide: BorderSide(color: colors.primary, width: 1),
        ),
        focusedBorder: border.copyWith(
          borderSide: BorderSide(color: colors.secondary, width: 1),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        labelText: label,
      ),
      dropdownStyleData: DropdownStyleData(
        maxHeight: 200, // Limita la altura del dropdown
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
      ),
      menuItemStyleData: MenuItemStyleData(
        padding: EdgeInsets.symmetric(horizontal: 15),
      ),
      items: items
          .map((value) => DropdownMenuItem<int>(
                value: value,
                child: Text(value.toString()),
              ))
          .toList(),
      onChanged: onChanged,
    );
  }
}
