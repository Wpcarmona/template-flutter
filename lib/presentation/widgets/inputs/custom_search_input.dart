import 'package:flutter/material.dart';

class CustomSearchInput extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  final String hintText;

  const CustomSearchInput({
    super.key,
    this.onChanged,
    this.hintText = 'Buscar',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.search,
            color: Colors.grey,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              onChanged: onChanged,
              style: const TextStyle(color: Colors.black87),
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: const TextStyle(color: Colors.grey),
                border: InputBorder.none, 
              ),
            ),
          ),
        ],
      ),
    );
  }
}
