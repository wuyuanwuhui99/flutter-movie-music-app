import 'package:flutter/material.dart';
import 'dart:ui';
import "package:shared_preferences/shared_preferences.dart";
import '../../common/constant.dart';
import '../components/TitleComponent.dart';
import '../service/index.dart';
import './MovieDetailPage.dart';
import '../components/ScoreComponent.dart';
import '../components/RecommendComponent.dart';
import '../model/MovieDetailModel.dart';
import '../../theme/ThemeStyle.dart';
import '../../theme/ThemeColors.dart';
import '../../theme/ThemeSize.dart';

class MovieSearchPage extends StatefulWidget {
  final String keyword;

  MovieSearchPage({super.key,required this.keyword});

  @override
  _MovieSearchPageState createState() => _MovieSearchPageState();
}

class _MovieSearchPageState extends State<MovieSearchPage> {
  bool searching = false;
  bool showClearIcon = false;
  List<MovieDetailModel> searchResult = [];
  List<Widget> myHistoryLabels = [];
  List<String> myHistoryLabelsName = [];
  TextEditingController keywordController = TextEditingController();

  @override
  void initState() {
    keywordController.addListener(() {
      setState(() {
        showClearIcon = keywordController.text != "";
      });
    });
    getHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ThemeColors.colorBg,
        body: SafeArea(
          top: true,
          child: Container(
            padding: ThemeStyle.paddingBox,
            child: Column(children: <Widget>[
              buildSearchInputWidget(),
              searching
                  ? Expanded(
                      flex: 1,
                      child: searchResult.length == 0
                          ? Container(
                              decoration: ThemeStyle.boxDecoration,
                              padding: ThemeStyle.padding,
                              child: Center(
                                  child: Text(
                                "没有查询到影片",
                                style:
                                    TextStyle(fontSize: ThemeSize.bigFontSize),
                              )))
                          : SearchResult())
                  : Expanded(
                      flex: 1,
                      child: SingleChildScrollView(
                          child: Column(children: <Widget>[
                        buildHistorySearchWidget(),
                        RecommendComponent(
                            classify: "电影", direction: "vertical", title: "推荐")
                      ]))),
            ]),
          ),
        ));
  }

  Widget SearchResult() {
    return ListView.builder(
      itemCount: searchResult.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          MovieDetailPage(movieItem: searchResult[index])));
            },
            child: Container(
              padding: ThemeStyle.padding,
              margin: ThemeStyle.margin,
              decoration: ThemeStyle.boxDecoration,
              child: Row(
                children: <Widget>[
                  Container(
                    width: ThemeSize.movieWidth,
                    height: ThemeSize.movieHeight,
                    child: ClipRRect(
                        borderRadius:
                            BorderRadius.circular(ThemeSize.middleRadius),
                        child: Image(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                                searchResult[index].localImg != null
                                    ? HOST + searchResult[index].localImg
                                    : searchResult[index].img))),
                  ),
                  Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.only(left: ThemeSize.smallMargin),
                        height: ThemeSize.movieHeight,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              searchResult[index].movieName,
                              style: TextStyle(fontSize: ThemeSize.bigFontSize),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: ThemeSize.smallMargin),
                            Text(
                                searchResult[index].star != null
                                    ? "主演：" + searchResult[index].star!
                                    : "",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: ThemeSize.smallFontSize)),
                            SizedBox(height: ThemeSize.smallMargin),
                            Text(
                                searchResult[index].director != null
                                    ? "导演：" + searchResult[index].director!
                                    : "",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: ThemeSize.smallFontSize)),
                            SizedBox(height: ThemeSize.smallMargin),
                            Text(
                                searchResult[index].type != null
                                    ? "类型：" + searchResult[index].type!
                                    : "",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: ThemeSize.smallFontSize)),
                            SizedBox(height: ThemeSize.smallMargin),
                            Text(
                                searchResult[index].releaseTime != null
                                    ? "上映时间：" + searchResult[index].releaseTime!
                                    : "",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: ThemeSize.smallFontSize)),
                            SizedBox(height: ThemeSize.smallMargin),
                            ScoreComponent(score: searchResult[index].score),
                            SizedBox(height: ThemeSize.smallMargin),
                          ],
                        ),
                      ))
                ],
              ),
            ));
      },
    );
  }

  Widget buildSearchInputWidget() {
    return Container(
      decoration: ThemeStyle.boxDecoration,
      padding: ThemeStyle.padding,
      margin: ThemeStyle.margin,
      child: Row(
        children: <Widget>[
          Expanded(
              child: Container(
                  height: ThemeSize.buttonHeight,
                  //修饰黑色背景与圆角
                  decoration: new BoxDecoration(
                    color: ThemeColors.colorBg,
                    borderRadius: new BorderRadius.all(
                        new Radius.circular(ThemeSize.superRadius)),
                  ),
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(left: ThemeSize.smallMargin * 2),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          flex: 1,
                          child: TextField(
                              controller: keywordController,
                              cursorColor: Colors.grey, //设置光标
                              decoration: InputDecoration(
                                hintText: widget.keyword,
                                hintStyle: TextStyle(
                                    fontSize: ThemeSize.smallFontSize,
                                    color: Colors.grey),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(
                                    bottom: ThemeSize.smallMargin),
                              ))),
                      showClearIcon
                          ? InkWell(
                              onTap: () {
                                setState(() {
                                  keywordController.text = ""; //清除输入框的值
                                  searching = false;
                                  showClearIcon = false;
                                });
                              },
                              child: Image.asset(
                                "lib/assets/images/icon_clear.png",
                                height: ThemeSize.smallIcon,
                                width: ThemeSize.smallIcon,
                              ))
                          : SizedBox(),
                      SizedBox(width: ThemeSize.smallMargin)
                    ],
                  )),
              flex: 1),
          SizedBox(width: ThemeSize.smallMargin),
          Container(
              height: ThemeSize.buttonHeight,
              child: ElevatedButton(
                style: ButtonStyle(
                    shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
                    backgroundColor: MaterialStateProperty.all(ThemeColors.blueColor)
                ),
                onPressed: () async {
                  if (keywordController.text == "")
                    keywordController.text = widget.keyword;
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  int index =
                      myHistoryLabelsName.indexOf(keywordController.text);
                  if (index != -1) {
                    myHistoryLabelsName.removeAt(index);
                    myHistoryLabelsName.insert(0, keywordController.text);
                  } else {
                    myHistoryLabelsName.add(keywordController.text);
                  }
                  prefs.setString(
                      "historyMovieLabels", myHistoryLabelsName.join(","));
                  setState(() {
                    showClearIcon = true;
                    myHistoryLabels.insert(0, Label(keywordController.text));
                  });
                  goSearch();
                },
                child: Text(
                  '搜索',
                  style: TextStyle(
                      fontSize: ThemeSize.middleFontSize, color: Colors.white),
                ),
              ))
        ],
      ),
    );
  }

  void goSearch() {
    getSearchResultService(keywordController.text,
            pageSize: ThemeSize.pageSize, pageNum: 1)
        .then((res) {
      setState(() {
        searching = true;
        // 顶部轮播组件数
        res.data?.forEach((element) {
          searchResult.add(MovieDetailModel.fromJson(element));
        });
      });
    }).catchError(() {
      setState(() {
        searching = true;
      });
    });
  }

  Widget Label(String text) {
    return ElevatedButton(
      style: ButtonStyle(
          shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
          backgroundColor: MaterialStateProperty.all(ThemeColors.disableColor)
      ),
      onPressed: () {
        setState(() {
          keywordController.text = text;
          searching = true;
          showClearIcon = true;
        });
        goSearch();
      },
      child: Text(
        text,
        style: TextStyle(color: Colors.grey),
      ),
    );
  }

  getHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? historyLabels = prefs.getString('historyMovieLabels');
    if (historyLabels != null && historyLabels != '') {
      setState(() {
        myHistoryLabelsName = historyLabels.split(",");
        int length =
            myHistoryLabelsName.length <= 20 ? myHistoryLabelsName.length : 20;
        for (int i = 0; i < length; i++) {
          myHistoryLabels.add(Label(myHistoryLabelsName[i]));
        }
      });
    }
  }

  Widget buildHistorySearchWidget() {
    return Container(
      decoration: ThemeStyle.boxDecoration,
      padding: ThemeStyle.padding,
      margin: ThemeStyle.margin,
      alignment: Alignment.centerLeft,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TitleComponent(title: "历史搜索"),
            SizedBox(height: ThemeSize.containerPadding),
            myHistoryLabels.length > 0
                ? Wrap(
                    spacing: ThemeSize.smallMargin,
                    children: myHistoryLabels,
                  )
                : Container(
                    height: 80,
                    child: Text("暂无搜索记录"),
                    alignment: Alignment.center,
                  )
          ]),
    );
  }
}
