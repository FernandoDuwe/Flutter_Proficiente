import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'cartoon_trivia_method_channel.dart';

abstract class CartoonTriviaPlatform extends PlatformInterface {
  /// Constructs a CartoonTriviaPlatform.
  CartoonTriviaPlatform() : super(token: _token);

  static final Object _token = Object();

  static CartoonTriviaPlatform _instance = MethodChannelCartoonTrivia();

  /// The default instance of [CartoonTriviaPlatform] to use.
  ///
  /// Defaults to [MethodChannelCartoonTrivia].
  static CartoonTriviaPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [CartoonTriviaPlatform] when
  /// they register themselves.
  static set instance(CartoonTriviaPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
