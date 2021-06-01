import 'package:flutter/material.dart';

class AyaText extends StatelessWidget {
  AyaText({this.aya, this.index});
  final String aya;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Text(
      aya,
      style: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
