import 'dart:math';

import 'package:flutter/material.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      title: 'Animated Padding \$\$ Align',
      home:MyHomePage(),

    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double dx=0;
  double dy=0;
  double paddingValue=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title:Text('Animated Padding \$\$ Align'),),
      body:Center(
        child:Container(
          height:300,
          width:300,
          color:Colors.yellow[200],
          child:AnimatedAlign(
            duration:Duration(milliseconds:100),
            alignment:FractionalOffset(dx,dy),
           // alignment: Alignment(0,0.5),
            child:FlutterLogo(size:60,),
          ),
        ),
      ),
      floatingActionButton:FloatingActionButton(
        child:Icon(Icons.play_arrow),
        onPressed: () {
          setState(() {
            Random  random=Random();
            dx=(dx==0?random.nextDouble():0);
            dy=(dy==0?random.nextDouble():0);

            paddingValue=(paddingValue==0?150:0);
          });
        },
      ),
    );
  }

  Center Animated_padding() {
    return Center(
      child: AnimatedPadding(
        duration:Duration(seconds:3),
        padding: EdgeInsets.symmetric(horizontal: paddingValue),
        child: Container(
          height: 300,
          color:Colors.deepOrange,
        ),
      ),
    );
  }
}
