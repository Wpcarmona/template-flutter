import 'package:flutter/material.dart';

class CustomSegment<T> extends StatelessWidget {
  final List<T> options;
  final T selectedOption;
  final ValueChanged<T> onSelectionChanged;
  final Map<T, String> optionLabels;
  final Map<T, IconData> optionIcons;

  const CustomSegment({
    super.key,
    required this.options,
    required this.selectedOption,
    required this.onSelectionChanged,
    required this.optionLabels,
    required this.optionIcons,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SegmentedButton<T>(
          segments: options
              .map(
                (option) => ButtonSegment<T>(
                  value: option,
                  label: Text(optionLabels[option] ?? ''),
                  icon: Icon(optionIcons[option]),
                ),
              )
              .toList(),
          selected: <T>{selectedOption},
          onSelectionChanged: (Set<T> newSelection) {
            onSelectionChanged(newSelection.first);
          },
        ),
      ),
    );
  }
}
