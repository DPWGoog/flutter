import 'package:flutter/material.dart';

import 'package:fluro/fluro.dart';
import '../service/service_method.dart';
import 'package:flutter_shop/routers/application.dart';
import 'package:flutter_shop/config/constants.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_shop/widgets/common/MyHeader.dart';
import 'package:flutter_shop/widgets/common/SwiperDiy.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String homePageContent='正在获取数据';
  EasyRefreshController _controller;
  final TextEditingController _emailFilter = TextEditingController();
   String _email = "";
  _HomePageState() {
    _emailFilter.addListener(_emailListen);
  }
  void _emailListen() {
    if (_emailFilter.text.isEmpty) {
      _email = "";
    } else {
      _email = _emailFilter.text;
    }
  }
  void initState() {
    super.initState();
    _controller = EasyRefreshController();

    // 发送请求
    Future.delayed(Duration.zero, () {
       print('发起请求');
    });

  }

  @override
  Widget build(BuildContext context) {
    String message = "";
    String hexCode = "#FFFFFF";
    return Scaffold(
      body:FutureBuilder(
        future:getHomePageContent(),
        builder: (context,snapshot){
           if(snapshot.hasData){
             var data = snapshot.data['data']['data'];
             List<Map> swiperDataList = (data['lunbo'] as List).cast(); // 顶部轮播组件数
             return EasyRefresh(
                        enableControlFinishRefresh: false,
                        header: MyHeader(
                          refreshedText: "更新成功",
                          refreshFailedText: "刷新失败，请稍后重试",
                          refreshReadyText: "松手刷新",
                          refreshingText: "正在更新内容",
                          refreshText: "下拉刷新",
                          textColor: Color(AppColors.fontColorGray),
                          showInfo: true
                        ),
                        child: ListView(
                          children: <Widget>[
                            SwiperDiy(swiperDataList:swiperDataList ), //页面顶部轮播组件
                            Container(
                              margin: EdgeInsets.only(
                                left: Constants.pageMargin,
                                right: Constants.pageMargin,
                                top: 20.0,
                                bottom: 40
                              ),
                              child: Container(
                                child: Text('哈哈哈哈哈哈😄'),
                              ),
                            )
                          ],
                        ),
                        onRefresh: ()async{
                           await Future.delayed(Duration(seconds: 2), () {
                              // _controller.resetLoadState();
                              _controller.finishRefresh(success: true);
                            });
                        },
                      );

          }else{
            return Center(
              child: Text('加载中'),
            );
          }
        },
      )
    );
  }
}


