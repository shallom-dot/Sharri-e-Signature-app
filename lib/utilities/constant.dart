// constants.dart
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Constants {
  static final apiUrl = dotenv.env['API_URL'];
  static final apiKey = dotenv.env['API_KEY'];
  static final organizationId = dotenv.env['ORGANIZATION_ID'];
  static final appId = dotenv.env['APP_ID'];
  static final apiImageUrl = dotenv.env['API_IMAGE_URL'];
}
