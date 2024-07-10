import 'dart:async';
import 'dart:developer';
import 'package:dio/dio.dart';

class ActivitiesService {
  final Dio dio = Dio();
  final String baseUrl =
      "https://www.alexsportingclub.com/new/wp-json/sporting-api/v1/";

  ActivitiesService();

  Future dioGet(String endpoint,
      {Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers}) async {
    try {
      Response response = await dio.get(baseUrl + endpoint,
          queryParameters: queryParameters,
          options: Options(
            headers: headers,
          ));
          
      return response.data;
    } on DioException catch (e) {
      log(e.toString());
      throw Exception("Oops, there was an error. Please try again later.");
    }
  }

  Future dioPost(
      {required String endpoint,
      var data,
      required Map<String, dynamic> headers}) async {
    try {
      Response response = await dio.post(baseUrl + endpoint, data: data);
      return response.data;
    } on DioException catch (e) {
      log(e.toString());
      throw Exception("Oops, there was an error. Please try again later.");
    }
  }
}
