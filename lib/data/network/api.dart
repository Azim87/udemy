import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:udemy/data/responses/response.dart';
part 'api.g.dart';

@RestApi(baseUrl: 'http://test-azim.mocklab.io')
abstract class Api {
  factory Api(Dio dio, {String baseUrl}) = _Api;

  @POST('/customer/login')
  Future<AuthenticationResponse> login({
    @Field('email') String email,
    @Field('password') String password,
    @Field('imei') String imei,
    @Field('deviceType') String deviceType,
  });
}
