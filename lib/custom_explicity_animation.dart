import 'package:flutter/material.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title:'Custom Explicit Animation',
      home:MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<Size>_animation;
  double _height=150;

  @override
  void initState() {
    _controller=AnimationController(vsync: this,duration:Duration(milliseconds:50));
    _animation=Tween<Size>(begin:Size(200,150),end:Size(200,350)).animate(CurvedAnimation(
      curve:Curves.linear,
      parent:_controller,
    ));

    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.black54,
      appBar:AppBar(title:Text('Custom Explicit Animation'),),
      body:Container(
        child:Column(
          mainAxisAlignment:MainAxisAlignment.spaceEvenly,
          children: [
            AnimatedBuilder(
              animation:_controller,
              builder:(context,child)=> FlutterLogo(size:_animation.value.height,),
            ),
            ListTile(
              title:Text('Forward'),
              trailing:Icon(Icons.arrow_forward),
              tileColor:Colors.green,
              onTap:(){
                setState(() {
                  _controller.forward();
                });
              },
            ),
            ListTile(
              title:Text('Back'),
              trailing:Icon(Icons.arrow_back),
              tileColor:Colors.deepOrange,
              onTap:(){
                setState(() {
                  _controller.reverse();
                });
              },
            ),
          ],
        ),
      ),

    );
  }
}
