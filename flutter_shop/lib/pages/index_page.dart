import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_shop/config/Adapt.dart';
import 'package:flutter_shop/config/constants.dart' show AppColors, Constants;

// 四个界面
import './Home_page.dart';
import './Category_page.dart';
import './Cart_page.dart';
import './Member_page.dart';
// 四个导航栏
import 'package:flutter_shop/widgets/NavBar/HomeNavBar.dart' ;
import 'package:flutter_shop/widgets/NavBar/CategoryNavBar.dart';
import 'package:flutter_shop/widgets/NavBar/CartNavBar.dart';
import 'package:flutter_shop/widgets/NavBar/MemberNavBar.dart';


class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  int _activeIndex = 0;
  List<Widget> _pages;
  List<Widget> _navBars;


  final List _svgAssetUrl = [
    Icon(CupertinoIcons.home),
    Icon(CupertinoIcons.search),
    Icon(CupertinoIcons.shopping_cart),
    Icon(CupertinoIcons.profile_circled)
  ];
  initState() {
    super.initState();
     // 首页四个 界面
    _pages = <Widget>[HomePage() , CategoryPage() , CartPage() , MemberPage()];
    // 自定义的四个导航栏
     _navBars = <Widget>[HomeNavBar() , CategoryNavBar() , CartNavBar(), MemberNavBar()];
  }
  // 底部导航标签
  SvgPicture bottomIcon(int index) {
    return SvgPicture.asset(_svgAssetUrl[index],
        width: Adapt.width(Constants.bottomIconWidth),
        height: Adapt.height(Constants.bottomIconHeight),
        color: Color(
            _activeIndex == index ? AppColors.mainColor : AppColors.lightGray));
  }

  // 双击返回键退出应用
  // Future<bool> _doubleExit() {
  //   int nowTime = new DateTime.now().microsecondsSinceEpoch;
  //   if (_lastClickTime != 0 && nowTime - _lastClickTime > 1500) {
  //     return new Future.value(true);
  //   } else {
  //     _lastClickTime = new DateTime.now().microsecondsSinceEpoch;
  //     new Future.delayed(const Duration(milliseconds: 1500), () {
  //       _lastClickTime = 0;
  //     });
  //     return new Future.value(false);
  //   }
  // }

  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(
      icon:Icon(CupertinoIcons.home),
      title:Text('首页')
    ),
    BottomNavigationBarItem(
      icon:Icon(CupertinoIcons.search),
      title:Text('分类')
    ),
    BottomNavigationBarItem(
      icon:Icon(CupertinoIcons.shopping_cart),
      title:Text('购物车')
    ),
     BottomNavigationBarItem(
      icon:Icon(CupertinoIcons.profile_circled),
      title:Text('会员中心')
    ),
  ];
  @override
  Widget build(BuildContext context) {
     return WillPopScope(
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(50.0),
              child: _navBars[_activeIndex],
            ),
            body: IndexedStack(
              index: _activeIndex,
              children: _pages,
            ),
            bottomNavigationBar: CupertinoTabBar(
              backgroundColor: Color(AppColors.themeColor),
              items: bottomTabs,
              currentIndex: _activeIndex,
              onTap: (int index) {
                setState(() {
                  _activeIndex = index;
                });
              },
            ),
          ),
        );
  }
}
