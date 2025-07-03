
import 'package:app_template/domain/entities/metrics/metrics.dart';

abstract class MetricsRepository {
  Future<Metrics> getMetrics({
    required String token,
    required String slug,
    required String timeFrame,
  });
}