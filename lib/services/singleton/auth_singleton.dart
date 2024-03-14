import 'package:latlng/latlng.dart';
import 'package:location/location.dart';
import 'package:pov/models/login/acess_model.dart';
import 'package:pov/models/login/login_model.dart';

import '../../repository/login_repository.dart';

class AuthSingleton {
  late LoginRepository _repository;
  AcessModel? _acess;
  LatLng? _localization;

  static final AuthSingleton _auth = AuthSingleton._internal();

  AuthSingleton._internal();

  factory AuthSingleton(LoginRepository lRepository) {
    _auth._repository = lRepository;
    return _auth;
  }

  String? getToken() {
    return _acess?.token;
  }

  int? getId() {
    return _acess?.userid;
  }

  bool? getGuide() {
    return _acess?.guide;
  }

  LatLng? getLocalization(){
    return _localization;
  }

  Future<AcessModel?> authenticate(LoginModel login) async {
    try {
      return _acess = await _repository.logar(login);
    } catch (e) {
      rethrow;
    }
  }

  Future verifyLocalization() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    final locationData = await location.getLocation();

    _localization = LatLng(locationData.latitude!, locationData.longitude!);
  }
}
