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
      title: 'Hero Animation',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hero Animation'),
        ),
        body: Center(
          child: Builder(
            builder: (context) => FlatButton(
              onPressed: (){
                Navigator.push(context,MaterialPageRoute(builder: (_)=>FlutterPage()));
              },
              child: Hero(
                  tag:'flutter_logo',
                  child: FlutterLogo(size:50,),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FlutterPage extends StatelessWidget {
  const FlutterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title:Text('Flutter logo'),backgroundColor:Colors.teal,),
      body:ListView(
        children: [
          Container(
            width:double.infinity,
            height:190,
            child:Center(
              child: Hero(
                tag: 'flutter_logo',
                child:FlutterLogo(size:150,),

              ),
            ),
          )
        ],
      ),
    );
  }
}
