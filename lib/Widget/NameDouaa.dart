import 'package:flutter/material.dart';

class NameDouaa extends StatelessWidget {
  NameDouaa(
      this.nameDouaa, this.nameDouaaEng, this.indexDouaa, this.handlerClick);
  final String nameDouaa;
  final String nameDouaaEng;
  final int indexDouaa;
  final Function handlerClick;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: GestureDetector(
        onTap: () {
          handlerClick(indexDouaa);
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
                  indexDouaa.toString(),
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
                  nameDouaaEng,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFB375FE),
                  ),
                ),
                Text(
                  nameDouaa,
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black38,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
