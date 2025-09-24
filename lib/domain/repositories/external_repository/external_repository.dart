import 'package:app_template/domain/entities/external/external.dart';

abstract class ExternalRepository {
  Future<void> sendClicks({
    required String toke,
    required String event,
    required String name,
  });

  Future<ExternalFormField> getExternalFormField(
      {required String token, required String externalActionId});

  Future<CreateActivityExternal> createActivityExternal({
    required String token,
    required String event,
    required String category,
    required Map<String, dynamic> properties,
  });

  Future<List<ExternalFormList>> getExternalFormListByCategory({required String token, required String category});
}
