import 'package:flutter/material.dart';
import './movie/pages/LaunchPage.dart';
import 'package:provider/provider.dart';
import './movie/provider/UserInfoProvider.dart';
import './router/index.dart';
import './movie/provider/TokenProvider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: TokenProvider('')), //初始化默认值
        ChangeNotifierProvider.value(value: UserInfoProvider(null)), //初始化默认值
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  static final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();
  MyApp({super.key}) {
    Routes.initRoutes();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        navigatorObservers: [MyApp.routeObserver],
        onGenerateRoute: Routes.router.generator,
        title: '电影音乐',
        debugShowCheckedModeBanner:false,
        theme: ThemeData.light(),
        home: LaunchPage());
  }
}
