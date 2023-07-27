enum Env {
  mock,
  dev,
  qa,
  prod;
  
  @override
  String toString() {
    switch (this) {
      case Env.mock:
        return 'mock';
      case Env.dev:
        return 'dev';
      case Env.qa:
        return 'qa';
      case Env.prod:
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