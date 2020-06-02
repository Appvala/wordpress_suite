import 'package:flutter/material.dart';

class Endpoint {
  String _address;
  String _apiPath = '/wp-json';
  bool _isSsl;

  Endpoint({
    @required String address,
    String apiPath,
  }) {
    this._address = address;

    if (apiPath != null) {
      this._apiPath = apiPath;
    }

    if (this._address.startsWith("https")) {
      this._isSsl = true;
    } else {
      this._isSsl = false;
    }
  }

  String get address => _address;
  String get apiPath => _apiPath;
  String get url => _address + _apiPath;
  bool get isSsl => _isSsl;
}
