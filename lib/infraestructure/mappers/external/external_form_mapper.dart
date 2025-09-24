

import 'package:app_template/domain/entities/external/external_form_list.dart';
import 'package:app_template/infraestructure/models/external/external_form.dart';

class ExternalFormMapper {

  static ExternalFormList externalFormListToEntity(External response) => ExternalFormList(
    id: response.id,
    name: response.name,
    category: response.category,
    formId: response.formId,
    slug: response.slug
  );
}