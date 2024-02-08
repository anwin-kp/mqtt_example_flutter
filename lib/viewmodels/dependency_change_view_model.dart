import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LifecycleHandler extends ChangeNotifier with WidgetsBindingObserver {
  AppLifecycleState? _appLifecycleState;

  LifecycleHandler() {
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    _appLifecycleState = state;
    switch (state) {
      case AppLifecycleState.resumed:
        if (kDebugMode) {
          print("app in resumed");
        }
        break;
      case AppLifecycleState.inactive:
        if (kDebugMode) {
          print("app in inactive");
        }
        break;
      case AppLifecycleState.paused:
        if (kDebugMode) {
          print("app in paused");
        }
        break;
      case AppLifecycleState.detached:
        if (kDebugMode) {
          print("app in detached");
        }
        break;
      case AppLifecycleState.hidden:
    }
    notifyListeners();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  AppLifecycleState? get state => _appLifecycleState;
}
