import 'package:flutter/material.dart';
import '/backend/backend.dart';
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

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _lang = prefs.getString('ff_lang') ?? _lang;
    });
    _safeInit(() {
      _Token = prefs.getString('ff_Token') ?? _Token;
    });
    _safeInit(() {
      _Quantity = prefs.getInt('ff_Quantity') ?? _Quantity;
    });
    _safeInit(() {
      _payment = prefs.getString('ff_payment') ?? _payment;
    });
    _safeInit(() {
      _Language = prefs.getBool('ff_Language') ?? _Language;
    });
    _safeInit(() {
      _VAT = prefs.getDouble('ff_VAT') ?? _VAT;
    });
    _safeInit(() {
      _appstate = prefs.getBool('ff_appstate') ?? _appstate;
    });
    _safeInit(() {
      _SupplierID = prefs.getInt('ff_SupplierID') ?? _SupplierID;
    });
    _safeInit(() {
      _SupplierToken = prefs.getString('ff_SupplierToken') ?? _SupplierToken;
    });
    _safeInit(() {
      _SupId = prefs.getString('ff_SupId') ?? _SupId;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _lang = '';
  String get lang => _lang;
  set lang(String value) {
    _lang = value;
    prefs.setString('ff_lang', value);
  }

  String _Token = '';
  String get Token => _Token;
  set Token(String value) {
    _Token = value;
    prefs.setString('ff_Token', value);
  }

  String _image = '';
  String get image => _image;
  set image(String value) {
    _image = value;
  }

  int _Quantity = 0;
  int get Quantity => _Quantity;
  set Quantity(int value) {
    _Quantity = value;
    prefs.setInt('ff_Quantity', value);
  }

  String _payment = '';
  String get payment => _payment;
  set payment(String value) {
    _payment = value;
    prefs.setString('ff_payment', value);
  }

  int _AddressId = 0;
  int get AddressId => _AddressId;
  set AddressId(int value) {
    _AddressId = value;
  }

  String _Address = '';
  String get Address => _Address;
  set Address(String value) {
    _Address = value;
  }

  String _Latlang = '';
  String get Latlang => _Latlang;
  set Latlang(String value) {
    _Latlang = value;
  }

  bool _Language = false;
  bool get Language => _Language;
  set Language(bool value) {
    _Language = value;
    prefs.setBool('ff_Language', value);
  }

  int _pageindex = 0;
  int get pageindex => _pageindex;
  set pageindex(int value) {
    _pageindex = value;
  }

  String _Type = '';
  String get Type => _Type;
  set Type(String value) {
    _Type = value;
  }

  double _VAT = 14.0;
  double get VAT => _VAT;
  set VAT(double value) {
    _VAT = value;
    prefs.setDouble('ff_VAT', value);
  }

  bool _appstate = false;
  bool get appstate => _appstate;
  set appstate(bool value) {
    _appstate = value;
    prefs.setBool('ff_appstate', value);
  }

  int _couponsId = 0;
  int get couponsId => _couponsId;
  set couponsId(int value) {
    _couponsId = value;
  }

  int _CouponsRatio = 0;
  int get CouponsRatio => _CouponsRatio;
  set CouponsRatio(int value) {
    _CouponsRatio = value;
  }

  bool _couponsSelect = false;
  bool get couponsSelect => _couponsSelect;
  set couponsSelect(bool value) {
    _couponsSelect = value;
  }

  int _SupplierID = 0;
  int get SupplierID => _SupplierID;
  set SupplierID(int value) {
    _SupplierID = value;
    prefs.setInt('ff_SupplierID', value);
  }

  String _SupplierToken = '';
  String get SupplierToken => _SupplierToken;
  set SupplierToken(String value) {
    _SupplierToken = value;
    prefs.setString('ff_SupplierToken', value);
  }

  int _ProductCatID = 0;
  int get ProductCatID => _ProductCatID;
  set ProductCatID(int value) {
    _ProductCatID = value;
  }

  List<String> _Images = [];
  List<String> get Images => _Images;
  set Images(List<String> value) {
    _Images = value;
  }

  void addToImages(String value) {
    Images.add(value);
  }

  void removeFromImages(String value) {
    Images.remove(value);
  }

  void removeAtIndexFromImages(int index) {
    Images.removeAt(index);
  }

  void updateImagesAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    Images[index] = updateFn(_Images[index]);
  }

  void insertAtIndexInImages(int index, String value) {
    Images.insert(index, value);
  }

  bool _proIsOffer = false;
  bool get proIsOffer => _proIsOffer;
  set proIsOffer(bool value) {
    _proIsOffer = value;
  }

  int _PetsId = 0;
  int get PetsId => _PetsId;
  set PetsId(int value) {
    _PetsId = value;
  }

  double _Setlat = 0.0;
  double get Setlat => _Setlat;
  set Setlat(double value) {
    _Setlat = value;
  }

  double _Setlong = 0.0;
  double get Setlong => _Setlong;
  set Setlong(double value) {
    _Setlong = value;
  }

  String _SupId = '';
  String get SupId => _SupId;
  set SupId(String value) {
    _SupId = value;
    prefs.setString('ff_SupId', value);
  }

  DocumentReference? _useridsupplier =
      FirebaseFirestore.instance.doc('/User/OOVq0BbANPPWcBGQ9QovgHk8zay2');
  DocumentReference? get useridsupplier => _useridsupplier;
  set useridsupplier(DocumentReference? value) {
    _useridsupplier = value;
  }

  String _OrederUserId = '';
  String get OrederUserId => _OrederUserId;
  set OrederUserId(String value) {
    _OrederUserId = value;
  }

  String _StoreAddress = '';
  String get StoreAddress => _StoreAddress;
  set StoreAddress(String value) {
    _StoreAddress = value;
  }

  LatLng? _StoreLatLang;
  LatLng? get StoreLatLang => _StoreLatLang;
  set StoreLatLang(LatLng? value) {
    _StoreLatLang = value;
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
