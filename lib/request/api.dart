import 'package:dio/dio.dart';
import 'package:fitness_app/models/news_data.dart';

class Api {
  Dio dio = new Dio();
  static const String BASE_URL = "https://app.ferfit.club/api/";
  static const String BASE_TOKEN = "";

  Api() {
    dio.options.headers['content-Type'] = 'application/json';
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          print(
              '_______________________${DateTime.now()}______________________');
          print('REQUEST[${options.method}]');
          print('PATH: ${options.path}');
          print('');

          return handler.next(options);
        },
        onResponse: (response, handler) {
          print(
              '_______________________${DateTime.now()}______________________');
          print('RESPONSE[${response.statusCode}]');
          print('PATH: ${response.requestOptions.path}');
          print('');
          return handler.next(response);
        },
        onError: (DioError e, handler) {
          print(
              '_______________________${DateTime.now()}______________________');
          print('ERROR[${e.response?.statusCode}]');
          print('PATH: ${e.requestOptions.path}');
          print('');
          return handler.next(e);
        },
      ),
    );
  }

  Future<String> refreshTokens() async {
    try {
      dio.options.headers["authorization"] =
          "bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NTksImlhdCI6MTYyMDQ5MTYxNCwiZXhwIjoxMDAxNjIwNDkxNjE0fQ.zGqmT0dH2bUMkG5DltUciML5CCXDbXsdO3p5a6AH5Z8";
      var myConnection = await dio.post(BASE_URL + 'auth/refresh-tokens');
      return myConnection.data['result']['access'];
    } catch (e) {
      return (e.toString());
    }
  }

  Future<List<NewsData>> getNews(String token) async {
    try {
      dio.options.headers["authorization"] = "bearer " + token;
      var response = await dio.get(
        BASE_URL + 'feed',
        queryParameters: {
          'limit': 10,
          'offset': 0,
          'maxDate': "2021-05-06T18:26:42.820994"
        },
      );
      return (response.data['result']['posts'] as List)
          .map((e) => NewsData.fromJson(e))
          .toList();
    } catch (e) {
      throw Exception("Exception: $e ");
    }
  }
}
