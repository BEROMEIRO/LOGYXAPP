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
      _ossList = prefs.getStringList('ff_ossList') ?? _ossList;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _os = ''; // Renomeado para _os
  String get os => _os; // Acessor permanece igual
  set os(String value) {
    _os = value;
    notifyListeners();
  }

  String _projeto = '';
  String get projeto => _projeto;
  set projeto(String value) {
    _projeto = value;
    notifyListeners();
  }

  String _oCorrencia = '';
  String get ocorrencia => _oCorrencia;
  set ocorrencia(String value) {
    _oCorrencia = value;
    notifyListeners();
  }

  String _tIpo = '';
  String get tipo => _tIpo;
  set tipo(String value) {
    _tIpo = value;
    notifyListeners();
  }

  double _currentLat = 0.0;
  double get currentLat => _currentLat;
  set currentLat(double value) {
    _currentLat = value;
    notifyListeners();
  }

  double _currentLng = 0.0;
  double get currentLng => _currentLng;
  set currentLng(double value) {
    _currentLng = value;
    notifyListeners();
  }

  bool _isFirstDropdownSelected = false;
  bool get isFirstDropdownSelected => _isFirstDropdownSelected;
  set isFirstDropdownSelected(bool value) {
    _isFirstDropdownSelected = value;
    notifyListeners();
  }

  bool _isSecondDropdownSelected = false;
  bool get isSecondDropdownSelected => _isSecondDropdownSelected;
  set isSecondDropdownSelected(bool value) {
    _isSecondDropdownSelected = value;
    notifyListeners();
  }

  String _dEscriptiom = '';
  String get descriptiom => _dEscriptiom;
  set descriptiom(String value) {
    _dEscriptiom = value;
    notifyListeners();
  }

  String _tElefoneAppState = '';
  String get telefoneAppState => _tElefoneAppState;
  set telefoneAppState(String value) {
    _tElefoneAppState = value;
    notifyListeners();
  }

  String _nomeAppState = '';
  String get nomeAppState => _nomeAppState;
  set nomeAppState(String value) {
    _nomeAppState = value;
    notifyListeners();
  }

  String _emailAppState = '';
  String get emailAppState => _emailAppState;
  set emailAppState(String value) {
    _emailAppState = value;
    notifyListeners();
  }

  String _cPFAppState = '';
  String get cPFAppState => _cPFAppState;
  set cPFAppState(String value) {
    _cPFAppState = value;
    notifyListeners();
  }

  String _unidadeAppState = '';
  String get unidadeAppState => _unidadeAppState;
  set unidadeAppState(String value) {
    _unidadeAppState = value;
    notifyListeners();
  }

  String _uidAppState = '';
  String get uidAppState => _uidAppState;
  set uidAppState(String value) {
    _uidAppState = value;
    notifyListeners();
  }

  String _urlphoto = '';
  String get urlphoto => _urlphoto;
  set urlphoto(String value) {
    _urlphoto = value;
    notifyListeners();
  }

  String _aUTHTOKEN = '';
  String get aUTHTOKEN => _aUTHTOKEN;
  set aUTHTOKEN(String value) {
    _aUTHTOKEN = value;
    notifyListeners();
  }

  String _userNameAppState = '';
  String get userNameAppState => _userNameAppState;
  set userNameAppState(String value) {
    _userNameAppState = value;
    notifyListeners();
  }

  String _pWDAppState = '';
  String get pWDAppState => _pWDAppState;
  set pWDAppState(String value) {
    _pWDAppState = value;
    notifyListeners();
  }

  String _formattedPhone = '';
  String get formattedPhone => _formattedPhone;
  set formattedPhone(String value) {
    _formattedPhone = value;
    notifyListeners();
  }

  String _maskedPhoneNumber = '';
  String get maskedPhoneNumber => _maskedPhoneNumber;
  set maskedPhoneNumber(String value) {
    _maskedPhoneNumber = value;
    notifyListeners();
  }

  String _maskedEmail = '';
  String get maskedEmail => _maskedEmail;
  set maskedEmail(String value) {
    _maskedEmail = value;
    notifyListeners();
  }

  List<String> _ossList = [];
  List<String> get ossList => _ossList;
  set ossList(List<String> value) {
    _ossList = value;
    prefs.setStringList('ff_ossList', value);
    notifyListeners();
  }

  void addToOssList(String value) {
    ossList.add(value);
    prefs.setStringList('ff_ossList', _ossList);
    notifyListeners();
  }

  void removeFromOssList(String value) {
    ossList.remove(value);
    prefs.setStringList('ff_ossList', _ossList);
    notifyListeners();
  }

  void removeAtIndexFromOssList(int index) {
    ossList.removeAt(index);
    prefs.setStringList('ff_ossList', _ossList);
    notifyListeners();
  }

  void updateOssListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    ossList[index] = updateFn(_ossList[index]);
    prefs.setStringList('ff_ossList', _ossList);
    notifyListeners();
  }

  void insertAtIndexInOssList(int index, String value) {
    ossList.insert(index, value);
    prefs.setStringList('ff_ossList', _ossList);
    notifyListeners();
  }

  bool _isDropdownVisible = false;
  bool get isDropdownVisible => _isDropdownVisible;
  set isDropdownVisible(bool value) {
    _isDropdownVisible = value;
    notifyListeners();
  }

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;
  set selectedIndex(int value) {
    _selectedIndex = value;
    notifyListeners();
  }

  bool _isThirdDropdownSelected = false;
  bool get isThirdDropdownSelected => _isThirdDropdownSelected;
  set isThirdDropdownSelected(bool value) {
    _isThirdDropdownSelected = value;
    notifyListeners();
  }

  List<String> _limpaAPIProjeto = [];
  List<String> get limpaAPIProjeto => _limpaAPIProjeto;
  set limpaAPIProjeto(List<String> value) {
    _limpaAPIProjeto = value;
    notifyListeners();
  }

  void addToLimpaAPIProjeto(String value) {
    limpaAPIProjeto.add(value);
  }

  void removeFromLimpaAPIProjeto(String value) {
    limpaAPIProjeto.remove(value);
  }

  void removeAtIndexFromLimpaAPIProjeto(int index) {
    limpaAPIProjeto.removeAt(index);
  }

  void updateLimpaAPIProjetoAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    limpaAPIProjeto[index] = updateFn(_limpaAPIProjeto[index]);
  }

  void insertAtIndexInLimpaAPIProjeto(int index, String value) {
    limpaAPIProjeto.insert(index, value);
  }

  bool _isDropdownProjetoReset = false;
  bool get isDropdownProjetoReset => _isDropdownProjetoReset;
  set isDropdownProjetoReset(bool value) {
    _isDropdownProjetoReset = value;
    notifyListeners();
  }

  bool _isConnected = false;
  bool get isConnected => _isConnected;
  set isConnected(bool value) {
    _isConnected = value;
    notifyListeners();
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

//Future<void> _safeInitAsync(Future<void> Function() initializeField) async {
//  try {
//    await initializeField();
//  } catch (_) {}
//}
