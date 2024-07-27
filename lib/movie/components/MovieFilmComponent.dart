import 'package:flutter/material.dart';
class MovieFilmComponent extends StatefulWidget {
  MovieFilmComponent({Key? key}) : super(key: key);

  @override
  MovieFilmComponentState createState() => MovieFilmComponentState();
}

class MovieFilmComponentState extends State<MovieFilmComponent>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Center(child:Text("电影"));
  }
}