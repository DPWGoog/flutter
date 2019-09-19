import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_shop/config/constants.dart';

class CategoryNavBar extends StatelessWidget {
  const CategoryNavBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
       title: Text('分类'),
       actions:<Widget>[
         IconButton(
                alignment: Alignment.centerRight,
                onPressed: () {
                  
                },
                icon: new SvgPicture.asset(
                  'assets/icon/icon_more.svg',
                  width: Constants.appBarIconSize + 2.0,
                  height: Constants.appBarIconSize + 2.0,
                  color: Color(AppColors.fontColor),
                ),
          ),
          IconButton(
            alignment: Alignment.centerLeft,
            onPressed: () { },
            icon: new SvgPicture.asset(
              'assets/icon/icon_cube.svg',
              width: Constants.appBarIconSize + 2.0,
              height: Constants.appBarIconSize + 2.0,
              color: Color(AppColors.fontColorGray),
            ),
          ),
       ],
       centerTitle: true,
       elevation: 0,
    );
  }
}