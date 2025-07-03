
abstract class ExternalRepository {
  Future<void> sendClicks({
    required String toke,
    required String event,
    required String name,
  });
  
}
