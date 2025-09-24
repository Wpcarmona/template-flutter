

import 'package:app_template/domain/entities/external/external.dart';

abstract class ExternalDatasource{

  Future<void> sendClicks({
    required String token,
    required String event,
    required String name,
  });

  Future<ExternalFormField> getExternalFormField({required String token, required String externalActionId});

  Future<CreateActivityExternal> createActivityExternal({
    required String token,
    required String event,
    required String category,
    required Map<String, dynamic> properties,
  });

}