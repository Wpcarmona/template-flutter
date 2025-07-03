
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_template/domain/entities/entities.dart';
import 'package:app_template/domain/repositories/external_repository/external_repository.dart';
import 'package:app_template/infraestructure/repositories/external_repository/external_repository.dart';
import 'package:app_template/presentation/infraestructure/services/key_value_storage_service.dart';
import 'package:app_template/presentation/infraestructure/services/key_value_storage_service_impl.dart';


enum ExternalStatus {
  initial,
  loading,
  success,
  error,
}

final externalProvider =
    StateNotifierProvider<ExternalNotifier, ExternalState>((ref) {
  final externalRepository = ExternalRepositoryImpl();
  final keyValueStorageService = KeyValueStorageServiceImpl();

  return ExternalNotifier(
    ref: ref,
    externalRepository: externalRepository,
    keyValueStorageService: keyValueStorageService,
  );
});

class ExternalNotifier extends StateNotifier<ExternalState> {
  final Ref ref;
  final ExternalRepository externalRepository;
  final KeyValueStorageService keyValueStorageService;

  ExternalNotifier({
    required this.ref,
    required this.externalRepository,
    required this.keyValueStorageService,
  }) : super(ExternalState());

  

  
  Map<String, dynamic> transformFieldsToMap(List<FieldEntityField> fields) {
    final Map<String, dynamic> transformedData = {};

    for (final field in fields) {
      final name = field.name;
      final defaultValue = field.defaultValue;
      final typeValue = field.typeValue;
      final choices = field.choices;

      if (typeValue == 'Array') {
        transformedData[name] = choices?.map((choice) {
          return {
            'label': choice.label,
            'value': choice.value,
          };
        }).toList();
      } else if (typeValue == 'Time') {
        transformedData[name] =
            defaultValue != null ? DateTime.tryParse(defaultValue) : null;
      } else {
        transformedData[name] = defaultValue;
      }
    }

    return transformedData;
  }
}

class ExternalState {
  final ExternalStatus status;
  final List<Map<String, String>> externalFormField;
  final String? errorMessage;

  ExternalState({
    this.status = ExternalStatus.initial,
    this.externalFormField = const [],
    this.errorMessage,
  });

  ExternalState copyWith({
    ExternalStatus? status,
    List<Map<String, String>>? externalFormField,
    String? errorMessage,
  }) {
    return ExternalState(
      status: status ?? this.status,
      externalFormField: externalFormField ?? this.externalFormField,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
