
class CreateActivityExternal {
  final String ok;
  final String message;
  final String? erroCode;

  CreateActivityExternal({
    required this.ok,
    required this.message,
    this.erroCode,
  });
}