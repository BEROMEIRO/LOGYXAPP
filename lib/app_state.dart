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

  String _OS = '';
  String get OS => _OS;
  set OS(String value) {
    _OS = value;
  }

  String _Projeto = '';
  String get Projeto => _Projeto;
  set Projeto(String value) {
    _Projeto = value;
  }

  String _Ocorrencia = '';
  String get Ocorrencia => _Ocorrencia;
  set Ocorrencia(String value) {
    _Ocorrencia = value;
  }

  String _Tipo = '';
  String get Tipo => _Tipo;
  set Tipo(String value) {
    _Tipo = value;
  }

  double _currentLat = 0.0;
  double get currentLat => _currentLat;
  set currentLat(double value) {
    _currentLat = value;
  }

  double _currentLng = 0.0;
  double get currentLng => _currentLng;
  set currentLng(double value) {
    _currentLng = value;
  }

  bool _isFirstDropdownSelected = false;
  bool get isFirstDropdownSelected => _isFirstDropdownSelected;
  set isFirstDropdownSelected(bool value) {
    _isFirstDropdownSelected = value;
  }

  bool _isSecondDropdownSelected = false;
  bool get isSecondDropdownSelected => _isSecondDropdownSelected;
  set isSecondDropdownSelected(bool value) {
    _isSecondDropdownSelected = value;
  }

  String _Descriptiom = '';
  String get Descriptiom => _Descriptiom;
  set Descriptiom(String value) {
    _Descriptiom = value;
  }

  String _TelefoneAppState = '';
  String get TelefoneAppState => _TelefoneAppState;
  set TelefoneAppState(String value) {
    _TelefoneAppState = value;
  }

  String _NomeAppState = '';
  String get NomeAppState => _NomeAppState;
  set NomeAppState(String value) {
    _NomeAppState = value;
  }

  String _EmailAppState = '';
  String get EmailAppState => _EmailAppState;
  set EmailAppState(String value) {
    _EmailAppState = value;
  }

  String _CPFAppState = '';
  String get CPFAppState => _CPFAppState;
  set CPFAppState(String value) {
    _CPFAppState = value;
  }

  String _UnidadeAppState = '';
  String get UnidadeAppState => _UnidadeAppState;
  set UnidadeAppState(String value) {
    _UnidadeAppState = value;
  }

  String _uidAppState = '';
  String get uidAppState => _uidAppState;
  set uidAppState(String value) {
    _uidAppState = value;
  }

  String _urlphoto = '';
  String get urlphoto => _urlphoto;
  set urlphoto(String value) {
    _urlphoto = value;
  }

  String _AUTHTOKEN = '';
  String get AUTHTOKEN => _AUTHTOKEN;
  set AUTHTOKEN(String value) {
    _AUTHTOKEN = value;
  }

  String _userNameAppState = '';
  String get userNameAppState => _userNameAppState;
  set userNameAppState(String value) {
    _userNameAppState = value;
  }

  String _PWDAppState = '';
  String get PWDAppState => _PWDAppState;
  set PWDAppState(String value) {
    _PWDAppState = value;
  }

  String _formattedPhone = '';
  String get formattedPhone => _formattedPhone;
  set formattedPhone(String value) {
    _formattedPhone = value;
  }

  String _maskedPhoneNumber = '';
  String get maskedPhoneNumber => _maskedPhoneNumber;
  set maskedPhoneNumber(String value) {
    _maskedPhoneNumber = value;
  }

  String _maskedEmail = '';
  String get maskedEmail => _maskedEmail;
  set maskedEmail(String value) {
    _maskedEmail = value;
  }

  List<String> _ossList = [];
  List<String> get ossList => _ossList;
  set ossList(List<String> value) {
    _ossList = value;
    prefs.setStringList('ff_ossList', value);
  }

  void addToOssList(String value) {
    ossList.add(value);
    prefs.setStringList('ff_ossList', _ossList);
  }

  void removeFromOssList(String value) {
    ossList.remove(value);
    prefs.setStringList('ff_ossList', _ossList);
  }

  void removeAtIndexFromOssList(int index) {
    ossList.removeAt(index);
    prefs.setStringList('ff_ossList', _ossList);
  }

  void updateOssListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    ossList[index] = updateFn(_ossList[index]);
    prefs.setStringList('ff_ossList', _ossList);
  }

  void insertAtIndexInOssList(int index, String value) {
    ossList.insert(index, value);
    prefs.setStringList('ff_ossList', _ossList);
  }

  bool _isDropdownVisible = false;
  bool get isDropdownVisible => _isDropdownVisible;
  set isDropdownVisible(bool value) {
    _isDropdownVisible = value;
  }

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;
  set selectedIndex(int value) {
    _selectedIndex = value;
  }

  bool _isThirdDropdownSelected = false;
  bool get isThirdDropdownSelected => _isThirdDropdownSelected;
  set isThirdDropdownSelected(bool value) {
    _isThirdDropdownSelected = value;
  }

  List<String> _LimpaAPIProjeto = [];
  List<String> get LimpaAPIProjeto => _LimpaAPIProjeto;
  set LimpaAPIProjeto(List<String> value) {
    _LimpaAPIProjeto = value;
  }

  void addToLimpaAPIProjeto(String value) {
    LimpaAPIProjeto.add(value);
  }

  void removeFromLimpaAPIProjeto(String value) {
    LimpaAPIProjeto.remove(value);
  }

  void removeAtIndexFromLimpaAPIProjeto(int index) {
    LimpaAPIProjeto.removeAt(index);
  }

  void updateLimpaAPIProjetoAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    LimpaAPIProjeto[index] = updateFn(_LimpaAPIProjeto[index]);
  }

  void insertAtIndexInLimpaAPIProjeto(int index, String value) {
    LimpaAPIProjeto.insert(index, value);
  }

  bool _isDropdownProjetoReset = false;
  bool get isDropdownProjetoReset => _isDropdownProjetoReset;
  set isDropdownProjetoReset(bool value) {
    _isDropdownProjetoReset = value;
  }

  bool _isConnected = false;
  bool get isConnected => _isConnected;
  set isConnected(bool value) {
    _isConnected = value;
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
