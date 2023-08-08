
import 'viacep_exercicio1_platform_interface.dart';

class ViacepExercicio1 {
  Future<String?> getPlatformVersion() {
    return ViacepExercicio1Platform.instance.getPlatformVersion();
  }
}
