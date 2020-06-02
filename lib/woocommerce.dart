import 'dart:convert';
import 'package:flutter/material.dart';
import 'rest.dart';
import 'endpoint.dart';
export 'endpoint.dart';

class WooCommerce {
  Endpoint endpoint;
  String versionPath = '/wc/v3';
  // WooCommerce API Path, eg: /wc/v1, /wc/v2, /wc/v3
  Rest rest;

  WooCommerce({
    @required Endpoint endpoint,
    String versionPath,
    @required String consumerKey,
    @required String consumerSecret,
  }) {
    this.endpoint = endpoint;

    if (versionPath != null) {
      this.versionPath = versionPath;
    }
    rest = new Rest(
        'Basic ${base64Encode(utf8.encode('$consumerKey:$consumerSecret'))}');
  }

  dynamic get(String path) async {
    return rest.get(endpoint.url + versionPath + path);
  }

  dynamic post(String path, Map data) async {
    return rest.post(endpoint.url + versionPath + path, data);
  }

  dynamic put(String path, Map data) async {
    return rest.put(endpoint.url + versionPath + path, data);
  }

  dynamic patch(String path, Map data) async {
    rest.patch(endpoint.url + versionPath + path, data);
  }

  dynamic delete(String path) async {
    return delete(endpoint.url + versionPath + path);
  }
}
