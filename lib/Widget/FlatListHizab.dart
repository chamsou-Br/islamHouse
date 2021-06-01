import 'package:flutter/material.dart';
import 'package:islam_dini/Widget/NameHizabJuz.dart';

class FlatListHizab extends StatelessWidget {
  FlatListHizab(this.isData, this.data, this.title);
  final bool isData;
  final List data;
  final List title;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return NameHizab(
          isData ? title[0] + data[index]['index'] : "",
          isData ? title[1] + data[index]['index'] : '',
          isData ? data[index]["start"]["name"] : "",
          isData ? index + 1 : 0,
          () {},
        );
      },
      itemCount: isData ? data.length : 0,
    );
  }
}
