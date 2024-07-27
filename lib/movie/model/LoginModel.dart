import '../../utils/crypto.dart';

class LoginModel{
  String userId;
  String password;
  LoginModel({
    required this.userId,
    required this.password,
  });
  //工厂模式-用这种模式可以省略New关键字
  Map<String,String> toMap(){
    return {
      "userId": userId,
      "password": generateMd5(password),
    };
  }
}