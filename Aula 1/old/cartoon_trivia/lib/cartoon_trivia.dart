
import 'cartoon_trivia_platform_interface.dart';

class CartoonTrivia {
  Future<String?> getPlatformVersion() {
    return CartoonTriviaPlatform.instance.getPlatformVersion();
  }
}