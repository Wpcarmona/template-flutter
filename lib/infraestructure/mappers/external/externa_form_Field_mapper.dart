import 'package:app_template/domain/entities/entities.dart';
import 'package:app_template/infraestructure/models/external/external_form_field.dart';

class ExternaFormFieldMapper {

  static ExternalFormField externalFormFieldToEntity(
          DynamicFieldsResponse response) =>
      ExternalFormField(
        id: response.data.id,
        externalAction: response.data.externalAction,
        field: response.data.fields
            .map((f) => FieldEntityField(
                  fieldType: f.fieldType,
                  typeValue: f.typeValue,
                  name: f.name,
                  label: f.label,
                  helpText: f.helpText,
                  placeholder: f.placeholder,
                  defaultValue: f.defaultValue,
                  requiredField: f.requiredField,
                  uniqueField: f.uniqueField,
                  format: f.format,
                  choices: f.choices
                      ?.map((c) => ChoiceField(
                            label: c.label,
                            value: c.value,
                          ))
                      .toList(),
                ))
            .toList(),
      );
}