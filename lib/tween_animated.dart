import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tween Animated',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _value = 0;
  double _angle = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tween Animated'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TweenAnimationBuilder<double>(
              tween: Tween(begin: 0, end: _angle),
              duration: Duration(seconds: 5),
              builder: (_,double angle,child)=>Transform.rotate(
                angle: angle,
                child: Container(
                  height: 200,
                  width: 300,
                  color: Colors.deepOrangeAccent,
                ),
              ),
            ),
            Text(
              '${(_value * (180 / pi)).round()}',
              style: TextStyle(fontSize: 30),
            ),
            Slider(
              value: _angle,
              onChanged: (val) {
                setState(() {
                  _value = val;
                  _angle = val;
                });
              },
              min: 0,
              max: pi * 2,
              divisions: 4,
            )
          ],
        ),
      ),
    );
  }
}
