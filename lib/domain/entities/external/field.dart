class FieldEntityField {
  final String fieldType;
  final String typeValue;
  final String name;
  final String label;
  final String? helpText;
  final String? placeholder;
  final dynamic defaultValue;
  final bool requiredField;
  final bool uniqueField;
  final String? format;
  final List<ChoiceField>? choices;

  FieldEntityField({
    required this.fieldType,
    required this.typeValue,
    required this.name,
    required this.label,
    this.helpText,
    this.placeholder,
    this.defaultValue,
    required this.requiredField,
    required this.uniqueField,
    this.format,
    this.choices,
  });
}

class ChoiceField {
  final String label;
  final String value;

  ChoiceField({
    required this.label,
    required this.value,
  });
}
