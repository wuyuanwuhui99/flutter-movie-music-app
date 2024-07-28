import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
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

  List<Widget> categoryList = [];

  List<CategoryModel> allCategoryLists = [];

  int pageNum = 1;

  void _getCategoryItem() {
    if (pageNum < allCategoryLists.length) {
      setState(() {
        CategoryModel item = allCategoryLists[pageNum];
        categoryList.add(CategoryComponent(
          key: GlobalKey(),
          category: item.category,
          classify: item.classify,
        ));
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
        allCategoryLists.sublist(0, 2).forEach((CategoryModel item) {
          categoryList.add(CategoryComponent(
              category: item.category,
              classify: item.classify
          ));
        });
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
                  footer: MaterialFooter(),
                  onLoad: () async {
                    pageNum++;
                    if (pageNum >= allCategoryLists.length) {
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
                        children: categoryList,
                      )
                    ],
                  )))
        ]));
  }
}
/*-----------------------首页------------------------*/
