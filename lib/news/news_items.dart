import 'package:fitness_app/request/request.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'news_data.dart';

class NewsItems extends StatefulWidget{

  @override
  State<StatefulWidget> createState(){
    return NewsItemsState();
  }
}

class NewsItemsState extends State<NewsItems> {

  List<NewsData> currentNews = [];
  List<bool> buttonLike = [];

  @override
  Widget build(BuildContext context) {
    return _listNews();
  }

  Widget _listNews(){
    return Container(
      color: const Color(0xFFFFFFFF),
      child: currentNews.length != 0
          ? ListView.builder( shrinkWrap: true,
          itemCount: currentNews.length,
          itemBuilder: (context, i) {
            return _cardNews(currentNews[i], i);
          })
          : CircularProgressIndicator()
    );
  }

  Widget _cardNews(NewsData newsData, int likeNumber){
    return Card(
      margin: EdgeInsets.only(left: 17, top: 20, right: 15),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(40),
          topRight: const Radius.circular(4),
          bottomLeft: const Radius.circular(4),
          bottomRight: const Radius.circular(40)
        )
      ),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Image(
                    image: AssetImage("image/photo.png")),
                Container(
                  padding: EdgeInsets.only(left: 18),
                  child: Text(
                    newsData.firstName + " " + newsData.lastName,
                  style: TextStyle(color: const Color(0xFF252627),
                  fontSize: 16, fontFamily: 'Roboto'),),
                )
              ],
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 14, top: 13, right: 14),
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Text(newsData.caption!,
                  style: TextStyle(color: const Color(0xFF4D545C),
                    fontSize: 16, fontFamily: 'Roboto')),
                )
              ],
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 13, left: 16),
                  child: IconButton(
                    icon: Icon(Icons.favorite_outlined),
                    color: buttonLike[likeNumber]
                      ? const Color(0xFFD1414F)
                        : const Color(0xFFCED0D5),
                    onPressed: () {
                      setState(() {
                        buttonLike[likeNumber] = !buttonLike[likeNumber];
                      });
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 13),
                  child: Text("28",
                    style: TextStyle(color: const Color(0xFFCED0D5),
                        fontFamily: 'Roboto', fontSize: 17),)
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 13, left: 23),
                  child: Image(
                    image: AssetImage("image/comment.png"),
                  ),
                ),
                Container(
                    padding: EdgeInsets.only(bottom: 13, left: 9),
                    child: Text("12",
                      style: TextStyle(color: const Color(0xFFCED0D5),
                          fontFamily: 'Roboto', fontSize: 17),)
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    if (currentNews.isEmpty) {
      getNews();
    }
    super.initState();
  }

  void getNews() {
    Request request = new Request();
    Future<String> token = request.getToken();

    token.then((value) {
      Future<List<NewsData>> news = request.getNews(value);
      news.then((value){
        setState(() {
          currentNews = value;
          buttonLike = List.filled(currentNews.length, false);
          overrideNews();
        });
      });
    });
  }

  void overrideNews() {
    for (NewsData newsData in currentNews) {
      if (newsData.caption == null) {
        newsData.caption = " ";
      }
    }
  }
}