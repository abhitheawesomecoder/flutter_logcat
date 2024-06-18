import 'package:flutter/services.dart';
import 'package:flutter_logcat/flutter_logcat.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_logcat/flutter_logcat_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelFlutterLogcat platform = MethodChannelFlutterLogcat();
  const MethodChannel channel = MethodChannel('flutter_logcat');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return 'Success';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('log', () async {
    expect(await Log.d("test_tag","test_message"), 'Success');
  });
}
