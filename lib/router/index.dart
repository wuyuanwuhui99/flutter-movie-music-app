import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import '../movie/pages/MusicIndexPage.dart';
import '../movie/pages/LoginPage.dart';
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
    router.define('/MusicIndexPage', handler: Handler(handlerFunc: (BuildContext? context, Map<String,List<String>> params) {
      return MusicIndexPage();
    }));
  }
}