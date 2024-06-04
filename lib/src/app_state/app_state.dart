import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AppState {
  static final AppState _singleton = AppState._internal();

  factory AppState() {
    return _singleton;
  }

  AppState._internal();

  FlutterSecureStorage storage = const FlutterSecureStorage();
}
