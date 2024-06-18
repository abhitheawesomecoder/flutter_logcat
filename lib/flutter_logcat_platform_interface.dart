import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_logcat_method_channel.dart';

abstract class FlutterLogcatPlatform extends PlatformInterface {
  /// Constructs a FlutterLogcatPlatform.
  FlutterLogcatPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterLogcatPlatform _instance = MethodChannelFlutterLogcat();

  /// The default instance of [FlutterLogcatPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterLogcat].
  static FlutterLogcatPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterLogcatPlatform] when
  /// they register themselves.
  static set instance(FlutterLogcatPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> log(String tag, String message, {String? type}) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
