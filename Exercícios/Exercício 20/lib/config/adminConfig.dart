enum AdminConfigType { production, development, testing }

class AdminConfig {
  AdminConfigType type = AdminConfigType.production;

  AdminConfig({required this.type});

  // Getters & Setters
  bool get isInternal => ((this.type == AdminConfigType.development) || (this.type == AdminConfigType.testing));

  bool get showDebugInfo => this.type == AdminConfigType.development;

  bool get showExperimentalOptions => this.isInternal;

  bool get isProduction => this.type == AdminConfigType.production;

  bool get isDevelopment => this.type == AdminConfigType.development;

  bool get isTesting => this.type == AdminConfigType.testing;
}