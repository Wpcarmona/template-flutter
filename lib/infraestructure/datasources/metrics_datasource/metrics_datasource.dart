import 'dart:convert';

import 'package:app_template/config/constants/environment.dart';
import 'package:app_template/domain/datasource/metrics_datasource/metrics_datasource.dart';
import 'package:app_template/domain/entities/metrics/metrics.dart';
import 'package:app_template/infraestructure/mappers/metrics/metrics_mapper.dart';
import 'package:app_template/infraestructure/models/metrics/metrics.dart';
import 'package:dio/dio.dart';

class MetricsImplDatasource extends MetricsDatasource {
  final dio = Dio(BaseOptions(baseUrl: Environment.baseUrl));

  Metrics _jsonToMetrics(Map<String, dynamic> json) {
    final metricsResponse = MetricsResponse.fromJson(json);
    return MetricsMapper.metricsToEntity(metricsResponse);
  }

  @override
  Future<Metrics> getMetrics(
      {required String token,
      required String slug,
      required String timeFrame}) async {
    final response = await dio.post('/metrics/exec',
        options: Options(headers: {'Authorization': 'bearer $token'}),
        data: {
          'slug': slug,
          'timeframe': timeFrame,
        });

    final Map<String, dynamic> responseData = jsonDecode(response.data);
    return _jsonToMetrics(responseData);
  }
}
