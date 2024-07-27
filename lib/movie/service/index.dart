import 'dart:async';
import 'package:dio/dio.dart';
import '../model/LoginModel.dart';
import '../api/index.dart';
import '../../utils/HttpUtil .dart';
import '../../utils/LocalStorageUtils.dart';

Future<ResponseModel<dynamic>> getUserDataService() async {
  try {
    String token = await LocalStorageUtils.getToken(); //从缓存中获取
    HttpUtil.getInstance().setToken(token);
    Response response = await HttpUtil.getInstance().dio.get(servicePath["getUserData"]!);
    HttpUtil.getInstance().setToken(response.data['token']);
    return ResponseModel.fromJson(response.data);
  } catch (e) {
    return ResponseModel.fromJson(null);
  }
}

//登录
Future<ResponseModel<dynamic>> loginService(LoginModel loginModel) async {
  try {
    Response response = await HttpUtil.getInstance().dio.post(servicePath['login']!, data: loginModel.toMap());
    return ResponseModel.fromJson(response.data);
  } catch (e) {
    return ResponseModel.fromJson(null);
  }
}