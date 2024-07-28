import 'package:flutter/material.dart';
import 'package:players/theme/ThemeColors.dart';
import '../../common/constant.dart';
import '../../router/index.dart';
import '../model/MovieDetailModel.dart';
import '../../theme/ThemeSize.dart';

/*-----------------------获取推荐的影片------------------------*/
class MovieListComponent extends StatelessWidget {
  final List<MovieDetailModel> movieList;
  final String direction;

  const MovieListComponent(
      {super.key, required this.movieList, required this.direction});

  List<Widget> _items(BuildContext context) {
    var tempList = movieList.map((item) {
      return movieItemWidget(item,context);
    });
    return tempList.toList();
  }

  Widget movieItemWidget(MovieDetailModel item,BuildContext context) {
    return InkWell(
        onTap: () {
          Routes.router.navigateTo(context, '/MovieDetailPage');
        },
        child: Column(children: <Widget>[
          ClipRRect(
              borderRadius: BorderRadius.circular(ThemeSize.middleRadius),
              child: Image(
                  width: ThemeSize.movieWidth,
                  height: ThemeSize.movieHeight,
                  fit: BoxFit.fill,
                  image: NetworkImage(item.localImg != null
                      ? HOST + item.localImg
                      : item.img))),
          SizedBox(height: ThemeSize.smallMargin),
          SizedBox(
              width: ThemeSize.movieWidth,
              child: Text(
                item.movieName,
                softWrap: true,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ))
        ]));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          direction == "vertical"
              ? GridView.count(
                  crossAxisSpacing: 10,
                  //水平子 Widget 之间间距
                  crossAxisCount: 3,
                  //一行的 Widget 数量
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  childAspectRatio: 0.55,
                  children: _items(context))
              : SizedBox(
                  height: ThemeSize.movieHeight +
                      ThemeSize.smallMargin +
                      ThemeSize.bigFontSize +
                      1,
                  width: MediaQuery.of(context).size.width -
                      ThemeSize.containerPadding * 2,
                  child: ListView.separated(
                    itemCount: movieList.length, // 假设有100个item
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (BuildContext context, int index) =>
                        VerticalDivider(
                            color: Colors.white,
                            width: ThemeSize.containerPadding),
                    itemBuilder: (context, index) {
                      return movieItemWidget(movieList[index],context);
                    },
                  ))
        ]);
  }
}
/*-----------------------获取推荐的影片------------------------*/
