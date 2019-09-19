/**
 *购物车自定义导航栏
 */
import 'package:flutter/material.dart';


class CartNavBar extends StatelessWidget {
  const CartNavBar({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('购物车'),
      centerTitle: true,
      elevation: 0,
    );
  }
}