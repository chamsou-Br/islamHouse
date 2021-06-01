import 'package:flutter/material.dart';
import 'package:islam_dini/Widget/NameDouaa.dart';

class FlatListDouaa extends StatelessWidget {
  FlatListDouaa(this.isData, this.data, this.handlerClick);
  final bool isData;
  final List data;
  final Function handlerClick;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return NameDouaa(
            isData ? data[index]['name'] : '',
            isData ? data[index]['translation_en'] : '',
            isData ? index + 1 : 0,
            handlerClick);
      },
      itemCount: isData ? data.length : 0,
    );
  }
}
