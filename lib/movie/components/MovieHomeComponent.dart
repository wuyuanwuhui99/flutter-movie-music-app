import 'package:flutter/material.dart';
class MovieHomeComponent extends StatefulWidget {
  MovieHomeComponent({Key? key}) : super(key: key);

  @override
  MovieHomeComponentState createState() => MovieHomeComponentState();
}

class MovieHomeComponentState extends State<MovieHomeComponent>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Center(child:Text("电影首页"));
  }
}