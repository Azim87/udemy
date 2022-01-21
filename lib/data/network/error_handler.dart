import 'package:dio/dio.dart';
import 'package:udemy/data/network/failure.dart';

enum DataSource {
  success,
  noContent,
  badRequest,
  forbidden,
  unauthorised,
  notFound,
  internalServerError,
  connectTimeOut,
  cancel,
  receiveTimeOut,
  sendTimeOut,
  cacheError,
  noInternetConnection,
  defaults,
}

class ErrorHandler implements Exception {
  late Failure failure;
  ErrorHandler.handle(dynamic error) {
    if (error is DioError) {
      failure = _handleError(error)!;
    } else {
      failure = DataSource.defaults.getFailure()!;
    }
  }

  Failure? _handleError(DioError error) {
    switch (error.type) {
      case DioErrorType.connectTimeout:
        return DataSource.connectTimeOut.getFailure();

      case DioErrorType.sendTimeout:
        return DataSource.sendTimeOut.getFailure();

      case DioErrorType.receiveTimeout:
        return DataSource.receiveTimeOut.getFailure();

      case DioErrorType.response:
        switch (error.response?.statusCode) {
          case ResponseCode.badRequest:
        }
        break;
        
      case DioErrorType.cancel:
        return DataSource.cancel.getFailure();

      case DioErrorType.other:
        return DataSource.defaults.getFailure();
    }
  }
}

class ResponseCode {
  static const int success = 200;
  static const int noContent = 201;
  static const int badRequest = 400; // failure, api rejected the request
  static const int forbidden = 403; // failure, api rejected the request
  static const int unauthorised = 401; // failure user is not authorised
  static const int notFound =
      404; // failure, api url is not correct and not found
  static const int internalServerError =
      500; // failure, crash happened in server side

  // local status code
  static const int defaults = -1;
  static const int connectTimeOut = -2;
  static const int cancel = -3;
  static const int receiveTimeOut = -4;
  static const int sendTimeOut = -5;
  static const int cacheError = -6;
  static const int noInternetConnection = -7;
}

class ResponseMessage {
  // API status codes
  static const String success = "success"; // success with data
  static const String noContent =
      "success with no content"; // success with no content
  static const String badRequest =
      "Bad request, try again later"; // failure, api rejected the request
  static const String forbidden =
      "forbidden request, try again later"; // failure, api rejected the request
  static const String unauthorised =
      "user is unauthorised, try again later"; // failure user is not authorised
  static const String notFound =
      "Url is not found, try again later"; // failure, api url is not correct and not found
  static const String internalServerError =
      "some thing went wrong, try again later"; // failure, crash happened in server side

  // local status code
  static const String defaults = "some thing went wrong, try again later";
  static const String connectTimeOut = "time out error, try again later";
  static const String cancel = "request was cancelled, try again later";
  static const String receiveTimeOut = "time out error, try again later";
  static const String sendTimeOut = "time out error, try again later";
  static const String cacheError = "Cache error, try again later";
  static const String noInternetConnection =
      "Please check your internet connection";
}

extension DataSourceExtension on DataSource? {
  Failure? getFailure() {
    switch (this) {
      case DataSource.badRequest:
        return Failure(ResponseCode.badRequest, ResponseMessage.badRequest);

      case DataSource.forbidden:
        return Failure(ResponseCode.forbidden, ResponseMessage.forbidden);

      case DataSource.unauthorised:
        return Failure(ResponseCode.unauthorised, ResponseMessage.unauthorised);

      case DataSource.notFound:
        return Failure(ResponseCode.notFound, ResponseMessage.notFound);

      case DataSource.internalServerError:
        return Failure(ResponseCode.internalServerError,
            ResponseMessage.internalServerError);

      case DataSource.connectTimeOut:
        return Failure(
            ResponseCode.connectTimeOut, ResponseMessage.connectTimeOut);

      case DataSource.cancel:
        return Failure(ResponseCode.cancel, ResponseMessage.cancel);

      case DataSource.receiveTimeOut:
        return Failure(
            ResponseCode.receiveTimeOut, ResponseMessage.receiveTimeOut);

      case DataSource.sendTimeOut:
        return Failure(ResponseCode.sendTimeOut, ResponseMessage.sendTimeOut);

      case DataSource.cacheError:
        return Failure(ResponseCode.cacheError, ResponseMessage.cacheError);

      case DataSource.noInternetConnection:
        return Failure(ResponseCode.noInternetConnection,
            ResponseMessage.noInternetConnection);

      case DataSource.defaults:
        return Failure(ResponseCode.defaults, ResponseMessage.defaults);

      default:
        return Failure(ResponseCode.defaults, ResponseMessage.defaults);
    }
  }
}
