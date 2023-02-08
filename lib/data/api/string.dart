import 'package:flutter_dotenv/flutter_dotenv.dart';

final String host = dotenv.env['HOST']!;
final String token = dotenv.env['TOKEN']!;
final headers = {
  'Content-Type': 'application/json',
  'Authorization': 'Bearer $token'
};
