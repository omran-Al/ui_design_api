import 'package:dio/dio.dart';

//https://newsapi.org/v2/everything?domains=wsj.com&apiKey=API_KEY
class DioApps {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/',
        receiveDataWhenStatusError: true,
      ),
    );
    // ignore: avoid_print
    print('init APIS');
  }

  static Future<Response> getData({
    required String url,
    required Map<String, dynamic> query,
  }) async {
    // ignore: avoid_print
    print('GetData Response');
    return await dio!.get(url, queryParameters: query);
  }
}
