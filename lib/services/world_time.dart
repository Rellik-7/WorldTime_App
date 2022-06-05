import 'dart:convert';

import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime{
  String location;
  String url;
  String flag;

  bool isDayTime = false;
  String time="";

  WorldTime({required this.location,required this.url,required this.flag});

  Future<void> getTime() async
  {
    try{
      Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);

      String datetime = data['datetime'];

      DateTime now = DateTime.parse(datetime.substring(0,26));

      isDayTime = now.hour > 5 && now.hour < 7 ? true : false;
      time = DateFormat.jm().format(now);
    }
    catch(e)
    {
      print('Error!');
      time = "could not fetch data";
    }

  }


}