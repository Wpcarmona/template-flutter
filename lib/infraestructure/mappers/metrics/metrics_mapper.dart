

import 'package:app_template/domain/entities/metrics/metrics.dart';
import 'package:app_template/infraestructure/models/metrics/metrics.dart';

class MetricsMapper {

  static Metrics metricsToEntity(MetricsResponse response ) => Metrics(
    ok: response.ok,
    result: response.result,
  );
}