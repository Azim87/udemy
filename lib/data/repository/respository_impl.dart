import 'package:udemy/data/mapper/mapper.dart';
import 'package:udemy/data/network/network_checker.dart';
import 'package:udemy/data/remoute/remoute_data_source.dart';
import 'package:udemy/data/request/request.dart';
import 'package:udemy/data/network/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:udemy/domain/model/authentication.dart';
import 'package:udemy/domain/repository/repository.dart';

class RepositoryImpl extends Repository {
  final RemouteDataSource _remouteDataSource;
  final NetworkConnectionChecker _networkConnectionChecker;

  RepositoryImpl(this._remouteDataSource, this._networkConnectionChecker);

  @override
  Future<Either<Failure, Authentication>> login(LoginRequest request) async {
    if (await _networkConnectionChecker.isConnection) {
      final response = await _remouteDataSource.login(request);
      if (response.status == 0) return Right(response.toDomain());
      return Left(Failure(401, response.message ?? 'we have error'));
    }
    return Left(
        Failure(409, 'No internet connection, please check your connection!'));
  }
}
