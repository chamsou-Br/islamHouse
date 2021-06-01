import 'package:flutter/material.dart';

class NameHizab extends StatelessWidget {
  NameHizab(
      this.title, this.title2, this.surahname, this.index, this.handlerClick);
  final String title;
  final String title2;
  final String surahname;
  final int index;
  final Function handlerClick;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: GestureDetector(
        onTap: () {
          handlerClick();
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
                  index.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
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
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFB375FE),
                  ),
                ),
                Text(
                  surahname,
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
                title2,
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
