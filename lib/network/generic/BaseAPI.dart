import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:movies/network/generic/NetworkDefaults.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'exceptions/AppExceptions.dart';

class BaseApi {
  Dio dio = Dio();

  BaseApi() {
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
      String accessToken = await NetworkDefaults.getToken();
      options.headers.addAll({
        "Authorization": "$accessToken",
        "Accept": "application/json",
        "content-type": "application/json"
      });
      return options;
    }, onResponse: (Response response) async {
      return response;
    }, onError: (DioError e) async {
      return e;
    }));

    // add pretty logger to htttp requests
    dio.interceptors.add(PrettyDioLogger());
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90));

    // http options
    dio.options.baseUrl = "https://moneymanagingbackend.herokuapp.com/api/";
    dio.options.connectTimeout = 10000; //10s
    dio.options.receiveTimeout = 10000;
  }

  Future<dynamic> get(String url) async {
    var responseJson;
    try {
      final response = await dio.get(url);
      responseJson = response.data;
    } on TimeoutException catch (_) {
      print("Timeout");
    } on SocketException {
      print("No Internet");
      throw FetchDataException("No Internet Conection");
    }
    return responseJson;
  }

  Future<dynamic> post(String url, dynamic body) async {
    var responseJson;
    try {
      var response = await dio.post(url, data: body);
      responseJson = response.data;
    } on TimeoutException catch (_) {
      print("Timeout");
    } on SocketException {
      print("No Internet");
      throw FetchDataException("No Internet Conection");
    }
    return responseJson;
  }

  Future<dynamic> put(String url, dynamic body) async {
    var responseJson;
    try {
      final response = await dio.put(url, data: body);
      responseJson = response.data;
    } on TimeoutException catch (_) {
      print("Timeout");
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> delete(String url) async {
    var apiResponse;
    try {
      final response = await dio.delete(url);
      apiResponse = response.data;
    } on TimeoutException catch (_) {
      print("Timeout");
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    }
    return apiResponse;
  }

  // Helper methods
  addAuthorizationHeader() async {
    String accessToken = await NetworkDefaults.getToken();
    if (accessToken != null) {
      MapEntry<String, dynamic> entry = MapEntry("Authorization", accessToken);
      dio.options.headers.addEntries({entry});
    }
  }
}
