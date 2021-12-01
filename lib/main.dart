import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      title: 'Animation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Animation Container '),
    );
  }
}
class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _width=50;
  double _height=50;
  Color _color=Colors.deepPurple;
  BorderRadiusGeometry _boardRadius=BorderRadius.circular(9);
  bool visible=true;
  Random random=Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              curve:Curves.linear,
              duration:Duration(seconds:5),
              height:_height,
              width:_width,
              decoration:BoxDecoration(
                color:_color,
                borderRadius:_boardRadius ,
              ),
            ),
            AnimatedOpacity(
              duration: Duration(seconds:2),
              opacity: visible==true?1:0,
              child:Column(
                children: [
                  Text('Name:Mohamed'),
                  Text('Age:21'),
                  Text('job:programmer'),
                  Text('salary:9875\$'),

                ],
              )
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child:Icon(Icons.flip),
        onPressed:(){
          setState(() {
            visible=!visible;
            double opacity=visible==true?0:1;
            _width=(_width==50?random.nextInt(300).toDouble():50);
            _height=(_height==50?random.nextInt(300).toDouble():50);
            _boardRadius=(_boardRadius==BorderRadius.circular(9)?BorderRadius.circular(random.nextInt(50).toDouble()):BorderRadius.circular(9));
            _color=(_color==Colors.deepPurple?Color.fromRGBO(random.nextInt(256), random.nextInt(256), random.nextInt(256), opacity):Colors.deepPurple);
          });
        },

      ),
    );
  }
}
