import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = 'loading...';

  Future<void> setupWorldTime() async {
    WorldTime instance =
        WorldTime(flag: 'india.png', location: "kolkata", url: "asia/kolkata");
    await instance.getTime();
    setState(() {
      time = instance.time.toString();
    });
  }

  @override
  void initState() {
    super.initState();

    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Text("Current time : $time"),
    ));
  }
}
