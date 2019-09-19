import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/config/constants.dart';
import 'package:flutter_shop/pages/index_page.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailFilter = TextEditingController();
  final TextEditingController _passwordFilter = TextEditingController();
  String _email = "";
  String _password = "";
  _LoginPageState() {
    _emailFilter.addListener(_emailListen);
    _passwordFilter.addListener(_passwordListen);
  }
  void _emailListen() {
    if (_emailFilter.text.isEmpty) {
      _email = "";
    } else {
      _email = _emailFilter.text;
    }
  }
  void _passwordListen() {
    if (_passwordFilter.text.isEmpty) {
      _password = "";
    } else {
      _password = _passwordFilter.text;
    }
  }
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Scaffold(
      body: Container(
        height: ScreenUtil().setHeight(1334),
        width: ScreenUtil().setWidth(750),
        margin: EdgeInsets.symmetric(horizontal: Constants.pageMargin),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '登录',
              style: TextStyle(
                color: Color(AppColors.fontColor),
                fontSize: 24.0,
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20.0, top: 80.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4.0),
                child: TextField(
                  cursorColor: Colors.white,
                  controller: _emailFilter,
                  decoration: InputDecoration(
                      hintText: "（邮箱）直接点击登录进入主页面",
                      border: InputBorder.none,
                      fillColor: Color(AppColors.themeColorGray),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 16.0)),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20.0),
              child: ClipRRect(
              borderRadius: BorderRadius.circular(4.0),
                child: TextField(
                  onChanged: (value) {
                    print(value);
                  },
                  controller: _passwordFilter,
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: '（密码）暂时没有接入API',
                      border: InputBorder.none,
                      fillColor: Color(AppColors.themeColorGray),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 16.0)),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 90.0),
              height: 48.0,
              decoration: BoxDecoration(
                  color: Color(AppColors.mainColor),
                  borderRadius: BorderRadius.circular(4.0)),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    // 禁止跳回到之前登录的路由
                    Navigator.of(context).pushAndRemoveUntil(
                        new MaterialPageRoute(builder: (context) => IndexPage()),
                        (route) => route == null);
                  },
                  child: Center(
                    child: Text("登录",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Poppins-Bold",
                            fontSize: 18,
                            letterSpacing: 1.0)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}