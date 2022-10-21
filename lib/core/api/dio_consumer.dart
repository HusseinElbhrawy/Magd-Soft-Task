import 'dart:convert';
import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:magd_soft_task/core/api/api_consumer.dart';
import 'package:magd_soft_task/core/api/end_point.dart';
import 'package:magd_soft_task/core/api/status_code.dart';
import 'package:magd_soft_task/core/error/exceptions.dart';

import 'app_interceptor.dart';

//! If we need to send lang or token , we send them in header like this
/*
{ 
    'content-type': 'application/json',
      'accept': 'application/json',
      'authorization': AppConstants.token, 
      'language': await _appPreferences.getAppLanguage(),
}
*/

class DioConsumer implements ApiConsumer {
  final Dio client;

  DioConsumer({required this.client}) {
    //! Get Certificate and handCheck Error
    (client.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

    client.options
      ..baseUrl = EndPoint.baseUrl
      ..responseType = ResponseType.plain
      ..followRedirects = false
      ..validateStatus = (status) {
        return status! <
            StatusCode
                .internetServerError; //! We can change this with new class with new status code
      }
      ..sendTimeout = 60 * 1000
      ..receiveTimeout = 60 * 1000;

    // client.interceptors.add(serviceLocator<AppInterceptor>());

    // if (kDebugMode) client.interceptors.add(serviceLocator<LogInterceptor>());
  }

  @override
  Future get(String path, {Map<String, dynamic>? queryParameter}) async {
    try {
      final response = await client.get(path, queryParameters: queryParameter);
      return _handleResponseAsJson(response);
    } on DioError catch (error) {
      _handleDioError(error);
    }
  }

  @override
  Future post(String path,
      {Map<String, dynamic>? queryParameter,
      Map<String, dynamic>? body,
      bool supportFormData = false}) async {
    try {
      final response = await client.post(
        path,
        queryParameters: queryParameter,
        data: supportFormData ? FormData.fromMap(body!) : body,
      );
      return _handleResponseAsJson(response);
    } on DioError catch (error) {
      _handleDioError(error);
    }
  }

  @override
  Future put(String path,
      {Map<String, dynamic>? queryParameter,
      Map<String, dynamic>? body}) async {
    try {
      final response =
          await client.put(path, queryParameters: queryParameter, data: body);
      return _handleResponseAsJson(response);
    } on DioError catch (error) {
      _handleDioError(error);
    }
  }

  dynamic _handleResponseAsJson(Response<dynamic> response) {
    final responseJson = jsonDecode(response.data.toString());
    return responseJson;
  }

  dynamic _handleDioError(DioError error) {
    switch (error.type) {
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        throw const FetchDataException();

      case DioErrorType.response:
        switch (error.response?.statusCode) {
          case StatusCode.badRequest:
            throw const BadRequestException();
          case StatusCode.unauthorized:
          case StatusCode.forbidden:
            throw const UnauthorizedException();
          case StatusCode.notFound:
            throw const NotFoundException();
          case StatusCode.conflict:
            throw const ConflictException();
          case StatusCode.internetServerError:
            throw const InternalServerErrorException();
        }
        break;
      case DioErrorType.cancel:
        break;
      case DioErrorType.other:
        throw const NoInternetConnectionException();
    }
  }
}
