import 'package:flutter/material.dart';
import 'package:islam_dini/Widget/NameSurah.dart';

class FlatListSurah extends StatelessWidget {
  FlatListSurah(this.isData, this.data, this.handleClick);
  final bool isData;
  final List data;
  final Function handleClick;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return NameSurah(
          isData ? data[index]["title"] : "",
          index + 1,
          isData ? data[index]["titleAr"] : "",
          isData ? data[index]["type"] : "",
          handleClick,
        );
      },
      itemCount: isData ? data.length : 0,
    );
  }
}
