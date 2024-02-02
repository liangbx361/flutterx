enum EnvEnum {
  dev,
  qa,
  prod;

  @override
  String toString() {
    switch (this) {
      case EnvEnum.dev:
        return 'dev';
      case EnvEnum.qa:
        return 'qa';
      case EnvEnum.prod:
        return 'prod';
    }
  }

  bool isDev(String value) => value == 'dev';
  bool isQa(String value) => value == 'qa';
  bool isProd(String value) => value == 'prod';
}
