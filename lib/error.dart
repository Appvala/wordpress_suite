class Error {
  String _code;
  String _message;
  Data _data;

  Error({String code, String message, Data data}) {
    this._code = code;
    this._message = message;
    this._data = data;
  }

  Error.fromJson(Map<String, dynamic> json) {
    _code = json['code'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  @override
  String toString() {
    return " Error!\ncode: $_code\nmessage: $_message\nstatus: ${_data.status}";
  }
}

class Data {
  int _status;

  Data({int status}) {
    this._status = status;
  }

  int get status => _status;

  Data.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
  }
}
