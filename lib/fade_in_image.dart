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
      title: 'Fade IN Image',
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
      appBar:AppBar(title:Text('Fade IN Image'),),
      body:Center(
        child:Container(
          width:300,
          height:300,
          child:FadeInImage(
              placeholder:AssetImage('assets/image/download.jpg'),
              image:NetworkImage('https://ik.imagekit.io/ikmedia/backlit.jpg'),
        ),
      ),
    ),
  );
  }
}
