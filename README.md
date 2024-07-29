# flutter电影APP

开发者：吴怨吴悔

=============================界面预览（如果无法预览，请查看项目根目录png文件）==========================

![app首页](./新版电影APP整体预览图.jpg)
![app首页](电影预览1.png)
![app首页](电影预览2.png)
![app首页](电影预览3.png)
![app首页](电影预览4.png)
![app首页](电影预览5.png)
![app首页](电影预览6.png)
![app首页](电影预览7.png)
![app首页](电影预览8.png)
![app首页](电影预览9.png)
![app首页](电影预览9-1.png)
![app首页](电影预览9-2.png)
![app首页](电影预览9-3.png)
![app首页](电影预览9-4.png)
![app首页](电影预览10.png)
![app首页](电影预览11.png)
![app首页](电影预览12.png)
![app首页](电影预览13.jpg)
![app首页](电影预览14.jpg)
![app首页](电影预览15.png)
![app首页](音乐首页.jpg)
![app首页](音乐推荐.jpg)
![app首页](音乐朋友圈1.jpg)
![app首页](音乐朋友圈2.png)
![app首页](音乐我的1.jpg)
![app首页](音乐我的2.png)
![app首页](音乐播放页.png)
![app首页](音乐播放页-播放模式切换.png)
![app首页](音乐播放页-收藏音乐.png)
![app首页](音乐播放页-创建收藏夹.png)
![app首页](音乐播放页-评论.png)
![app首页](音乐分享.png)
![app首页](音乐分享-权限选择.png)
![app首页](音乐歌词页.png)
![app首页](音乐歌手页.jpg)
![app首页](音乐搜索记录.png)
![app首页](音乐搜索列表.png)
![app首页](音乐点赞和评论.png)
![app首页](音乐圈评论.png)
![app首页](音乐收藏列表.png)
![app首页](音乐列表页.png)
=============================界面预览（如果无法预览，请查看项目根目录png文件）==========================


flutter版本：3.22.2

dart版本：3.4.3

### flutter2.x升级3.x版本，新版本和旧版本同时在维护

flutter2.x原地址：https://github.com/wuyuanwuhui99/flutter-movie-app-ui

运行命令：flutter run

后端接口使用springboot开发，所有电影数据来自于python爬虫程序，爬取第三方电影网站数据



app功能

​	●获取缓存用户数据

​	●获取token

​	●自动登录

​	●状态管理器provider

​	●底部导航栏

​	●头像

​	●电影搜索

​	●banner轮播

​	●滚动加载分类电影

​	●电影详情页

​	●电影推荐

​	●电影评分

​	●电影收藏

​	●电影评论

​	●电影播放器

​	●电影播放地址切换

​	●电影播放记录

​	●电影浏览记录

​	●电影收藏记录

​	●用户使用情况

​	●电影剧情

​	●电影演员

​	●音乐推荐

​	●音乐分类

​	●歌手分类

​	●滚动加载歌手分类

​	●推荐音乐

​	●音乐圈

​	●音乐评论

​	●音乐播放

​	●音乐歌词

​	●播放进度

​	●播放时间

​	●上一首

​	●下一首

​	●循环播放

​	●随机播放

​	●顺序播放

​	●注册

​	●登录

​	●退出登录

​	●相机

​	●相册

​	●修改用户信息

​	......

flutter2.x版本参见：https://github.com/wuyuanwuhui99/flutter-movie-app-ui   

flutter3.x版本参见：https://github.com/wuyuanwuhui99/flutter-movie-music-app

react native版本参见：https://github.com/wuyuanwuhui99/react-native-app-ui   

在线音乐和电影后端接口项目和sql语句：https://github.com/wuyuanwuhui99/springboot-app-service   

harmony鸿蒙java版本参见：https://github.com/wuyuanwuhui99/Harmony_movie_app_ui   

harmony鸿蒙arkts版本参见：https://github.com/wuyuanwuhui99/Harmony-arkts-movie-music-app-ui   

java安卓原生版本参见：https://github.com/wuyuanwuhui99/android-java-movie-app-ui   

kotlin安卓原生版本参见：https://github.com/wuyuanwuhui99/android-kotlin-jetpack-movie-app   

微信小程序版本参见：https://github.com/wuyuanwuhui99/weixin-movie-app-ui   

uniapp版本参见：https://github.com/wuyuanwuhui99/uniapp-vite-vue3-ts-movie-app-ui   

vue2在线音乐项目：https://github.com/wuyuanwuhui99/vue-music-app-ui   

在线音乐后端项目：https://github.com/wuyuanwuhui99/koa2-music-app-service   

vue3+ts明日头条项目：https://github.com/wuyuanwuhui99/vue3-ts-toutiao-app-ui   

使用token做登录验证，/service/movie/接口不需要验证，/service/movie-getway/接口需要token验证   

乐播放器正在开发中，音乐数据来自于python爬虫程序，爬取酷狗音乐数据，敬请关注   

接口和数据请在本地电脑中，暂时没有购买和部署服务器，仅限本地调试，如有需要调试请联系本人启动外网映射   

本地调试请把 http://192.168.0.5:5001 改成 http://254a2y1767.qicp.vip    
该地址是映射到本人电脑的地址，需要本人电脑开机才能访问，一般在工作日晚上八点半之后或者周末白天会开机   
如需了解是否已开机，请用浏览器直接打开该地址：http://254a2y1767.qicp.vip，如出现以下提示，则正常使用   
![外网映射正常访问提示](外网映射正常访问提示.png)

本站所有视频和图片均来自互联网收集而来，版权归原创者所有，本网站只提供web页面服务，并不提供资源存储，也不参与录制、上传 若本站收录的节目无意侵犯了贵司版权，请联系   

联系方式：（微信）wuwenqiang_99、（邮箱）275018723@qq.com
