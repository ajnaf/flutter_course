import 'dart:convert';
import 'dart:io';

import 'package:flutter_course/app/locator.dart';
import 'package:flutter_course/models/city.dart';
import 'package:flutter_course/services/local_storage_service.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';

@lazySingleton
class ApiService {
  String _baseUrl = 'https://gecol-api.herokuapp.com/';

  final _dialogService = locator<DialogService>();
  final _snackbarService = locator<SnackbarService>();

  Future<List<City>> getCities() async {
    final response = await _get('cities', isAuthenticated: false);
    List<City> results = List<City>.empty(growable: true);
    if (response != null) {
      try {
        response.forEach((v) {
          results.add(City.fromJson(v));
        });
      } catch (e) {
        print(e.message);
      }
    }
    return results;
  }

  Future<dynamic> _get(String url, {bool isAuthenticated = true}) async {
    bool isSuccess = false;
    var client = http.Client();
    print('Api Get, url $url');
    var responseJson;
    do {
      try {
        responseJson = await client.get('$_baseUrl$url',
            headers: isAuthenticated
                ? {
                    // 'Authorization':
                    //     'Bearer ${await _localStorage.getUserAuth}',
                    'Accept': '*/*'
                  }
                : {});
        isSuccess = true;
        return _returnResponse(responseJson);
        // responseJson = _returnResponse(response);
      } on SocketException {
        // The request was made and the server responded with a status code
        await noInternetDialog();

        // if (res.confirmed) _get(url);
        // throw SocketException('لا يوجد اتصال بالانترنت');
        // print('api get recieved!');
        // return responseJson;
      } catch (e) {
        await _dialogService.showDialog(
            title: 'حدث خطأ ما',
            description: '${e.message} ',
            buttonTitle: 'إعادة المحاولة');
      }
    } while (!isSuccess);
  }

  Future<dynamic> _post(String url, {data, bool isAuthenticated = true}) async {
    bool isSuccess = false;
    var client = http.Client();
    print('Api Post, url $url');
    var responseJson;
    do {
      try {
        responseJson = await client.post('$_baseUrl$url',
            body: jsonEncode(data),
            headers: isAuthenticated
                ? {
                    // 'Authorization':
                    //     'Bearer ${await _localStorage.getUserAuth}',
                    'Accept': '*/*',
                    "Content-Type": "application/json"
                  }
                : {"Content-Type": "application/json"});
        isSuccess = true;
        return _returnResponse(responseJson);
        // responseJson = _returnResponse(response);
      } on SocketException {
        // The request was made and the server responded with a status code
        await noInternetDialog();

        // if (res.confirmed) _get(url);
        // throw SocketException('لا يوجد اتصال بالانترنت');
        // print('api get recieved!');
        // return responseJson;
      }
    } while (!isSuccess);
  }

  Future<dynamic> _put(String url, {data, bool isAuthenticated = true}) async {
    bool isSuccess = false;
    var client = http.Client();
    print('Api PUT, url $url');
    var responseJson;
    do {
      try {
        responseJson = await client.put('$_baseUrl$url',
            body: jsonEncode(data),
            headers: isAuthenticated
                ? {
                    // 'Authorization':
                    //     'Bearer ${await _localStorage.getUserAuth}',
                    'Accept': '*/*'
                  }
                : {"Content-Type": "application/json"});
        isSuccess = true;
        return _returnResponse(responseJson);
        // responseJson = _returnResponse(response);
      } on SocketException {
        // The request was made and the server responded with a status code
        await noInternetDialog();
        // if (res.confirmed) _get(url);
        // throw SocketException('لا يوجد اتصال بالانترنت');
        // print('api get recieved!');
        // return responseJson;
      } catch (e) {
        print(e.toString());
        _snackbarService.showSnackbar(message: e.toString());
      }
    } while (!isSuccess);
  }

  Future<DialogResponse> noInternetDialog() async {
    return await _dialogService.showDialog(
        title: 'أنت غير متصل بالانترنت',
        description: 'الرجاء التأكد من اتصالك بالانترنت ',
        buttonTitle: 'إعادة المحاولة');
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        print(responseJson);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}

class AppException implements Exception {
  final _message;
  final _prefix;
  AppException([this._message, this._prefix]);
  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends AppException {
  FetchDataException([String message])
      : super(message, "Error During Communication: ");
}

class BadRequestException extends AppException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends AppException {
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}

class InvalidInputException extends AppException {
  InvalidInputException([String message]) : super(message, "Invalid Input: ");
}
