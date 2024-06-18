import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'flutter_logcat_platform_interface.dart';

/// An implementation of [FlutterLogcatPlatform] that uses method channels.
class MethodChannelFlutterLogcat extends FlutterLogcatPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_logcat');

  @override
  Future<String?> log(String tag, String message, {String? type}) async {
    Map<String, dynamic> param = {"tag": tag, "message": message};
    if (type != null) {
      param['type'] = type;
    }
    final response = await methodChannel.invokeMethod<dynamic>('log', param);
    return response;
  }
}
