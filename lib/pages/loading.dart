import 'package:flutter/material.dart';
// import 'package:http/http.dart';
import 'package:world_time/src/get_current_location.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  Future<void> getPosition() async {
    CurrentLocation location = CurrentLocation();
    await location.getAddressFromLatLong();

    Navigator.pushReplacementNamed(context, '/home',
        arguments: {'address': location.address});
  }

  @override
  void initState() {
    super.initState();
    getPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[900],
        body: const Center(
          child: SpinKitRotatingCircle(
            color: Colors.white,
            size: 50.0,
          ),
        ));
  }
}
