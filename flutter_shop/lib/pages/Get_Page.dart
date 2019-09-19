/**
 * 网络请求 动态渲染
 */
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_shop/routers/application.dart';
import 'package:fluro/fluro.dart';

class GetPage extends StatefulWidget {
  @override
  _GetPageState createState() => _GetPageState();
}

class _GetPageState extends State<GetPage> {
  
  TextEditingController typeController = TextEditingController();
  String showText = '欢迎你来到美好人间';
  @override
  Widget build(BuildContext context) {
    return Container(
       child:Scaffold(
         appBar: AppBar(title: Text('get 动态渲染')),
         body: Container(
           height: 1000,
           child: Column(
             children: <Widget>[
               TextField(
                 controller:typeController,
                 decoration:InputDecoration (
                    contentPadding: EdgeInsets.all(10.0),
                    labelText: '美女类型',
                    helperText: '请输入你喜欢的类型'
                  ),
                  autofocus: false,
               ),
               RaisedButton(
                 onPressed: _choiceAction,
                 child: Text('选择完毕'),
               ),
               Text(
                 showText,
                 overflow:TextOverflow.ellipsis,
                 maxLines: 2,
               )
             ],
           ),
         ),
       )
    );
  }

  void _choiceAction(){

    Application.router.navigateTo(
                            context,
                            "/login",
                            transition: TransitionType.native,
                            // transitionDuration: const Duration(milliseconds: 300),
                          );
    // print('开始选择你喜欢的类型............');
    // if(typeController.text.toString()==''){
    //   showDialog(
    //     context: context,
    //     builder: (context)=>AlertDialog(title:Text('美女类型不能为空'))
    //   );
    // }else{
    //     getHttp(typeController.text.toString()).then((val){
    //      setState(() {
    //        showText= val['data']['data']['center'].toString() + val['data']['data']['name'].toString();
    //      });
    //     });
    // }

  }
  
  Future getHttp(String TypeText)async{
    try{
      Response response;
      
      response = await Dio().post(
        'http://localhost:3020/api/home/list',
        data: {"name":TypeText}
      );
      return response.data;
    }catch(e){
      return print(e);
    }
  }

  
}