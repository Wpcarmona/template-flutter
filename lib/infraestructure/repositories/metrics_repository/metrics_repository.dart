import 'package:app_template/domain/datasource/metrics_datasource/metrics_datasource.dart';
import 'package:app_template/domain/entities/metrics/metrics.dart';
import 'package:app_template/domain/repositories/metrics_repository/metrics_repository.dart';
import 'package:app_template/infraestructure/datasources/metrics_datasource/metrics_datasource.dart';

class MetricsRepositoryImpl extends MetricsRepository {
  final MetricsDatasource metricsDatasource;

  MetricsRepositoryImpl([MetricsDatasource? metricsDatasource])
      : metricsDatasource = metricsDatasource ?? MetricsImplDatasource();

  @override
  Future<Metrics> getMetrics(
      {required String token,
      required String slug,
      required String timeFrame}) {
    return metricsDatasource.getMetrics(
        token: token, slug: slug, timeFrame: timeFrame);
  }
}
