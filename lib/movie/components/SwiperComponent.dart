import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../theme/ThemeStyle.dart';
import '../service/index.dart';
import '../../common/constant.dart';
import '../pages/MovieDetailPage.dart';
import '../model/MovieDetailModel.dart';
import '../../theme/ThemeSize.dart';

/*-----------------------轮播组件------------------------*/
class SwiperComponent extends StatelessWidget {
  final String classify;

  const SwiperComponent({super.key, required this.classify});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getCategoryListService("轮播", classify),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return Container();
          }
          var result = snapshot.data;
          List<MovieDetailModel> swiperDataList = [];
          if (result != null && result.data != null) {
            result.data?.sublist(0, 5).forEach((item) {
              swiperDataList.add(MovieDetailModel.fromJson(item));
            });
          }
          return Container(
              margin: ThemeStyle.margin,
              child:
              CarouselSlider(
                items:
              swiperDataList.map((ele) {
                return
                  ClipRRect(
                      borderRadius: BorderRadius.circular(ThemeSize.middleRadius),
                      child:
                      Image.network(
                        ele.localImg != null
                            ? HOST + ele.localImg
                            : ele.img,
                        fit: BoxFit.cover,
                      )
                  );
              }).toList(), options: CarouselOptions(
                viewportFraction:1,
                height: (MediaQuery.of(context).size.width - ThemeSize.containerPadding * 2) / 2,
                // 其他你需要的配置...
              ),
                  )
          );
        });
  }
}
/*-----------------------轮播组件------------------------*/