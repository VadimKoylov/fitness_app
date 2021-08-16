import 'package:dio/dio.dart';
import 'package:fitness_app/models/news_data.dart';

class Api {
  Dio dio = new Dio();
  static const String BASE_URL = "https://app.ferfit.club/api/";
  static const String TOKEN =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NTksImlhdCI6MTYyMDQ5MTYxNCwiZXhwIjoxMDAxNjIwNDkxNjE0fQ.zGqmT0dH2bUMkG5DltUciML5CCXDbXsdO3p5a6AH5Z8";

  Api() {
    dio.options.headers['content-Type'] = 'application/json';
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {

          return handler.next(options);
        },
        onResponse: (response, handler) {
          if(response.statusCode == 200) {
            print(response.statusCode);
            return response.data['result']['access'];
          }
          return handler.next(response);
        },
        onError: (DioError e, handler) {
          print(e.message);
          return handler.next(e);
        },
      ),
    );
  }

  Future<void> refreshTokens() async {
    try {
      dio.options.headers["authorization"] = "bearer " + TOKEN;
      var myConnection = await dio.post(BASE_URL + 'auth/refresh-tokens');
      if (myConnection.statusCode == 200) {

      }
    } catch (e) {}
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
