import 'dart:convert';

import 'package:flutter/material.dart';

class SurahAngScreen extends StatefulWidget {
  final int surahIndex;
  SurahAngScreen({this.surahIndex});
  @override
  _SurahAngScreenState createState() => _SurahAngScreenState();
}

class _SurahAngScreenState extends State<SurahAngScreen> {
  List ayats;
  String nameArb;
  String nameAng;
  String place;
  int numbreAyats;
  bool isFetch = false;
  String titleAppBar;

  // getData Function
  Future<void> getData() async {
    var res = await DefaultAssetBundle.of(context)
        .loadString('sources/surahs/${widget.surahIndex}.pretty.json');

    setState(() {
      titleAppBar = jsonDecode(res)['transliteration_en'];
      ayats = jsonDecode(res)['verses'];
      nameArb = jsonDecode(res)["name"];
      nameAng = jsonDecode(res)['translation_en'];
      place = jsonDecode(res)['revelation_type'];
      numbreAyats = jsonDecode(res)['total_verses'];
      isFetch = true;
    });
  }

  // useEffect flutter
  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Color(0xFFB375FE),
        ),
        title: Text(
          isFetch ? titleAppBar : '',
          style: TextStyle(
            color: Color(0xFFB375FE),
            fontWeight: FontWeight.bold,
            fontSize: 22,
            letterSpacing: 1.5,
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Color(0xFFB375FE),
        shadowColor: Color(0xFFB375FE),
      ),
      body: SingleChildScrollView(
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Container(
            height: 250,
            margin: EdgeInsets.all(20),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    isFetch ? nameAng : "",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                        letterSpacing: 1.4),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 0),
                  child: Text(
                    isFetch ? nameArb : "",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        letterSpacing: 1.4),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 25),
                  child: Text(
                    isFetch ? '$place - $numbreAyats - ' : '',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        letterSpacing: 1.2),
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/surahname.png'), fit: BoxFit.cover),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 3),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: RichText(
                textDirection: TextDirection.rtl,
                text: TextSpan(
                  children: List.generate(isFetch ? ayats.length : 0, (index) {
                    return TextSpan(children: [
                      WidgetSpan(
                        child: Center(
                          child: Container(
                            padding: EdgeInsets.only(right: 15, left: 15),
                            margin: EdgeInsets.only(bottom: 10),
                            width: MediaQuery.of(context).size.width * 1,
                            height: 45,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Center(
                                    child: Text(
                                      (index + 1).toString(),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      color: Color(0xFF8a3be2),
                                      borderRadius: BorderRadius.circular(50)),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.share,
                                      color: Color(0xFF8a3be2),
                                      size: 24,
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Icon(
                                      Icons.play_arrow,
                                      color: Color(0xFF8a3be2),
                                      size: 24,
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Icon(
                                      Icons.save,
                                      color: Color(0xFF8a3be2),
                                      size: 24,
                                    ),
                                  ],
                                )
                              ],
                            ),
                            decoration: BoxDecoration(
                              color: Colors.blueAccent.withOpacity(0.08),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      TextSpan(
                        text: ayats[index]["text"],
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFF191970),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      WidgetSpan(
                        child: Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(top: 5),
                          child: RichText(
                            textAlign: TextAlign.start,
                            textDirection: TextDirection.ltr,
                            text: TextSpan(
                              text: ayats[index]["translation_en"],
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xFF191970).withOpacity(0.8),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                      WidgetSpan(
                          child: Center(
                        child: Container(
                          margin: EdgeInsets.only(top: 10, bottom: 20),
                          width: MediaQuery.of(context).size.width * 1,
                          height: 3,
                          decoration: BoxDecoration(
                            color: Colors.blueAccent.withOpacity(0.08),
                          ),
                        ),
                      ))
                    ]);
                  }),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
