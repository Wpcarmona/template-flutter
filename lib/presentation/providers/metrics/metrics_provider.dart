import 'package:app_template/domain/entities/metrics/metrics.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_template/domain/repositories/repository.dart';
import 'package:app_template/infraestructure/repositories/repositories_infraestructure.dart';
import 'package:app_template/presentation/infraestructure/services/key_value_storage_service.dart';
import 'package:app_template/presentation/infraestructure/services/key_value_storage_service_impl.dart';
import 'package:app_template/presentation/utils/dio_exception_handler.dart';

enum MetricsStatus {
  initial,
  loading,
  loaded,
  error,
}

final metricsProvider =
    StateNotifierProvider<MetricsNotifier, MetricsState>((ref) {
  final metricsRepository = MetricsRepositoryImpl();
  final keyValueStorageService = KeyValueStorageServiceImpl();
  return MetricsNotifier(
    ref: ref,
    metricsRepository: metricsRepository,
    keyValueStorageService: keyValueStorageService,
  );
});

class MetricsNotifier extends StateNotifier<MetricsState> {
  final Ref ref;
  final MetricsRepository metricsRepository;
  final KeyValueStorageService keyValueStorageService;

  MetricsNotifier({
    required this.ref,
    required this.metricsRepository,
    required this.keyValueStorageService,
  }) : super(MetricsState());

  Future<void> getMetrics() async {
    try {
      final token = await keyValueStorageService.getValue<String>('token');
      if (token == null) return;
      state = state.copyWith(status: MetricsStatus.loading);
      final metrics = await metricsRepository.getMetrics(
          token: token, slug: 'shift_records', timeFrame: 'this_week');
      state = state.copyWith(
          metrics: metrics, status: MetricsStatus.loaded, errorMessage: null);
    } on DioException catch (e) {
      handleDioException(e, (message) {
        state =
            state.copyWith(errorMessage: message, status: MetricsStatus.error);
      }, ref);
    }
  }
}

class MetricsState {
  final MetricsStatus status;
  final Metrics? metrics;
  final String? errorMessage;

  const MetricsState({
    this.status = MetricsStatus.initial,
    this.metrics,
    this.errorMessage,
  });

  MetricsState copyWith({
    MetricsStatus? status,
    Metrics? metrics,
    String? errorMessage,
  }) =>
      MetricsState(
        status: status ?? this.status,
        metrics: metrics ?? this.metrics,
        errorMessage: errorMessage ?? this.errorMessage,
      );
}
