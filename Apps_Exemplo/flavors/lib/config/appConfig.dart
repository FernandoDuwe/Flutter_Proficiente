enum AppType { desenv, test, production }

class AppConfig {
  String title;
  AppType appType;
  String folderImg;

  AppConfig({ required this.title, required this.appType, required this.folderImg });

  String get typeString {
    if (this.appType == AppType.desenv)
      return "Desenvolvimento";

    if (this.appType == AppType.test)
      return "Testes";

    if (this.appType == AppType.production)
      return "Produção";

    return "";
  }
}