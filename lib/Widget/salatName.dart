import 'package:flutter/material.dart';

class SalatName extends StatelessWidget {
  final String salatNameArb;
  final String salatNameAng;
  final String salatTime;
  final String ikamaTime;

  SalatName(
      this.salatNameArb, this.salatNameAng, this.salatTime, this.ikamaTime);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 5),
      padding: EdgeInsets.symmetric(horizontal: 10),
      width: MediaQuery.of(context).size.width * 1,
      height: 40,
      decoration: BoxDecoration(
        color: Color(0xFFB375FE),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 100,
            child: Text(
              salatNameAng,
              overflow: TextOverflow.fade,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            width: 70,
            child: Text(
              salatTime,
              overflow: TextOverflow.fade,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            width: 50,
            child: Text(
              ikamaTime != "" ? ikamaTime : "-",
              textAlign: TextAlign.center,
              overflow: TextOverflow.fade,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            width: 100,
            child: Text(
              salatNameArb,
              textDirection: TextDirection.rtl,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
