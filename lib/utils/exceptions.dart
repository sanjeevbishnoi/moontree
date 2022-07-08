class CustomException implements Exception {
  final String? _prefix;
  final String? _message;

  CustomException([this._prefix, this._message]);

  @override
  String toString() => [_prefix, _message].whereType<String>().join(': ');
}

class AlreadyListening extends CustomException {
  AlreadyListening([String? message]) : super('Already listening', message);
}
