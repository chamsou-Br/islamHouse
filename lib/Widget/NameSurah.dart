import 'package:flutter/material.dart';

class NameSurah extends StatelessWidget {
  NameSurah(this.surahName, this.surahNumber, this.surahName2, this.surahPlace,
      this.handlerClick);
  final String surahName;
  final String surahName2;
  final String surahPlace;
  final int surahNumber;
  final Function handlerClick;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: GestureDetector(
        onTap: () {
          handlerClick(surahName, surahNumber);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/circle5.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Text(
                  surahNumber.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 30,
            ),
            Column(
              children: [
                Text(
                  surahName,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFB375FE),
                  ),
                ),
                Text(
                  surahPlace,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black38,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Text(
                surahName2,
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFB375FE),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
