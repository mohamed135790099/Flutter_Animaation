import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      title:'spinkit',
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
      backgroundColor:Colors.pink,
      appBar:AppBar(title:Text('spinkit'),),
      body:Center(
        child:SpinKitPianoWave(
          duration:Duration(seconds:1),
          color:Colors.amber,
          size:50,
          type:SpinKitPianoWaveType.center ,

        ),
      ),
    );
  }

  SpinKitFadingCube buildSpinKitFadingCube() {
    return SpinKitFadingCube(
        duration:Duration(seconds:1),
        color:Colors.amber,
        size:150,

      );
  }

  SpinKitFadingFour buildSpinKitFadingFour() {
    return SpinKitFadingFour(
        duration:Duration(seconds:1),
        color:Colors.amber,
        size:150,

      );
  }

  SpinKitDoubleBounce buildSpinKitDoubleBounce() {
    return SpinKitDoubleBounce(
        duration:Duration(seconds:1),
        color:Colors.amber,
        size:150,

      );
  }

  SpinKitCircle buildSpinKitCircle() {
    return SpinKitCircle(
        duration:Duration(seconds:1),
        color:Colors.amber,
        size:350,

      );
  }

  SpinKitCubeGrid buildSpinKitCubeGrid() {
    return SpinKitCubeGrid(
        duration:Duration(seconds:1),
        color:Colors.amber,
        size:150,

      );
  }

  SpinKitChasingDots buildSpinKitChasingDots() {
    return SpinKitChasingDots(
        duration:Duration(seconds:1),
        color:Colors.amber,
        size:150,

      );
  }
}
