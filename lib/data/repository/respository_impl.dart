import 'package:udemy/data/mapper/mapper.dart';
import 'package:udemy/data/network/api_internal_status.dart';
import 'package:udemy/data/network/error_handler.dart';
import 'package:udemy/data/network/network_checker.dart';
import 'package:udemy/data/remote/remoute_data_source.dart';
import 'package:udemy/data/request/request.dart';
import 'package:udemy/data/network/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:udemy/domain/model/authentication.dart';
import 'package:udemy/domain/repository/repository.dart';

class RepositoryImpl extends Repository {
  final RemouteDataSource _remoteDataSource;
  final NetworkConnectionChecker _networkConnectionChecker;

  RepositoryImpl(this._remoteDataSource, this._networkConnectionChecker);

  @override
  Future<Either<Failure, Authentication>> login(LoginRequest request) async {
    if (await _networkConnectionChecker.isConnection) {
      try {
        final response = await _remoteDataSource.login(request);
        if (response.status == ApiInternalStatus.SUCCESS) {
          Right(response.toDomain());
        } else {
          Left(
            Failure(
              response.status ?? ApiInternalStatus.FAILURE,
              response.message ?? ResponseMessage.defaults,
            ),
          );
        }

      } catch (error) {
        return Left(
          ErrorHandler.handle(error).failure,
        );
      }
    }
    return Left(DataSource.noInternetConnection.getFailure()!);
  }
}
