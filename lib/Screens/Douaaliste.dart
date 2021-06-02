import 'dart:async';
import 'package:flutter/material.dart';
import 'package:islam_dini/Screens/DouaaScreen.dart';
import 'dart:convert';

import 'package:islam_dini/Widget/FlatListDouaa.dart';
// https://api.quran.sutanlab.id/surah/1
// https://github.com/semarketir/quranjson

class DouaaListe extends StatefulWidget {
  @override
  _DouaaListeState createState() => _DouaaListeState();
}

class _DouaaListeState extends State<DouaaListe> {
  List dataDouaa;
  bool isDataDouaa = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  // getData Function
  Future<void> getData() async {
    var res =
        await DefaultAssetBundle.of(context).loadString('sources/douaa.json');

    setState(() {
      dataDouaa = jsonDecode(res)['data'];
      isDataDouaa = true;
    });
  }

  // Go to Douaa Screen
  void pushDouaaScreen(int index) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return DouaaScreen(
        index,
      );
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
          Container(
            width: MediaQuery.of(context).size.width * 1,
            height: 4,
            decoration: BoxDecoration(color: Colors.blue.withOpacity(0.1)),
          ),
          Expanded(
            child: FlatListDouaa(isDataDouaa, dataDouaa, pushDouaaScreen),
          ),
        ],
      ),
    );
  }
}
