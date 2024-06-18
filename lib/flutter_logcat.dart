import 'flutter_logcat_platform_interface.dart';

class FlutterLogcat {
  Future<String?> d(String tag, String message) {
    return FlutterLogcatPlatform.instance.log(tag, message, type: "d");
  }

  Future<String?> w(String tag, String message) {
    return FlutterLogcatPlatform.instance.log(tag, message, type: "w");
  }

  Future<String?> v(String tag, String message) {
    return FlutterLogcatPlatform.instance.log(tag, message, type: "v");
  }

  Future<String?> e(String tag, String message) {
    return FlutterLogcatPlatform.instance.log(tag, message, type: "e");
  }

  Future<String?> i(String tag, String message) {
    return FlutterLogcatPlatform.instance.log(tag, message, type: "i");
  }
}

FlutterLogcat Log = FlutterLogcat();
