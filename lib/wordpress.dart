import 'dart:convert';
import 'package:flutter/material.dart';
import 'rest.dart';
import 'constants.dart';
export 'constants.dart';
import 'endpoint.dart';
export 'endpoint.dart';

class WordPress {
  Endpoint endpoint;
  String versionPath = '/wp/v2';
  // WordPress API Path, eg: /wp/v1, /wp/v2
  AuthMethod method;
  Rest rest;

  WordPress({
    @required Endpoint endpoint,
    String versionPath,
    @required AuthMethod method,
    String username,
    String password,
  }) {
    this.endpoint = endpoint;

    if (versionPath != null) {
      this.versionPath = versionPath;
    }

    this.method = method;

    switch (method) {
      case AuthMethod.ApplicationPasswords:
      case AuthMethod.BasicAuthentication:
        rest = new Rest(
            'Basic ${base64Encode(utf8.encode('$username:$password'))}');
        break;
      default:
        rest = new Rest(null);
        break;
    }
  }

  Future<dynamic> authenticate(String password, String username) async {
    switch (method) {
      case AuthMethod.JWT:
        return rest.post(endpoint.url + JWT_AUTHENTICATE, {
          'username': username,
          'password': password,
        });
        break;
      case AuthMethod.AAM:
        return rest.post(endpoint.url + AAM_AUTHENTICATE, {
          'username': username,
          'password': password,
          'issueJWT': true,
        });
        break;
      default:
        return false;
        break;
    }
  }

  Future<dynamic> validate(String jwt) async {
    switch (method) {
      case AuthMethod.JWT:
        rest.setAuth('Bearer $jwt');
        return rest.post(endpoint.url + JWT_VALIDATE, null);
        break;
      case AuthMethod.AAM:
        return rest.post(endpoint.url + AAM_VALIDATE, {
          'jwt': jwt,
        });
        break;
      default:
        return false;
        break;
    }
  }

  Future<dynamic> refresh(String jwt) async {
    switch (method) {
      case AuthMethod.AAM:
        return rest.post(endpoint.url + AAM_REFRESH, {
          'jwt': jwt,
        });
        break;
      default:
        return false;
        break;
    }
  }

  Future<dynamic> revoke(String jwt) async {
    switch (method) {
      case AuthMethod.AAM:
        return rest.post(endpoint.url + AAM_REVOKE, {
          'jwt': jwt,
        });
        break;
      default:
        return false;
        break;
    }
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
