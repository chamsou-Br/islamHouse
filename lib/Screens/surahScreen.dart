import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:islam_dini/Services/asmaAllah.dart';

class SurahScreen extends StatefulWidget {
  final surahName;
  final surahIndex;
  SurahScreen({this.surahName, this.surahIndex});
  @override
  _SurahScreenState createState() => _SurahScreenState();
}

class _SurahScreenState extends State<SurahScreen> {
  List ayats;
  String name;
  String place;
  int numbreAyats;
  bool isFetch = false;
  List asmaAllah = new AssmaAllah().assmallah;

  // getData Function
  Future<void> getData() async {
    var res = await DefaultAssetBundle.of(context)
        .loadString('sources/surahs/${widget.surahIndex}.pretty.json');

    setState(() {
      ayats = jsonDecode(res)['verses'];
      name = jsonDecode(res)["name"];
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
          widget.surahName,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 250,
              margin: EdgeInsets.all(20),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      isFetch ? name : widget.surahName,
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
                      widget.surahName,
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
                      isFetch
                          ? '$place - $numbreAyats verses -'
                          : widget.surahName,
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
                    image: AssetImage('images/surahname.png'),
                    fit: BoxFit.cover),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 3),
              child: RichText(
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
                text: TextSpan(
                  children: List.generate(isFetch ? ayats.length : 0, (index) {
                    String word = ayats[index]["text"];
                    List words = word.split(' ');
                    return TextSpan(
                      children: [
                        TextSpan(
                          children: List.generate(words.length, (index2) {
                            return asmaAllah.contains(words[index2])
                                ? TextSpan(
                                    text: ' ${words[index2]}',
                                    style: TextStyle(
                                      fontSize: 22,
                                      color: Color(0xFFB375FE),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                : TextSpan(
                                    text: ' ${words[index2]}',
                                    style: TextStyle(
                                      fontSize: 22,
                                      color: Color(0xFF191970),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  );
                          }),
                        ),
                        WidgetSpan(
                          child: SizedBox(
                            width: 3,
                          ),
                        ),
                        WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: Container(
                            alignment: Alignment.centerRight,
                            width: 30,
                            height: 30,
                            child: Center(
                              child: Text(
                                (index + 1).toString(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: (index + 1) < 100 ? 16 : 14,
                                  color: Color(0xFFB375FE),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('images/circle2.jpg'))),
                          ),
                        ),
                        WidgetSpan(
                          child: SizedBox(
                            width: 3,
                          ),
                        ),
                      ],
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*class SurahScreen extends StatelessWidget {
  List<Widget> map = [Text("vvfbfgnh,"), Text('gfh,j'), Text('dqdfgfhg')];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Surah"),
          backgroundColor: Color(0xFFB375FE),
        ),
        body: PageView(
          /// [PageView.scrollDirection] defaults to [Axis.horizontal].
          /// Use [Axis.vertical] to scroll vertically.
          scrollDirection: Axis.horizontal,
          controller: PageController(initialPage: 0),
          children: map,
        ));
  }
}*/
