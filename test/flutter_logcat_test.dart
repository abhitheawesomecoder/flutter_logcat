import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_logcat/flutter_logcat.dart';
import 'package:flutter_logcat/flutter_logcat_platform_interface.dart';
import 'package:flutter_logcat/flutter_logcat_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterLogcatPlatform
    with MockPlatformInterfaceMixin
    implements FlutterLogcatPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterLogcatPlatform initialPlatform = FlutterLogcatPlatform.instance;

  test('$MethodChannelFlutterLogcat is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterLogcat>());
  });

  test('getPlatformVersion', () async {
    FlutterLogcat flutterLogcatPlugin = FlutterLogcat();
    MockFlutterLogcatPlatform fakePlatform = MockFlutterLogcatPlatform();
    FlutterLogcatPlatform.instance = fakePlatform;

    expect(await flutterLogcatPlugin.getPlatformVersion(), '42');
  });
}
