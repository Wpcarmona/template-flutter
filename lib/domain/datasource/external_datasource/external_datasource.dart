

abstract class ExternalDatasource{

  Future<void> sendClicks({
    required String token,
    required String event,
    required String name,
  });

}