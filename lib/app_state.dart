import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _cartTotal = prefs.getDouble('ff_cartTotal') ?? _cartTotal;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  double _timespentsellerpage = 0.0;
  double get timespentsellerpage => _timespentsellerpage;
  set timespentsellerpage(double value) {
    _timespentsellerpage = value;
  }

  double _cartTotal = 0.0;
  double get cartTotal => _cartTotal;
  set cartTotal(double value) {
    _cartTotal = value;
    prefs.setDouble('ff_cartTotal', value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
