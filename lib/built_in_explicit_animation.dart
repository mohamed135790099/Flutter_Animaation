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
      title: 'built in explicit animation',
      home:MyHomePage(),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>with SingleTickerProviderStateMixin{
  final DecorationTween _decorationTween=DecorationTween(
    begin: BoxDecoration(
      borderRadius:BorderRadius.all(Radius.circular(5)),
      color:Colors.white,
      border:Border.all(color:Colors.black),
      boxShadow: [
        // to make elevation
        BoxShadow(
          color: Colors.deepOrange,
          offset: Offset(2, 2),
          blurRadius: 90,
        ),
        // to make the coloured border
      ],
    ),
    end:BoxDecoration(
      borderRadius:BorderRadius.all(Radius.circular(5)),
      color:Colors.black,
      border:Border.all(color:Colors.white),
      boxShadow: [
        // to make elevation
        BoxShadow(
          color: Colors.lightGreenAccent,
          offset: Offset(2, 2),
          blurRadius: 120,
        ),
        // to make the coloured border

      ],
    ),

  );
  late AnimationController _controller;
  //use Animation<double> many case for example SizeTransition-ScaleTransition-RotationTransition
  late Animation<double> _animation;
  late Animation<AlignmentGeometry>_animation1;
  late Animation<Offset>_animation2;
  late Animation<Decoration>_animation3;
  late Animation<TextStyle>_animation4;



  @override
  void initState() {
    _controller=AnimationController(vsync: this,duration:Duration(seconds:5),)..repeat(period:Duration(seconds:2));
    _animation1=Tween<AlignmentGeometry>(begin:Alignment.bottomRight,end:Alignment.topLeft ).animate(CurvedAnimation(parent: _controller, curve: Curves.linear));
    _animation2=Tween<Offset>(begin:Offset(0,0),end:Offset(1,1) ).animate(CurvedAnimation(parent: _controller, curve: Curves.linear));
    _animation3=DecorationTween(begin:BoxDecoration(color:Colors.amber),end:BoxDecoration(color:Colors.deepPurpleAccent)).animate(CurvedAnimation(curve:Curves.linear,parent:_controller));
    _animation4=TextStyleTween(begin:TextStyle(fontSize:45,color:Colors.yellow,fontWeight:FontWeight.w900),end:TextStyle(fontSize:75,color:Colors.deepPurple,fontWeight:FontWeight.bold)).animate(CurvedAnimation(curve:Curves.linear,parent:_controller));

    _animation=CurvedAnimation
      (
        parent:_controller,
        curve: Curves.linear,

    );
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.black54,
      appBar:AppBar(title:Text('built in explicit animation'),),
      body:Center(
        child: DefaultTextStyleTransition(
          //axis:Axis.horizontal,
          style: _animation4,
          child: Padding(
            padding: EdgeInsets.all(8),
            child:Text('Text'),
          ),
        ),
      ),

    );
  }

  DecoratedBoxTransition buildDecoratedBoxTransition() {
    return DecoratedBoxTransition(
        //axis:Axis.horizontal,
        decoration: _decorationTween.animate(_controller),
        child: Padding(
          padding: EdgeInsets.all(8),
          child:FlutterLogo(size:300,),
        ),
      );
  }

  SlideTransition buildSlideTransition() {
    return SlideTransition(
        //axis:Axis.horizontal,
        position: _animation2,
        child: Padding(
          padding: EdgeInsets.all(8),
          child:FlutterLogo(size:60,),
        ),
      );
  }

  AlignTransition buildAlignTransition() {
    return AlignTransition(
        //axis:Axis.horizontal,
        alignment: _animation1,
        child: Padding(
          padding: EdgeInsets.all(8),
          child:FlutterLogo(size:360,),
        ),
      );
  }

  FadeTransition buildFadeTransition() {
    return FadeTransition(
        //axis:Axis.horizontal,
        opacity: _animation,
        child: Padding(
          padding: EdgeInsets.all(8),
          child:FlutterLogo(size:360,),
        ),
      );
  }

  SizeTransition sizeTransition() {
    return SizeTransition(
        sizeFactor: _animation,
        //axis:Axis.horizontal,
        child: Padding(
          padding: EdgeInsets.all(8),
          child:FlutterLogo(size:360,),
        ),
      );
  }
  ScaleTransition scaleTransition() {
    return ScaleTransition(
        scale: _animation,
        child: Padding(
          padding: EdgeInsets.all(8),
          child:FlutterLogo(size:360,),
        ),
    );
  }



 RotationTransition rotationTransition() {
    return RotationTransition(
        turns: _animation,
        child: Padding(
          padding: EdgeInsets.all(8),
          child:FlutterLogo(size:60,),
        ),
    );
  }

}
