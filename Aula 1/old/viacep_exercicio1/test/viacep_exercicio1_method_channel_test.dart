import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:viacep_exercicio1/viacep_exercicio1_method_channel.dart';

void main() {
  MethodChannelViacepExercicio1 platform = MethodChannelViacepExercicio1();
  const MethodChannel channel = MethodChannel('viacep_exercicio1');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
