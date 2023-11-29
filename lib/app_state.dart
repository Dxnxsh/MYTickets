import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  List<DocumentReference> _CardPayment = [];
  List<DocumentReference> get CardPayment => _CardPayment;
  set CardPayment(List<DocumentReference> _value) {
    _CardPayment = _value;
  }

  void addToCardPayment(DocumentReference _value) {
    _CardPayment.add(_value);
  }

  void removeFromCardPayment(DocumentReference _value) {
    _CardPayment.remove(_value);
  }

  void removeAtIndexFromCardPayment(int _index) {
    _CardPayment.removeAt(_index);
  }

  void updateCardPaymentAtIndex(
    int _index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _CardPayment[_index] = updateFn(_CardPayment[_index]);
  }

  void insertAtIndexInCardPayment(int _index, DocumentReference _value) {
    _CardPayment.insert(_index, _value);
  }

  double _total = 0.0;
  double get total => _total;
  set total(double _value) {
    _total = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
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
