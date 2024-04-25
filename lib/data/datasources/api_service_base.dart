import 'dart:async';
import 'package:dio/dio.dart';
import 'package:survey_frontend/domain/external_services/api_response.dart';

abstract class APIServiceBase{
  final Dio _dio;
  
  APIServiceBase(this._dio);

  Future<APIResponse<T>> get<T>(String url, T Function(dynamic json) deserialize) async {
  try {
    Response response = await _dio.get(url);
    dynamic jsonData = response.data;
    T data = deserialize(jsonData);
    return APIResponse<T>(statusCode: response.statusCode!, body: data);
  } catch (error) {
    if (error is DioException) {
      return _fromDioException(error);
    }
    return APIResponse<T>(error: error);
  }
}


  APIResponse<T> _fromDioException<T>(DioException de){
    var response = de.response;
    if (response == null){
      return APIResponse<T>(error: de);
    }
    return APIResponse<T>(statusCode: response.statusCode!, errorBody: response.data,);
  }


  Future<APIResponse<T>> post<T>(String url, Map<String, dynamic> body) async{
    try{
      Response<T> response = await _dio.post(url, data: body);
      return APIResponse<T>(statusCode: response.statusCode!, body: response.data);
    } catch (error){
      if (error is DioException){
        return _fromDioException(error);
      }
      return APIResponse<T>(error: error);
    }
  }
}