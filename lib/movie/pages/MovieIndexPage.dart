import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import '../../utils/HttpUtil%20.dart';
import '../../utils/LocalStorageUtils.dart';
import 'package:provider/provider.dart';
import '../components/MovieFilmComponent.dart';
import '../components/MovieHomeComponent.dart';
import '../components/MovieMyComponent.dart';
import '../components/MovieTVComponent.dart';
import '../provider/UserInfoProvider.dart';
import '../service/index.dart';
import '../../theme/ThemeColors.dart';
import '../../theme/ThemeSize.dart';
import '../model/UserInfoModel.dart';

class MovieIndexPage extends StatefulWidget {
  MovieIndexPageState createState() => MovieIndexPageState();
}

class MovieIndexPageState extends State<MovieIndexPage> {
  int _currentIndex = 0;
  List<Widget?> pages = [null, null, null, null];

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  final PageController _pageController = PageController();

  Widget? _getPage() {
    if (pages[_currentIndex] == null) {
      if (_currentIndex == 0) {
        pages[_currentIndex] = MovieHomeComponent();
      } else if (_currentIndex == 1) {
        pages[_currentIndex] = MovieFilmComponent();
      } else if (_currentIndex == 2) {
        pages[_currentIndex] = MovieTVComponent();
      } else if (_currentIndex == 3) {
        pages[_currentIndex] = MovieMyComponent();
      }
    }
    return pages[_currentIndex];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ThemeColors.colorBg,
        body: SafeArea(
            top: true,
            child: PageView.builder(
                controller: _pageController,
                physics: NeverScrollableScrollPhysics(),
                onPageChanged: _pageChanged,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return _getPage();
                })),
        bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels:true,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Image.asset(
                  'lib/assets/images/icon_home.png', // 替换为你的SVG文件路径
                  height: ThemeSize.navigationIcon,
                  width: ThemeSize.navigationIcon,
                  color: _currentIndex == 0 ? Colors.orange : Colors.black,
                ),
                label: '首页'),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'lib/assets/images/icon_movie.png', // 替换为你的SVG文件路径
                  height: ThemeSize.navigationIcon,
                  width: ThemeSize.navigationIcon,
                  color: _currentIndex == 1 ? Colors.orange : Colors.black,
                ),
                label: '电影'),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'lib/assets/images/icon_tv.png', // 替换为你的SVG文件路径
                  height: ThemeSize.navigationIcon,
                  width: ThemeSize.navigationIcon,
                  color: _currentIndex == 2 ? Colors.orange : Colors.black,
                ),
                label: '电视剧'),
            BottomNavigationBarItem(
                icon: Image.asset(
                    'lib/assets/images/icon_user.png', // 替换为你的SVG文件路径
                    height: ThemeSize.navigationIcon,
                    width: ThemeSize.navigationIcon,
                    color: _currentIndex == 3 ? Colors.orange : Colors.black),
                label: '我的'),
          ],
          selectedItemColor: Colors.orange,
          // 选中时的颜色
          unselectedItemColor: Colors.black,
          // 未选中时的颜色
          currentIndex: _currentIndex,
          onTap: (int index) {
            if (_currentIndex != index) {
              setState(() {
                _currentIndex = index;
              });
            }
          },
        ));
  }

  void _pageChanged(int index) {
    setState(() {
      if (_currentIndex != index) _currentIndex = index;
    });
  }

  void onTabTapped(int index) {
    _pageController.jumpToPage(index);
  }
}
