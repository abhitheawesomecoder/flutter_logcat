import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_logcat/flutter_logcat.dart';
import 'package:flutter_logcat/flutter_logcat_platform_interface.dart';
import 'package:flutter_logcat/flutter_logcat_method_channel.dart';

void main() {
  final FlutterLogcatPlatform initialPlatform = FlutterLogcatPlatform.instance;

  test('$MethodChannelFlutterLogcat is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterLogcat>());
  });

  test('log', () async {
    expect(await Log.d("test_tag","test_message"), 'Success');
  });
}
