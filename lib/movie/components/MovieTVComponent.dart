import 'package:flutter/material.dart';
class MovieTVComponent extends StatefulWidget {
  MovieTVComponent({Key? key}) : super(key: key);

  @override
  MovieTVComponentState createState() => MovieTVComponentState();
}

class MovieTVComponentState extends State<MovieTVComponent>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Center(child:Text("电影"));
  }
}