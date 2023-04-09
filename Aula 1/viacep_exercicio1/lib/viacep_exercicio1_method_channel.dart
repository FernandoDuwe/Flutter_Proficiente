import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'viacep_exercicio1_platform_interface.dart';

/// An implementation of [ViacepExercicio1Platform] that uses method channels.
class MethodChannelViacepExercicio1 extends ViacepExercicio1Platform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('viacep_exercicio1');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
