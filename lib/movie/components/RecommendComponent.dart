import 'package:flutter/material.dart';
import '../service/index.dart';
import 'MovieListComponent.dart';
import 'TitleComponent.dart';
import '../model/MovieDetailModel.dart';
import '../../theme/ThemeStyle.dart';

/*-----------------------获取推荐的影片------------------------*/
class RecommendComponent extends StatelessWidget {
  final String classify;
  final String direction;
  final String title;

  const RecommendComponent({super.key,required this.classify, required this.direction,required this.title});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getRecommendSerivce(classify),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return Container();
          } else {
            List<MovieDetailModel> movieList = [];
            snapshot.data?.data?.forEach((item) {
              movieList.add(MovieDetailModel.fromJson(item));
            });
            return Container(
              decoration: ThemeStyle.boxDecoration,
              padding: ThemeStyle.padding,
              margin: ThemeStyle.margin,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TitleComponent(title: title),
                  MovieListComponent(movieList: movieList, direction: direction)
                ],
              ),
            );
          }
        });
  }
}
/*-----------------------获取推荐的影片------------------------*/
