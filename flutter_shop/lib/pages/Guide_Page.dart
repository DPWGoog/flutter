import 'package:flutter/material.dart';
import './index_page.dart';
import './Login_Page.dart';

class GuidPage extends StatefulWidget {
  _GuidPage createState() => _GuidPage();
}

class _GuidPage extends State<GuidPage> with SingleTickerProviderStateMixin {

  AnimationController _controller;
  Animation _animation;
  bool loginType = true;
  void initState() { 
    super.initState();
    _controller = AnimationController(vsync:this,duration:Duration(milliseconds:7000));
    _animation = Tween(begin: 0.0,end:1.0).animate(_controller);

    /*动画事件监听器，
    它可以监听到动画的执行状态，
    我们这里只监听动画是否结束，
    如果结束则执行页面跳转动作。 */
    _animation.addStatusListener((status){
      if(status == AnimationStatus.completed){
        if(!loginType){
            Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context)=>LoginPage()), 
            (route)=> route==null);
        }else{
            Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context)=>IndexPage()), 
            (route)=> route==null);
        }
        
      }
    });
    //播放动画
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return FadeTransition( //透明度动画组件
      opacity: _animation,  //执行动画
      child: Image.network(  //网络图片
        'http://can.duanpengwei.top/FgJMKuz4kmi9fQXkR6_CYlzEqBze',
        scale: 2.0,  //进行缩放
        fit:BoxFit.cover  // 充满父容器
      ),
    );
  }
}