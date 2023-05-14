import 'package:flavors/config/appConfig.dart';
import 'package:flavors/main_common.dart';

void main() {
  AppConfig config = AppConfig(
      title: "Produção",
      appType: AppType.production,
      folderImg:
          "https://t3.ftcdn.net/jpg/04/26/37/18/360_F_426371877_jGyegFYEcXrgkc6zMrwbjkJlducr7z8h.jpg");

  mainCommon(config);
}
