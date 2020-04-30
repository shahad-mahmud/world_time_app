import 'dart:convert';

import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String time;
  String flagUrl;
  String url; //api url
  bool isDay;

  WorldTime({this.location, this.flagUrl, this.url});

  Future<void> getTime() async {
    try {
      //make the http request
      Response response =
          await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body); // convert to map object

      String dateTime = data['datetime'];
      String offset = data['utc_offset'];
      String hours = offset.substring(1, 3);
      String minutes = offset.substring(4, 6);
      print(hours + minutes);

      //create date time object
      DateTime time = DateTime.parse(dateTime);
      time = time
          .add(Duration(hours: int.parse(hours), minutes: int.parse(minutes)));

      //set the time property
      this.time = DateFormat.jm().format(time);
      isDay = time.hour > 6 && time.hour < 20 ? true : false;
    } catch (e) {
      print('LOADING error: $e');
      time = 'Can not get time';
    }
  }
}
