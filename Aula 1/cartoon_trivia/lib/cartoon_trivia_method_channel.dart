import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'cartoon_trivia_platform_interface.dart';

/// An implementation of [CartoonTriviaPlatform] that uses method channels.
class MethodChannelCartoonTrivia extends CartoonTriviaPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('cartoon_trivia');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
