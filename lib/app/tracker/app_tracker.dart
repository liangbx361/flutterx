abstract class AppTrackerEvent {
  void onEvent(String name, {Map<String, Object?>? parameters});
}

abstract class TrackerProvider extends AppTrackerEvent {
  init();
}

class AppTracker implements AppTrackerEvent {
  static AppTracker? _instance;
  static AppTracker get instance {
    _instance ??= AppTracker._internal();
    return _instance!;
  }

  final List<AppTracker> _providers = [];

  AppTracker._internal() {}

  void init() {
    for (var provider in _providers) {
      provider.init();
    }
  }

  @override
  void onEvent(String name, {Map<String, Object?>? parameters}) {
    for (var provider in _providers) {
      provider.onEvent(name, parameters: parameters);
    }
  }
}
