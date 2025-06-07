import 'package:flutter/material.dart';

class NavItem {
  final IconData icon;
  final String label;

  const NavItem({
    required this.icon,
    required this.label,
  });
}

class CustomMultipleButton extends StatelessWidget {
  final List<NavItem> items;
  final int selectedIndex;
  final ValueChanged<int> onItemSelected;
  const CustomMultipleButton({
    super.key, 
    required this.items, 
    required this.selectedIndex, 
    required this.onItemSelected});

 @override
  Widget build(BuildContext context) {
    return Row(
      // Distribuye los ítems equitativamente en la horizontal
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: items.asMap().entries.map((entry) {
        final index = entry.key;
        final item = entry.value;
        final isSelected = index == selectedIndex;

        // Si está seleccionado, amarillo, si no, gris
        final color = isSelected ? const Color(0xFFD4A448) : Colors.grey;

        return GestureDetector(
          onTap: () {
            onItemSelected(index);
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(item.icon, color: color),
              const SizedBox(height: 4),
              Text(
                item.label,
                style: TextStyle(color: color),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}