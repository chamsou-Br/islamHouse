import 'dart:async';

import 'package:flutter/material.dart';
import 'package:islam_dini/Screens/SurahAngScreen.dart';
import 'package:islam_dini/Screens/surahScreen.dart';
import 'package:islam_dini/Screens/tafssirScreen.dart';
import 'package:islam_dini/Widget/FlatListHizab.dart';
import 'package:islam_dini/Widget/FlatListSurah.dart';
import 'package:islam_dini/Widget/partQoran.dart';
import 'dart:convert';
// https://api.quran.sutanlab.id/surah/1
// https://github.com/semarketir/quranjson

class QoranListe extends StatefulWidget {
  @override
  _QoranListeState createState() => _QoranListeState();
}

class _QoranListeState extends State<QoranListe> {
  int _currentWidget = 0;
  List dataSurah;
  bool isDataSurah = false;
  List dataJuz;
  bool isDataJuz = false;

  // changeWidget function
  void changeWidget(int index) {
    setState(() {
      _currentWidget = index;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  // getData Function
  Future<void> getData() async {
    var res =
        await DefaultAssetBundle.of(context).loadString('sources/surah.json');
    var res2 =
        await DefaultAssetBundle.of(context).loadString('sources/juz.json');

    setState(() {
      dataSurah = jsonDecode(res)['data'];
      isDataSurah = true;
      dataJuz = jsonDecode(res2)['data'];
      isDataJuz = true;
    });
  }

  // Go to Surah Screen
  void pushSurahScreen(String name, int index) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return SurahScreen(
        surahName: name,
        surahIndex: index,
      );
    }));
  }

  // Go to SurahAng Screen
  void pushSurahAngScreen(String name, int index) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return SurahAngScreen(surahIndex: index);
    }));
  }

  void pushTafssirScreen() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return TafsirScreen();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(),
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
                          '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
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
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              PartQoran(_currentWidget == 0, "السورة", changeWidget, 0),
              PartQoran(_currentWidget == 1, "الحزب", changeWidget, 1),
              PartQoran(_currentWidget == 2, "Surah", changeWidget, 2),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: _currentWidget == 0
                ? FlatListSurah(isDataSurah, dataSurah, pushSurahScreen)
                : (_currentWidget == 1
                    ? FlatListHizab(
                        isDataJuz, dataJuz, ["Al-Hizab ", " الحزب ", "surah"])
                    : FlatListSurah(
                        isDataSurah, dataSurah, pushSurahAngScreen)),
          ),
        ],
      ),
    );
  }
}
