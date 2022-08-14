import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://newsapi.org/',
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> getData({
    required String? url,
    required Map<String, dynamic>? query,
  }) async {
    return await dio!.get(url!, queryParameters: query);
  }
}















//https://newsapi.org/v2/top-headlines?sources=google-news-sa&apiKey=266ae07e81a143ac800c334eded97a30


//BaseUrl : https://newsapi.org/

//method : v2/top-headlines

//query : sources=google-news-sa&apiKey=266ae07e81a143ac800c334eded97a30
