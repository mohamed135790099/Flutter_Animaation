import 'package:flutter/material.dart';
import 'package:residemenu/residemenu.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      title: 'Raise Menu',
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        leading:InkWell(
          child:Container(child:Icon(Icons.menu),),
          onTap:()=>0,
        ),
        title:Text('Custom Drawer'),

      ),
      body:Center(
        child:Text('Custom Drawer'),
      ),

    );
  }
}
