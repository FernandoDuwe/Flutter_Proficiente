enum AppConfigType { desenvolvimento, testes, producao }

class AppConfig {
  AppConfigType appType;
  String title;
  String backgroundImage;

  AppConfig({ required this.appType, required this.title, required this.backgroundImage});

  // Getters
  bool get isDebugMode => ((this.appType == AppConfigType.desenvolvimento) || (this.appType == AppConfigType.testes));
}