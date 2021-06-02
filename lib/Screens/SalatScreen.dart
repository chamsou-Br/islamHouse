import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:islam_dini/Services/location.dart';
import 'package:http/http.dart' as http;
import 'package:islam_dini/Widget/salatName.dart';

class SalatScreen extends StatefulWidget {
  @override
  _SalatScreenState createState() => _SalatScreenState();
}

class _SalatScreenState extends State<SalatScreen> {
  List timeSalat;
  String dateNew;
  bool isData = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  String calculeWaktIkama(String salatTime, int ikamaTime) {
    List time = salatTime.split(':');
    int min = int.parse(time[1]) + ikamaTime;
    int heur;
    if (min < 60) {
      if (min % 60 < 10) {
        return "${time[0]}:0${min.toString()}";
      } else
        return "${time[0]}:${min.toString()}";
    } else {
      min = min % 60;
      heur = int.parse(time[0]) + 1;
      if (min % 60 < 10 && heur < 10) {
        return "0${(int.parse(time[0]) + 1).toString()}:0${(min % 60).toString()}";
      } else {
        if (min % 60 < 10) {
          return "${(int.parse(time[0]) + 1).toString()}:0${(min % 60).toString()}";
        }
        if (heur < 10) {
          return "0${(int.parse(time[0]) + 1).toString()}:0${(min % 60).toString()}";
        } else
          return "${(int.parse(time[0]) + 1).toString()}:${(min % 60).toString()}";
      }
    }
  }

  // getData
  void getData() async {
    LocationClass location = LocationClass();
    await location.getPosition();
    double longitude = location.longitude;
    double latitude = location.latitude;
    final res = await http.get(Uri.parse(
        "https://api.pray.zone/v2/times/today.json?longitude=$longitude&latitude=$latitude&elevation=0"));
    var data = jsonDecode(res.body);
    if (res.statusCode != 200) print('error');
    setState(() {
      timeSalat = data["results"]['datetime'];
      dateNew = data["results"]['datetime'][0]['date']["gregorian"];
      print(dateNew);
      isData = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          verticalDirection: VerticalDirection.down,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.lock_clock,
                            color: Color(0xFFB375FE),
                            size: 30,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            isData ? dateNew : '',
                            style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Algeria',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1,
                            color: Colors.black38),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Image(
                      image: AssetImage('images/clock.jpg'),
                      width: 90,
                      height: 90,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              width: MediaQuery.of(context).size.width * 1,
              height: 100,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      'أوقات الصلاة',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      '- Prayer time -',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: AssetImage('images/douaaname2.png'),
                    fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              child: Row(
                children: [
                  Container(
                    width: 100,
                    child: Text(
                      'prayer',
                      overflow: TextOverflow.fade,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                  ),
                  Container(
                    width: 70,
                    child: Text(
                      'الأذان',
                      overflow: TextOverflow.fade,
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                  ),
                  Container(
                    width: 70,
                    child: Text(
                      'الإقامة',
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.fade,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                  ),
                  Container(
                    width: 100,
                    child: Text(
                      "الصلاة",
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SalatName("الإمساك", "Imsak",
                isData ? timeSalat[0]["times"]["Imsak"] : '', ""),
            SalatName(
                "الفجر",
                "fajer",
                isData ? timeSalat[0]["times"]["Fajr"] : '',
                isData
                    ? calculeWaktIkama(timeSalat[0]["times"]["Fajr"], 20)
                    : ""),
            SalatName("شروق الشمس", "Sunrise",
                isData ? timeSalat[0]["times"]["Sunrise"] : '', ""),
            SalatName(
                "الظهر",
                "Dhuhr",
                isData ? timeSalat[0]["times"]["Dhuhr"] : '',
                isData
                    ? calculeWaktIkama(timeSalat[0]["times"]["Dhuhr"], 15)
                    : ''),
            SalatName(
                "العصر",
                "Asr",
                isData ? timeSalat[0]["times"]["Asr"] : '',
                isData
                    ? calculeWaktIkama(timeSalat[0]["times"]["Asr"], 15)
                    : ''),
            SalatName("غروب الشمس", "Sunset",
                isData ? timeSalat[0]["times"]["Sunset"] : '', ""),
            SalatName(
                "المغرب",
                "Maghrib",
                isData ? timeSalat[0]["times"]["Maghrib"] : '',
                isData
                    ? calculeWaktIkama(timeSalat[0]["times"]["Maghrib"], 5)
                    : ''),
            SalatName(
                "العشاء",
                "Isha",
                isData ? timeSalat[0]["times"]["Isha"] : '',
                isData
                    ? calculeWaktIkama(timeSalat[0]["times"]["Isha"], 10)
                    : ""),
          ],
        ),
      ),
    );
  }
}
