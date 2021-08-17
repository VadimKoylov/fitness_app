import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../models/news_data.dart';
import 'news_items_logic.dart';

class NewsItems extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NewsItemsState();
  }
}

class NewsItemsState extends State<NewsItems> {
  final newsItemsLogic = getLogicStore;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Container(
        color: Colors.white,
        child: newsItemsLogic.currentNews.length != 0
            ? CustomScrollView(
                slivers: <Widget>[
                  SliverAppBar(
                    expandedHeight: 56,
                    backgroundColor: Colors.transparent,
                    flexibleSpace: FlexibleSpaceBar(
                      title: Text(
                        "News",
                        style: TextStyle(
                          color: const Color(0xFF252627),
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return _cardNews(
                          newsItemsLogic.currentNews[index],
                          index,
                        );
                      },
                      childCount: newsItemsLogic.currentNews.length,
                    ),
                  ),
                ],
              )
            : CircularProgressIndicator(),
      ),
    );
  }

  Widget _cardNews(NewsData newsData, int likeNumber) {
    return Card(
      margin: EdgeInsets.only(left: 17, top: 20, right: 15),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(40),
          topRight: const Radius.circular(4),
          bottomLeft: const Radius.circular(4),
          bottomRight: const Radius.circular(40),
        ),
      ),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Image(
                  image: AssetImage("image/photo.png"),
                ),
                Container(
                  padding: EdgeInsets.only(left: 18),
                  child: Text(
                    newsData.firstName.toString() +
                        " " +
                        newsData.lastName.toString(),
                    style: TextStyle(
                      color: const Color(0xFF252627),
                      fontSize: 16,
                      fontFamily: 'Roboto',
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 14, top: 13, right: 14),
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Text(
                    newsData.caption.toString(),
                    style: TextStyle(
                      color: const Color(0xFF4D545C),
                      fontSize: 16,
                      fontFamily: 'Roboto',
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 13, left: 16),
                  child: IconButton(
                    icon: Icon(Icons.favorite_outlined),
                    color: newsItemsLogic.buttonLike[likeNumber]
                        ? const Color(0xFFD1414F)
                        : const Color(0xFFCED0D5),
                    onPressed: () {
                      setState(() {
                        newsItemsLogic.buttonLike[likeNumber] =
                            !newsItemsLogic.buttonLike[likeNumber];
                      });
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 13),
                  child: Text(
                    "28",
                    style: TextStyle(
                      color: const Color(0xFFCED0D5),
                      fontFamily: 'Roboto',
                      fontSize: 17,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 13, left: 23),
                  child: Image(
                    image: AssetImage("image/comment.png"),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 13, left: 9),
                  child: Text(
                    "12",
                    style: TextStyle(
                      color: const Color(0xFFCED0D5),
                      fontFamily: 'Roboto',
                      fontSize: 17,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    if (newsItemsLogic.currentNews.isEmpty) {
      newsItemsLogic.getNews();
    }
    super.initState();
  }
}
