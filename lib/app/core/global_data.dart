class GlobalData {
  static GlobalData? _instance;
  String? token;

  GlobalData._();

  factory GlobalData() {
    _instance ??= GlobalData._();
    return _instance!;
  }

  get getToken => _instance!.token;

  set setToken(String token) => _instance!.token = token;
  
}
