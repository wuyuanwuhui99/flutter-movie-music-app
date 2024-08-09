import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import '../../theme/ThemeColors.dart';
import '../../utils/common.dart';
import '../service/index.dart';
import '../components/SearchCommponent.dart';
import '../components/AvaterComponent.dart';
import '../components/CategoryComponent.dart';
import '../components/SwiperComponent.dart';
import '../components/TopNavigators.dart';
import '../../theme/ThemeSize.dart';
import '../../theme/ThemeStyle.dart';
import '../model/CategoryModel.dart';

/*-----------------------首页------------------------*/
class MovieHomeComponent extends StatefulWidget {
  const MovieHomeComponent({super.key});

  @override
  MovieHomeComponentState createState() => MovieHomeComponentState();
}

class MovieHomeComponentState extends State<MovieHomeComponent>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  List<CategoryModel> categoryList = [];

  List<CategoryModel> allCategoryLists = [];

  EasyRefreshController easyRefreshController = EasyRefreshController();

  void _getCategoryItem() {
    if (categoryList.length < allCategoryLists.length) {
      setState(() {
        categoryList.add(allCategoryLists[categoryList.length]);
      });
    }
  }

  @override
  void initState() {
    getAllCategoryListByPageNameService("首页").then((res) {
      res.data?.forEach((element) {
        allCategoryLists.add(CategoryModel.fromJson(element));
      }); // 顶部轮播组件数
      setState(() {
        categoryList.addAll(allCategoryLists.sublist(0, 2));
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
        width:
        MediaQuery.of(context).size.width - ThemeSize.containerPadding * 2,
        padding: ThemeStyle.paddingBox,
        child: Column(children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                width: MediaQuery.of(context).size.width -
                    ThemeSize.containerPadding * 2,
                margin: ThemeStyle.margin,
                decoration: ThemeStyle.boxDecoration,
                child: Padding(
                  padding: ThemeStyle.padding,
                  child: Row(
                    children: <Widget>[
                      AvaterComponent(size: ThemeSize.middleAvater),
                      Expanded(
                          flex: 1,
                          child: Padding(
                              padding:
                              EdgeInsets.only(left: ThemeSize.smallMargin),
                              child: const SearchCommponent(classify: "电影")))
                    ],
                  ),
                ),
              )
            ],
          ),
          Expanded(
              flex: 1,
              child: EasyRefresh(
                  controller: easyRefreshController,
                  footer: ClassicalFooter(
                    loadText: '上拉加载',
                    loadReadyText: '准备加载',
                    loadingText: '加载中...',
                    loadedText: '加载完成',
                    noMoreText: '没有更多',
                    bgColor: Colors.transparent,
                    textColor: ThemeColors.disableColor,
                  ),
                  onLoad: () async {
                    if (categoryList.length == allCategoryLists.length) {
                      useToast('已经到底了');
                    } else {
                      _getCategoryItem();
                    }
                  },
                  child: ListView(
                    children: <Widget>[
                      const Column(
                        children: <Widget>[
                          SwiperComponent(classify: "电影"),
                          TopNavigators(),
                        ],
                      ),
                      Column(
                        children: categoryList.map((item) => CategoryComponent(
                          category: item.category,
                          classify: item.classify,
                        )).toList(),
                      )
                    ],
                  )))
        ]));
  }
}
/*-----------------------首页------------------------*/
