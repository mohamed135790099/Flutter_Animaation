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
      title: 'Animated Position',
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
  bool visible=true;
  double _bottom=250;
  double _height=100;
  Color _color=Colors.pink;
  BorderRadius _borderRadius=BorderRadius.circular(9);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title:Text('Animated Position'),),
      body: Stack(
        children: [
          Container(
            width:double.infinity,
            height:double.infinity,
            color:Colors.deepPurpleAccent,
          ),
          Center(
            child:Text('Text 1',style:TextStyle(fontSize:30,fontWeight:FontWeight.bold),),
          ),
          AnimatedPositioned(
            duration:Duration(seconds:4),
              bottom:_bottom,
              right:100,
              child: Container(
                width:200,
                height:100,
                decoration:BoxDecoration(
                  color:_color,
                  borderRadius:BorderRadius.circular(10),
                ),
              ),
            ),

        ],
      ),
      floatingActionButton:FloatingActionButton(
        child:Icon(Icons.play_arrow),
        onPressed:(){
          setState(() {
            Random random =Random();
             visible=!visible;
            _bottom=visible==true?400:250;
            double opacity=visible==true?1:0.5;
            _color=Color.fromRGBO(random.nextInt(256), random.nextInt(256), random.nextInt(256), opacity);
          });

        },
      ),
    );
  }
}
