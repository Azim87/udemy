import 'package:dartz/dartz.dart';
import 'package:udemy/data/network/failure.dart';
import 'package:udemy/data/request/request.dart';
import 'package:udemy/domain/model/authentication.dart';
import 'package:udemy/domain/model/device_info.dart';
import 'package:udemy/domain/repository/repository.dart';
import 'package:udemy/domain/usecase/base_usecase.dart';
import 'package:udemy/util/functions.dart';

class LoginUseCase implements BaseUseCase<LoginUseCaseInput, Authentication> {
  final Repository _repository;

  LoginUseCase(this._repository);

  @override
  Future<Either<Failure, Authentication>> execute(
      LoginUseCaseInput input) async {
    DeviceInfo deviceInfo = await getDeviceDetails();

    return await _repository.login(
      LoginRequest(
        email: input.email,
        password: input.password,
        imei: deviceInfo.identifier,
        deviceType: deviceInfo.name,
      ),
    );
  }
}

class LoginUseCaseInput {
  final String email;
  final String password;

  LoginUseCaseInput({required this.email, required this.password});
}
