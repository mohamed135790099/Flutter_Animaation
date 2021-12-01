import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Page Transition',
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page Transition'),
      ),
      body: Center(
        child: RaisedButton.icon(
          onPressed: (){
            Navigator.push(context, PageTransition( child: Anther(),duration:Duration(seconds:2) ,type: PageTransitionType.rightToLeftWithFade,));
          },
          icon: Icon(Icons.forward),
          label: Text('Page Transition'),
        ),
      ),
    );
  }
}

class Anther extends StatelessWidget {
  const Anther({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title:Text('Anther Page'),),

    );
  }
}

