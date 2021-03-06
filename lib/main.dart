import 'package:flutter/material.dart';
import 'package:islam_dini/Screens/Douaaliste.dart';
import 'package:islam_dini/Screens/QoranListe.dart';
import 'package:islam_dini/Screens/SalatScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentPage = 0;

  // change Page function
  void changePage(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  List _page = [QoranListe(), DouaaListe(), SalatScreen()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xFF431AA1),
        buttonColor: Color(0xFF431AA1),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Islam'),
          backgroundColor: Color(0xFFB375FE),
        ),
        body: Center(
          child: _page[_currentPage],
        ),
        bottomNavigationBar: BottomNavigationBar(
          fixedColor: Color(0xFFB375FE),
          currentIndex: _currentPage,
          onTap: changePage,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Qoran',
              backgroundColor: Color(0xFFB375FE),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.remove),
              label: 'Douaa',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.face),
              label: "Salat",
            ),
          ],
        ),
      ),
    );
  }
}
