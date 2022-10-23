// ignore_for_file: constant_identifier_names

import 'package:dio/dio.dart';
import 'package:magd_soft_task/core/error/errors.dart';

class ErrorHandler implements Exception {
  late Failure failure;
  ErrorHandler.handle(dynamic error) {
    if (error is DioError) {
      failure = _handleError(error);
    } else {
      failure = DataSources.DEFAULT.getFailure();
    }
  }
}

Failure _handleError(DioError error) {
  switch (error.type) {
    case DioErrorType.connectTimeout:
      return DataSources.CONNECT_TIMEOUT.getFailure();
    case DioErrorType.sendTimeout:
      return DataSources.SEND_TIMEOUT.getFailure();
    case DioErrorType.receiveTimeout:
      return DataSources.RECEIVED_TIMEOUT.getFailure();
    case DioErrorType.response:
      if (error.response != null &&
          error.response!.statusCode != null &&
          error.response!.statusMessage != null) {
        return Failure(
          code: error.response!.statusCode!,
          message: error.response!.statusMessage!,
        );
      } else {
        return DataSources.DEFAULT.getFailure();
      }
    case DioErrorType.cancel:
      return DataSources.CANCEL.getFailure();
    case DioErrorType.other:
      return DataSources.DEFAULT.getFailure();
  }
}

enum DataSources {
  SUCCESS,
  NO_CONTENT,
  BAD_REQUEST,
  fORBIDDEN,
  UNAUTHORIZED,
  NOT_FOUND,
  INTERNET_SERVER_ERROR,
  CONNECT_TIMEOUT,
  CANCEL,
  RECEIVED_TIMEOUT,
  SEND_TIMEOUT,
  CACHED_ERROR,
  NO_INTERNET_CONNECTION,
  DEFAULT,
}

extension DataSourcesExtension on DataSources {
  Failure getFailure() {
    switch (this) {
      case DataSources.SUCCESS:
        return const Failure(
          code: ResponseCode.SUCCESS,
          message: ResponseMessage.SUCCESS,
        );
      case DataSources.NO_CONTENT:
        return const Failure(
          code: ResponseCode.NO_CONTENT,
          message: ResponseMessage.NO_CONTENT,
        );
      case DataSources.BAD_REQUEST:
        return const Failure(
          code: ResponseCode.BAD_REQUEST,
          message: ResponseMessage.BAD_REQUEST,
        );
      case DataSources.fORBIDDEN:
        return const Failure(
          code: ResponseCode.fORBIDDEN,
          message: ResponseMessage.fORBIDDEN,
        );
      case DataSources.UNAUTHORIZED:
        return const Failure(
          code: ResponseCode.UNAUTHORIZED,
          message: ResponseMessage.UNAUTHORIZED,
        );
      case DataSources.NOT_FOUND:
        return const Failure(
          code: ResponseCode.NOT_FOUND,
          message: ResponseMessage.NOT_FOUND,
        );
      case DataSources.INTERNET_SERVER_ERROR:
        return const Failure(
          code: ResponseCode.INTERNET_SERVER_ERROR,
          message: ResponseMessage.INTERNET_SERVER_ERROR,
        );
      case DataSources.CONNECT_TIMEOUT:
        return const Failure(
          code: ResponseCode.CONNECT_TIMEOUT,
          message: ResponseMessage.CONNECT_TIMEOUT,
        );
      case DataSources.CANCEL:
        return const Failure(
          code: ResponseCode.CANCEL,
          message: ResponseMessage.CANCEL,
        );
      case DataSources.RECEIVED_TIMEOUT:
        return const Failure(
          code: ResponseCode.RECEIVED_TIMEOUT,
          message: ResponseMessage.RECEIVED_TIMEOUT,
        );
      case DataSources.SEND_TIMEOUT:
        return const Failure(
          code: ResponseCode.SEND_TIMEOUT,
          message: ResponseMessage.SEND_TIMEOUT,
        );
      case DataSources.CACHED_ERROR:
        return const Failure(
          code: ResponseCode.CACHED_ERROR,
          message: ResponseMessage.CACHED_ERROR,
        );
      case DataSources.NO_INTERNET_CONNECTION:
        return const Failure(
          code: ResponseCode.NO_INTERNET_CONNECTION,
          message: ResponseMessage.NO_INTERNET_CONNECTION,
        );
      case DataSources.DEFAULT:

      default:
        return const Failure(
          code: ResponseCode.DEFAULT,
          message: ResponseMessage.DEFAULT,
        );
    }
  }
}

class ResponseCode {
  static const int SUCCESS = 200;
  static const int NO_CONTENT = 201; //success with no data
  static const int BAD_REQUEST = 400; //failure , api reject request
  static const int UNAUTHORIZED = 401; //failure, user is not auth
  static const int INTERNET_SERVER_ERROR =
      500; // failure , crash in server side
  static const int fORBIDDEN = 403; //failure , api  reject all requests

  //!Local Status Code
  static const int CONNECT_TIMEOUT = -1;
  static const int CANCEL = -2;
  static const int NOT_FOUND = -3;
  static const int RECEIVED_TIMEOUT = -4;
  static const int SEND_TIMEOUT = -5;
  static const int CACHED_ERROR = -6;
  static const int NO_INTERNET_CONNECTION = -7;
  static const int DEFAULT = -8;
}

class ResponseMessage {
  static const String SUCCESS = 'Success';
  static const String NO_CONTENT = 'No Content'; //success with no data
  static const String BAD_REQUEST =
      'Bad Request , Try again later'; //failure , api reject request
  static const String UNAUTHORIZED =
      'User in unauthorized '; //failure, user is not auth
  static const String INTERNET_SERVER_ERROR =
      'Some thing went wrong , check internet any try again later '; // failure , crash in server side
  static const String fORBIDDEN =
      'Forbidden'; //failure , api  reject all requests

  //!Local Status Code
  static const String CONNECT_TIMEOUT = 'Time out error , try again later';
  static const String CANCEL = 'request was cancelled , try again later';
  static const String NOT_FOUND = 'Not Found , , try again later';
  static const String RECEIVED_TIMEOUT = 'Time out error , try again later';
  static const String SEND_TIMEOUT = 'Time out  error , try again later';
  static const String CACHED_ERROR = 'Cached Error , try again later';
  static const String NO_INTERNET_CONNECTION =
      'Please check Internet  Connection';
  static const String DEFAULT = 'Some thing went wrong , try again later';
}

class ApiInternalStatus {
  static const int SUCCESS = 0;
  static const int FAILURE = 1;
}
