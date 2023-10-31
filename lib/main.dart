import 'package:flutter/cupertino.dart';
import 'digimon_master.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'Cupertino List',
      home: MainScreen(),
    );
  }
}
