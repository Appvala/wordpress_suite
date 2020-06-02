import 'dart:io';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'error.dart';

class Rest {
  Dio dio;
  String auth = '';

  Rest(
    String auth,
  ) {
    if (auth != null) {
      this.auth = auth;
    }
    this.dio = new Dio();
    this.dio.options.connectTimeout = 5000;
    this.dio.options.receiveTimeout = 15000;

    this.dio.interceptors.add(
      InterceptorsWrapper(onRequest: (RequestOptions options) async {
        this.dio.interceptors.requestLock.lock();
        options.headers['Authorization'] = this.auth;
        options.headers['Content-Type'] = 'application/json; charset=utf-8';
        options.headers['Cache-Control'] = 'no-cache';
        this.dio.interceptors.requestLock.unlock();
        return options;
      }),
    );
  }

  void setAuth(String auth) {
    this.auth = auth;
  }

  //  Handle network errors if [response.statusCode] is not 200 (OK).
  //   supports and give informations about errors 400, 401, 404 and 500
  Exception err(Response res) {
    switch (res.statusCode) {
      case 400:
      case 401:
      case 404:
      case 500:
        throw Exception(Error.fromJson(json.decode(res.data)).toString());
      default:
        throw Exception("Error code: ${res.statusCode}\nData: ${res.data}");
    }
  }

  dynamic handleResponse(Response res) {
    if (res.statusCode >= 200 && res.statusCode <= 226) {
      return res.data;
    }
    err(res);
  }

  dynamic get(String url) async {
    try {
      final Response res = await dio.get(url);
      return handleResponse(res);
    } on SocketException {
      throw Exception('Get request error');
    }
  }

  dynamic post(String url, Map data) async {
    try {
      final Response res = await dio.post(url, data: data);
      return handleResponse(res);
    } on Exception {
      throw Exception('Post request error');
    }
  }

  dynamic put(String url, Map data) async {
    try {
      final Response res = await dio.put(url, data: data);
      return handleResponse(res);
    } on Exception {
      throw Exception('Put request error');
    }
  }

  dynamic patch(String url, Map data) async {
    try {
      final Response res = await dio.patch(url, data: data);
      return handleResponse(res);
    } on Exception {
      throw Exception('Patch request error');
    }
  }

  dynamic delete(String url) async {
    try {
      final Response res = await dio.delete(url);
      return handleResponse(res);
    } on Exception {
      throw Exception('Delete request error');
    }
  }
}
