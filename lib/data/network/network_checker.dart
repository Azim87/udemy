import 'dart:io';

class NetworkConnectionChecker {
  NetworkConnectionChecker();

  Future<bool> get isConnection => checkConnection();

  Future<bool> checkConnection() async {
    final result = await InternetAddress.lookup('google.com');
    return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
  }
}
