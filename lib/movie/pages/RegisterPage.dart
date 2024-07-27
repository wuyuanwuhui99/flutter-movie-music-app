import 'package:flutter/material.dart';

import '../../theme/ThemeColors.dart';
import '../../theme/ThemeSize.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

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
      padding: EdgeInsets.only(left: 20,right: 20,top: 20),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                child: Text("用户名"),
                width: 80,
              ),
              Expanded(
                flex: 1,
                child: TextFormField(
                  decoration: InputDecoration(
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
          SizedBox(height: 10),
          Row(
            children: <Widget>[
              Container(
                child: Text("密码"),
                width: 80,
              ),
              Expanded(
                flex: 1,
                child: TextFormField(
                  decoration: InputDecoration(
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
          SizedBox(height: 10),
          Row(
            children: <Widget>[
              Container(
                child: Text("确认密码"),
                width: 80,
              ),
              Expanded(
                flex: 1,
                child: TextFormField(
                  decoration: InputDecoration(
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
          SizedBox(height: 10),
          Row(
            children: <Widget>[
              Container(
                child: Text("昵称"),
                width: 80,
              ),
              Expanded(
                flex: 1,
                child: TextFormField(
                  decoration: InputDecoration(
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
          SizedBox(height: 10),
          Row(
            children: <Widget>[
              Container(
                child: Text("电话"),
                width: 80,
              ),
              Expanded(
                flex: 1,
                child: TextFormField(
                  decoration: InputDecoration(
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
          SizedBox(height: 10),
          Row(
            children: <Widget>[
              Container(
                child: Text("邮箱"),
                width: 80,
              ),
              Expanded(
                flex: 1,
                child: TextFormField(
                  decoration: InputDecoration(
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
          SizedBox(height: 10),
          Row(
            children: <Widget>[
              Container(
                child: Text("出生年月日"),
                width: 80,
              ),
              Expanded(
                flex: 1,
                child: TextFormField(
                  decoration: InputDecoration(
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
          SizedBox(height: 10),
          Row(
            children: <Widget>[
              Container(
                child: Text("性别"),
                width: 80,
              ),
              Expanded(
                flex: 1,
                child: Row(
                  children: <Widget>[
                    Text("男"),
                    Radio<int>(
                        value: 0,
                        groupValue: groupValue,
                        // title: Text("男"),
                        onChanged: handleRadioValueChanged),
                    SizedBox(width: 20),
                    Text("女"),
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
