class AppConfigs {
  static const DEV_ENVIRONMENT = DEV_ENVIRONMENT_ENUM.TEST;

  static bool isProductionEnv() {
    return AppConfigs.DEV_ENVIRONMENT == DEV_ENVIRONMENT_ENUM.PRODUCTION;
  }
}

enum DEV_ENVIRONMENT_ENUM { TEST, PRODUCTION }
