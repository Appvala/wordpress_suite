import 'package:flutter/material.dart';
import 'rest.dart';
import 'endpoint.dart';
export 'endpoint.dart';

class WordPress {
  Endpoint endpoint;
  String versionPath;
  // LearnPress API Path, Release very soon
  Rest rest;

  WordPress({
    @required Endpoint endpoint,
    String versionPath,
  }) {
    this.endpoint = endpoint;

    if (versionPath != null) {
      this.versionPath = versionPath;
    }

    rest = new Rest(null);
  }
}
