import 'package:flutter/material.dart';
class MovieMyComponent extends StatefulWidget {
  MovieMyComponent({Key? key}) : super(key: key);

  @override
  MovieMyComponentState createState() => MovieMyComponentState();
}

class MovieMyComponentState extends State<MovieMyComponent>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Center(child:Text("我的"));
  }
}