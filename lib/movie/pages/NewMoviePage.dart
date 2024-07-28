import 'package:flutter/material.dart';
import '../components/RecommendComponent.dart';
import '../model/MovieDetailModel.dart';
class NewMoviePage extends StatefulWidget {
  final MovieDetailModel movieItem;
  NewMoviePage({super.key,required this.movieItem});

  @override
  _NewMoviePageState createState() => _NewMoviePageState();
}

class _NewMoviePageState extends State<NewMoviePage> {
  bool isFavoriteFlag = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(child:
            Padding(padding: EdgeInsets.all(10),child:Column(children:[
              RecommendComponent(classify: "电影",direction: "vertical",title:"电影"),
              RecommendComponent(classify: "电视剧",direction: "vertical",title:"电视剧")
            ]))
        ,)
    );
  }
}
