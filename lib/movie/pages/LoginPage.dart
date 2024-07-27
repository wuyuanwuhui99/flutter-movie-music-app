import 'package:flutter/material.dart';
import '../../utils/common.dart';
import '../model/LoginModel.dart';
import '../../router/index.dart';
import '../service/index.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../utils/crypto.dart';
import '../pages/MusicIndexPage.dart';
import '../provider/UserInfoProvider.dart';
import 'package:provider/provider.dart';
import '../../utils/LocalStorageUtils.dart';
import 'RegisterPage.dart';
import '../model/UserInfoModel.dart';
import '../../theme/ThemeStyle.dart';
import '../../theme/ThemeSize.dart';
import '../../theme/ThemeColors.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  bool loading = false;
  late UserInfoProvider provider;
  late BuildContext myContext;
  final LoginModel loginModel = LoginModel(userId:'',password: '');


  ///@author: wuwenqiang
  ///@description: 注册校验
  ///@date: 2024-07-27 17:55
  void useLogin() {
    if (loginModel.userId == '') {
      useToast("请输入账号");
    } else if (loginModel.password == '') {
      useToast("请输入密码");
    } else {
      if (loading) return;
      loginService(loginModel).then((res) {
        if(res.data != null){
          useToast("登录成功");
          String token = res.token!;
          LocalStorageUtils.setToken(token);
          provider.setUserInfo(UserInfoModel.fromJson(res.data));
          Routes.router.navigateTo(myContext, '/MusicIndexPage', replace: true);
        }else{
          useToast("账号或密码错误");
        }
        loading = false;
      }).catchError((e){
        loading = false;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    myContext = context;
    provider = Provider.of<UserInfoProvider>(context, listen: false);
    loginModel.userId = provider.userInfo?.userId??'';
    TextEditingController userController = TextEditingController(text: loginModel.userId);
    TextEditingController pwdController = TextEditingController(text: "");
    return Scaffold(
        backgroundColor: ThemeColors.colorBg,
        body: SafeArea(
          child: Container(
            padding: ThemeStyle.padding,
            margin: ThemeStyle.padding,
            decoration: ThemeStyle.boxDecoration,
            child: Column(
              children: <Widget>[
                Form(
                  child: Column(
                    children: <Widget>[
                      Center(
                          child: Image.asset(
                        "lib/assets/images/icon_logo.png",
                        width: ThemeSize.movieWidth / 2,
                        height: ThemeSize.movieWidth / 2,
                      )),
                      SizedBox(
                        height: ThemeSize.containerPadding * 2,
                      ),
                      Container(
                          margin: ThemeStyle.margin,
                          padding:
                              EdgeInsets.only(left: ThemeSize.containerPadding),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(ThemeSize.superRadius)),
                              border:
                                  Border.all(color: ThemeColors.borderColor)),
                          child: TextField(
                              onChanged: (value) {
                                if (value != "") {
                                  loginModel.userId = value;
                                } else {
                                  useToast('请输入用户名');
                                }
                              },
                              controller: userController,
                              cursorColor: Colors.grey, //设置光标
                              decoration: InputDecoration(
                                hintText: "请输入用户名",
                                icon: Image.asset(
                                    "lib/assets/images/icon_user.png",
                                    width: ThemeSize.smallIcon,
                                    height: ThemeSize.smallIcon),
                                hintStyle:
                                    TextStyle(fontSize: 14, color: Colors.grey),
                                contentPadding: EdgeInsets.only(left: 0.0),
                                border: InputBorder.none,
                              ))),
                      Container(
                          padding:
                              EdgeInsets.only(left: ThemeSize.containerPadding),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(ThemeSize.superRadius)),
                              border:
                                  Border.all(color: ThemeColors.borderColor)),
                          child: TextField(
                              onChanged: (value) {
                                if (value != "") {
                                  loginModel.password = value;
                                } else {
                                  useToast('请输入密码');
                                }
                              },
                              controller: pwdController,
                              obscureText: true,
                              cursorColor: Colors.grey,
                              //设置光标
                              decoration: InputDecoration(
                                icon: Image.asset(
                                    "lib/assets/images/icon_password.png",
                                    width: ThemeSize.smallIcon,
                                    height: ThemeSize.smallIcon),
                                hintText: "请输入密码",
                                hintStyle: TextStyle(
                                    fontSize: ThemeSize.smallFontSize,
                                    color: Colors.grey),
                                contentPadding: EdgeInsets.only(left: 0.0),
                                border: InputBorder.none,
                              ))),
                      SizedBox(height: ThemeSize.containerPadding),
                    ],
                  ),
                ),
                Column(
                  children: <Widget>[
                    SizedBox(
                      height: ThemeSize.buttonHeight,
                      width: double.infinity,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
                              backgroundColor: MaterialStateProperty.all(ThemeColors.warnColor)
                          ),
                          onPressed: useLogin,
                          child: Text("登录",
                              style: TextStyle(color: ThemeColors.colorWhite))),
                    ),
                    SizedBox(height: ThemeSize.containerPadding),
                    SizedBox(
                      height: ThemeSize.buttonHeight,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            side: MaterialStateProperty.all(BorderSide(width: 1.0, color: ThemeColors.colorBg)),
                            shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
                            backgroundColor: MaterialStateProperty.all(Colors.white)
                        ),
                        onPressed: () {
                          Routes.router.navigateTo(context, '/RegisterPage');
                        },
                        child: const Text("注册"),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
