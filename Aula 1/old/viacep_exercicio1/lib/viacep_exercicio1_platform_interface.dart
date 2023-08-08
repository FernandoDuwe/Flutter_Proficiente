import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'viacep_exercicio1_method_channel.dart';

abstract class ViacepExercicio1Platform extends PlatformInterface {
  /// Constructs a ViacepExercicio1Platform.
  ViacepExercicio1Platform() : super(token: _token);

  static final Object _token = Object();

  static ViacepExercicio1Platform _instance = MethodChannelViacepExercicio1();

  /// The default instance of [ViacepExercicio1Platform] to use.
  ///
  /// Defaults to [MethodChannelViacepExercicio1].
  static ViacepExercicio1Platform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ViacepExercicio1Platform] when
  /// they register themselves.
  static set instance(ViacepExercicio1Platform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
