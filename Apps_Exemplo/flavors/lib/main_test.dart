import 'package:flavors/config/appConfig.dart';
import 'package:flavors/main_common.dart';

void main() {
  AppConfig config = AppConfig(
      title: "Testes",
      appType: AppType.test,
      folderImg:
          "https://png.pngtree.com/thumb_back/fh260/background/20210908/pngtree-test-papers-daytime-answer-sheet-classroom-exam-photography-map-with-map-image_822606.jpg");

  mainCommon(config);
}
