import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/routers/router_handlers.dart';


class Routes {

  // 首页
  static String root = "/";
  // 设置
  static String setting = "/setting";
  // 登录
  static String login = "/login";
  // 引导
  static String guide = "/guide";


  static void configureRoutes(Router router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("ROUTE WAS NOT FOUND !!!");
    });
    router.define(root, handler: rootHandler);
    router.define(setting, handler: settingRouteHandler);
    router.define(login, handler: loginRouterHandler);
    // router.define(demoSimpleFixedTrans,
    //     handler: demoRouteHandler, transitionType: TransitionType.inFromLeft);
  }

}