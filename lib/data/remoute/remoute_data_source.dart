import 'package:udemy/data/network/api.dart';
import 'package:udemy/data/request/request.dart';
import 'package:udemy/data/responses/response.dart';

abstract class RemouteDataSource {
  Future<AuthenticationResponse> login(LoginRequest request);
}

class RemouteDataSourceImpl implements RemouteDataSource {
  final Api api;
  RemouteDataSourceImpl(this.api);

  @override
  Future<AuthenticationResponse> login(LoginRequest request) async => api.login(
        email: request.email,
        password: request.password,
        imei: request.imei,
        deviceType: request.deviceType,
      );
}
