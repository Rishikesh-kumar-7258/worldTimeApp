import 'package:http/http.dart';
import 'dart:convert';
import "package:intl/intl.dart";

class WorldTime {
  String location;
  String? time;
  String flag;
  String url;

  WorldTime({required this.flag, required this.location, required this.url});

  Future<void> getTime() async {
    try {
      Response response =
          await get(Uri.https('worldtimeapi.org', 'api/timezone/$url'));
      Map data = jsonDecode(response.body);

      DateTime now = DateTime.parse(data["datetime"]);
      String offset = data["utc_offset"];
      String hours = offset.substring(1, 3);
      String mins = offset.substring(4);
      now =
          now.add(Duration(hours: int.parse(hours), minutes: int.parse(mins)));

      time = DateFormat.jm().format(now);
    } catch (e) {
      time = 'could not get tiem data';
    }
  }
}
