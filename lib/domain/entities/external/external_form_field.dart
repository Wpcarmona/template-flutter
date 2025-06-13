
import 'package:app_template/domain/entities/external/external.dart';

class ExternalFormField {
  final String id;
  final String externalAction;
  final List<FieldEntityField> field;

  ExternalFormField({
    required this.id,
    required this.externalAction,
    required this.field,
  });
}