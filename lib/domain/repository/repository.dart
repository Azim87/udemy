import 'package:dartz/dartz.dart';
import 'package:udemy/data/network/failure.dart';
import 'package:udemy/data/request/request.dart';
import 'package:udemy/domain/model/authentication.dart';

abstract class Repository {
  Future<Either<Failure, Authentication>> login(LoginRequest request);
}
