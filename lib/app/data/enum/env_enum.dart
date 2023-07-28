enum EnvEnum {
  mock,
  dev,
  qa,
  prod;
  
  @override
  String toString() {
    switch (this) {
      case EnvEnum.mock:
        return 'mock';
      case EnvEnum.dev:
        return 'dev';
      case EnvEnum.qa:
        return 'qa';
      case EnvEnum.prod:
        return 'prod';
      default:
        throw Exception('Unknown environment: $this');
    }
  }

  bool isMock(String value) => value == 'mock';
  bool isDev(String value) => value == 'dev';
  bool isQa(String value) => value == 'qa';
  bool isProd(String value) => value == 'prod';
}