import 'package:fitness_app/models/news_data.dart';
import 'package:fitness_app/request/api.dart';
import 'package:mobx/mobx.dart';

part 'news_items_logic.g.dart';

class NewsItemsLogic = _NewsItemsLogic with _$NewsItemsLogic;

abstract class _NewsItemsLogic with Store {
  @observable
  String? firstName;

  @observable
  String? lastName;

  @observable
  String? caption;

  @observable
  List<bool> buttonLike = [];

  @observable
  List<NewsData> currentNews = [];

  void getNews() async {
    Future<String> token = Api().refreshTokens();
    token.then((value) => getCurrentNews(value));
  }

  void getCurrentNews(String token) async {
    currentNews = await Api().getNews(token);
    buttonLike = List.filled(currentNews.length, false);
  }
}

NewsItemsLogic newsItemsLogic = NewsItemsLogic();

NewsItemsLogic get getLogicStore => newsItemsLogic;
