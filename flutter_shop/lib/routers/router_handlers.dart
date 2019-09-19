import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import 'package:flutter_shop/pages/index_page.dart';
import 'package:flutter_shop/pages/Get_Page.dart';
import 'package:flutter_shop/pages/Login_Page.dart';
import 'package:flutter_shop/pages/Guide_Page.dart';



Handler rootHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return IndexPage();
});


// 我的设置路由
Handler settingRouteHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  // String message = params["message"]?.first;
  // String colorHex = params["color_hex"]?.first;
  return GetPage();
});
// 登录
Handler loginRouterHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return LoginPage();
});

