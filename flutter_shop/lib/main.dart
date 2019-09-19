import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_shop/config/constants.dart' show AppColors;
import 'package:flutter_shop/routers/application.dart';
import 'package:flutter_shop/routers/routers.dart';
import 'package:flutter_shop/pages/Login_Page.dart';

void main() {
   SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor:
        Color(AppColors.themeColor), // navigation bar color
    statusBarColor: Color(AppColors.themeColor), // status bar color
  ));
  runApp(App());
}
// void main(){
//   final router = new Router();
//   Routes.configureRoutes(router);
//   runApp(
//       MaterialApp(
//           onGenerateRoute: Routes.router.generator
//       )
//   );
// }


class App extends StatefulWidget {
  App({Key key}) : super(key: key);

  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  _AppState() {
    final router = Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Book',
      theme: ThemeData(
          primaryColor: Color(AppColors.themeColor),
          accentColor: Color(AppColors.themeColor),
          scaffoldBackgroundColor: Color(AppColors.themeColor)),
      home: LoginPage(),
      onGenerateRoute: Application.router.generator,
    );
  }
}


// class MyAPP extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//        child: MaterialApp(
//          title: '购物网',
//          debugShowCheckedModeBanner: false,
//          theme: ThemeData(
//            primaryColor: Colors.pink,
//          ),
//          home: GuidPage(),
//        ),
//     );
//   }
// }
