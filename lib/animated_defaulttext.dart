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
      title: 'Animated Default Text',
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
   double _fontSize=30;
   Color _color=Colors.lightGreen;
   FontWeight _fontWidget=FontWeight.bold;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title:Text('Animated Default Text'),),
      body:Center(
        child:AnimatedDefaultTextStyle(
          duration:Duration(seconds:5),
          style: TextStyle(fontSize:_fontSize,color:_color,fontWeight:_fontWidget),
          child: Column(
            mainAxisAlignment:MainAxisAlignment.center,
            children: [
              Text('text 1'),
              Text('text 2'),
            ],
          ),
        ),
      ),
      floatingActionButton:FloatingActionButton(
        child:Icon(Icons.play_arrow),
        onPressed:(){
          Random random=Random();
          setState(() {
            _fontSize=random.nextInt(100).toDouble();
            _color=Color.fromRGBO(random.nextInt(256), random.nextInt(256), random.nextInt(256), 1);
            _fontWidget=FontWeight.w500;
          });
        },
      ),
    );
  }
}
