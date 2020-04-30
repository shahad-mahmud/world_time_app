import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:worldtime/services/worldTime.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setUpWorldTime() async {
    WorldTime worldTime = WorldTime(
        location: 'Dhaka', flagUrl: 'bangladesh.png', url: 'Asia/Dhaka');
    await worldTime.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'worldTime': worldTime
    });
  }

  @override
  void initState() {
    super.initState();
    setUpWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        body: Center(
          child: SpinKitRipple(
            color: Colors.white,
            size: 90.0,
          ),
        ));
  }
}
