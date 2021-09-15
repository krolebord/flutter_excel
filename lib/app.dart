import 'package:flutter/material.dart';
import 'package:flutter_excel/screens/main_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Excel',
      theme: ThemeData.dark(),
      home: const MainScreen(),
    );
  }
}
