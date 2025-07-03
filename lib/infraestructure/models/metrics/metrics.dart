import 'dart:convert';

MetricsResponse metricsResponseFromJson(String str) => MetricsResponse.fromJson(json.decode(str));

String metricsResponseToJson(MetricsResponse data) => json.encode(data.toJson());

class MetricsResponse {
    String ok;
    int result;

    MetricsResponse({
        required this.ok,
        required this.result,
    });

    factory MetricsResponse.fromJson(Map<String, dynamic> json) => MetricsResponse(
        ok: json["ok"],
        result: json["result"],
    );

    Map<String, dynamic> toJson() => {
        "ok": ok,
        "result": result,
    };
}
