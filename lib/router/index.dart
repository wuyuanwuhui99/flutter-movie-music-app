import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import '../movie/model/MovieDetailModel.dart';

import '../movie/pages/MovieDetailPage.dart';
import '../movie/pages/MovieIndexPage.dart';
import '../movie/pages/LoginPage.dart';
import '../movie/pages/MovieSearchPage.dart';
import '../movie/pages/RegisterPage.dart';

class Routes {
  static final FluroRouter router = FluroRouter();
  static void initRoutes() {
    router.define('/LoginPage', handler: Handler(handlerFunc: (BuildContext? context, Map<String,List<String>> params) {
      return LoginPage();
    }));
    router.define('/RegisterPage', handler: Handler(handlerFunc: (BuildContext? context, Map<String,List<String>> params) {
      return RegisterPage();
    }));
    router.define('/MovieIndexPage', handler: Handler(handlerFunc: (BuildContext? context, Map<String,List<String>> params) {
      return MovieIndexPage();
    }));
    router.define('/MovieDetailPage', handler: Handler(handlerFunc: (BuildContext? context, Map<String,List<String>> params) {
      return MovieDetailPage(movieItem:MovieDetailModel.fromJson(params['movieItem']?.first));
    }));
    router.define('/MovieSearchPage', handler: Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      return MovieSearchPage(keyword:params['keyword']!.first);
    }));
    // router.define('/MusicPlayerPage', handler: Handler(handlerFunc: (BuildContext context, params) {
    //   return MusicPlayerPage();
    // }));
    // router.define('/MusicLyricPage', handler: Handler(handlerFunc: (BuildContext context, Map<String,List<String>> params) {
    //   return MusicLyricPage();
    // }));
    // router.define('/MoviePlayerPage', handler: Handler(handlerFunc: (BuildContext context,Map<String, List<String>> params) {
    //   return MoviePlayerPage(movieItem: MovieDetailModel.fromJson(json.decode(params["movieItem"].first)));
    // }));
    // router.define('/MovieUserPage', handler: Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    //   return MovieUserPage();
    // }));
    // router.define('/NewMoviePage', handler: Handler(handlerFunc: (BuildContext context, Map<String, List<String>>params) {
    //   return NewMoviePage();
    // }));
    // router.define('/MusicIndexPage', handler: Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    //   return MusicIndexPage();
    // }));
    // router.define('/MusicSingerPage', handler: Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    //   return MusicSingerPage();
    // }));
    // router.define('/MusicSharePage', handler: Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    //   return MusicSharePage(musicModel:MusicModel.fromJson(jsonDecode(params['musicItem'].first)));
    // }));
    // router.define('/MusicFavoriteListPage', handler: Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    //   return MusicFavoriteListPage(favoriteDirectoryModel:FavoriteDirectoryModel.fromJson(jsonDecode(params['favoriteDirectoryModel'].first)));
    // }));
    // router.define('/MusicClassifyListPage', handler: Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    //   return MusicClassifyListPage(musicClassifyModel:MusicClassifyModel.fromJson(jsonDecode(params['musicClassifyModel'].first)));
    // }));
  }
}