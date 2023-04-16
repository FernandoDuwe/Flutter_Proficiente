enum LogType { fromOpenedApp, fromBackgroundProcess }

class LogModel {
  late DateTime dateTime;
  late LogType type;

  LogModel.fromOpenedApp() {
    this.dateTime = DateTime.now();
    this.type = LogType.fromOpenedApp;
  }

  LogModel.fromBackgroundProcess() {
    this.dateTime = DateTime.now();
    this.type = LogType.fromBackgroundProcess;
  }

  LogModel.fromJSON(Map<String, dynamic> prJSON) {
    this.dateTime = DateTime.parse(prJSON["dateTime"]);

    if (prJSON["type"] == LogType.fromOpenedApp.index)
      this.type = LogType.fromOpenedApp;

    if (prJSON["type"] == LogType.fromBackgroundProcess.index)
      this.type = LogType.fromBackgroundProcess;
  }

  Map<String, dynamic> toJSON() {
    return {"dateTime": this.dateTime.toString(), "type": this.type.index};
  }

  String get typeStr {
    if (this.type == LogType.fromOpenedApp)
      return "Log a partir do app aberto";

    if (this.type == LogType.fromBackgroundProcess)
      return "Log a partir do background";

    return "";
  }
}
