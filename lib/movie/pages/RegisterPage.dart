import 'package:flutter/material.dart';

import '../../theme/ThemeColors.dart';
import '../../theme/ThemeSize.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  int groupValue = 0;

  void handleRadioValueChanged(int? value) {
    setState(() {
      groupValue = value!;
    });
  }

  ///@author: wuwenqiang
  ///@description: 注册
  ///@date: 2024-02-28 22:20
  useRegister(){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
            child: Padding(
      padding: EdgeInsets.only(left: ThemeSize.containerPadding,right: ThemeSize.containerPadding,top: ThemeSize.containerPadding),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              const SizedBox(
                width: 80,
                child: Text("用户名"),
              ),
              Expanded(
                flex: 1,
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: "请输入用户名",
                  ),
                  onChanged: (value) {},
                  validator: (value) {
                    return null;
                  },
                ),
              )
            ],
          ),
          SizedBox(height: ThemeSize.smallMargin),
          Row(
            children: <Widget>[
              const SizedBox(
                width: 80,
                child: Text("密码"),
              ),
              Expanded(
                flex: 1,
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: "请输入密码",
                  ),
                  onChanged: (value) {},
                  validator: (value) {
                    return null;
                  },
                ),
              )
            ],
          ),
          SizedBox(height: ThemeSize.smallMargin),
          Row(
            children: <Widget>[
              const SizedBox(
                width: 80,
                child: Text("确认密码"),
              ),
              Expanded(
                flex: 1,
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: "确认密码",
                  ),
                  onChanged: (value) {},
                  validator: (value) {
                    return null;
                  },
                ),
              )
            ],
          ),
          SizedBox(height: ThemeSize.smallMargin),
          Row(
            children: <Widget>[
              const SizedBox(
                width: 80,
                child: Text("昵称"),
              ),
              Expanded(
                flex: 1,
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: "请输入昵称",
                  ),
                  onChanged: (value) {},
                  validator: (value) {
                    return null;
                  },
                ),
              )
            ],
          ),
          SizedBox(height: ThemeSize.smallMargin),
          Row(
            children: <Widget>[
              const SizedBox(
                width: 80,
                child: Text("电话"),
              ),
              Expanded(
                flex: 1,
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: "请输入电话号码",
                  ),
                  onChanged: (value) {},
                  validator: (value) {
                    return null;
                  },
                ),
              )
            ],
          ),
          SizedBox(height: ThemeSize.smallMargin),
          Row(
            children: <Widget>[
              const SizedBox(
                width: 80,
                child: Text("邮箱"),
              ),
              Expanded(
                flex: 1,
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: "请输入邮箱地址",
                  ),
                  onChanged: (value) {},
                  validator: (value) {
                    return null;
                  },
                ),
              )
            ],
          ),
          SizedBox(height: ThemeSize.smallMargin),
          Row(
            children: <Widget>[
              const SizedBox(
                width: 80,
                child: Text("出生年月日"),
              ),
              Expanded(
                flex: 1,
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: "请输入邮箱地址",
                  ),
                  onChanged: (value) {},
                  validator: (value) {
                    return null;
                  },
                ),
              )
            ],
          ),
          SizedBox(height: ThemeSize.smallMargin),
          Row(
            children: <Widget>[
              const SizedBox(
                width: 80,
                child: Text("性别"),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  children: <Widget>[
                    const Text("男"),
                    Radio<int>(
                        value: 0,
                        groupValue: groupValue,
                        // title: Text("男"),
                        onChanged: handleRadioValueChanged),
                    SizedBox(width: ThemeSize.containerPadding),
                    const Text("女"),
                    Radio<int>(
                        value: 1,
                        groupValue: groupValue,
                        onChanged: handleRadioValueChanged),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: ThemeSize.buttonHeight,
            width: double.infinity,
            child: ElevatedButton(
                style: ButtonStyle(
                    shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
                    backgroundColor: MaterialStateProperty.all(ThemeColors.warnColor)
                ),
                onPressed: useRegister,
                child: Text("注册",
                    style: TextStyle(color: ThemeColors.colorWhite))),
          ),
        ],
      ),
    )));
    ;
  }
}
