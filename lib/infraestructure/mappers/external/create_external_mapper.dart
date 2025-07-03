
import 'package:app_template/domain/entities/entities.dart';
import 'package:app_template/infraestructure/models/external/create_external.dart';

class CreateExternalMapper {

  static CreateActivityExternal createExternalEntity(CreateActivityExternalResponse response) => CreateActivityExternal(
    ok: response.ok,
    message: response.message,
  );
}