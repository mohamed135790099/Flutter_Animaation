import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      title: 'Like Button',
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
      appBar:AppBar(title:Text('Custom Drawer'),),
      body:Center(
        child: LikeButton(
          likeBuilder:(bool isLiked){

            return Icon(Icons.sentiment_very_satisfied_outlined,color:isLiked?Colors.pinkAccent:Colors.grey,size:50.0,);
          } ,
          size:60,
          likeCount:5432,
          onTap: OnLikeButtonTapped,
          bubblesColor:BubblesColor(
              dotPrimaryColor:Colors.deepPurple,
              dotSecondaryColor:Colors.lightGreenAccent,
          ),
          circleColor:CircleColor(start: Colors.orangeAccent, end:Colors.pinkAccent),
          animationDuration: Duration(seconds:30),


        ),
      ),
    );
  }

  Future<bool?> OnLikeButtonTapped(bool isLiked) async=> !isLiked;
}
