import 'package:flutter/material.dart';
import 'package:world_time/pages/random_map.dart';
import 'package:world_time/pages/supported_countries_map.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  @override
  void initState() {
    controller = TabController(length: 2, initialIndex: 0, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Choose Location"),
          centerTitle: true,
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: controller,
              children: [
                RandomWorldMapGenrator(),
                const SupportedCountriesMap()
              ]),
        ));
  }
}
