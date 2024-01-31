import 'package:get_storage/get_storage.dart';

class PreferenceUtils {
  static final GetStorage _box = GetStorage();

  static const _baseUrl = "BASE_URL";

  static Future<void> setBaseUrl(String? token) async {
    if (token == null) {
      await _box.remove(_baseUrl);
    } else {
      await _box.write(_baseUrl, token);
    }
  }

  static String? getBaseUrl() {
    return _box.read<String>(_baseUrl);
  }
}
