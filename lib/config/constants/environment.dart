import 'package:flutter_dotenv/flutter_dotenv.dart';


class Environment {
 static String baseUrl = dotenv.env['BASE_URL'] ?? '';
  static String mapsApiKey = dotenv.env['MAPS_API_KEY'] ?? '';
  static String altBaseUlr = dotenv.env['BASE_ALT_URL'] ?? '';
  static String apiKey = dotenv.env['API_KEY'] ?? '';
  static String campaign = dotenv.env['CAMPAIGN'] ?? '';
}