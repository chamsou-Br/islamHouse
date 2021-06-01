import 'package:flutter/material.dart';

class PartQoran extends StatelessWidget {
  PartQoran(this.condition, this.title, this.handlerClick, this.page);
  final bool condition;
  final String title;
  final int page;
  final Function handlerClick;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        child: Container(
          decoration: BoxDecoration(
            border: condition
                ? Border(
                    bottom: BorderSide(
                      color: Color(0xFFB375FE),
                      width: 3,
                    ),
                  )
                : null,
          ),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: condition ? Color(0xFFB375FE) : Colors.black45,
              fontSize: condition ? 23 : 20,
              fontWeight: condition ? FontWeight.w900 : FontWeight.w600,
            ),
          ),
        ),
        onTap: () {
          handlerClick(page);
        },
      ),
    );
  }
}
