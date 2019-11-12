import 'package:flutter/material.dart';

void main() => runApp(MyApp());

GlobalKey<ScaffoldState> scaffoldState = GlobalKey();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Color(0xFF7D9AFF), accentColor: Color(0xFF7D9AFF)),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);

    return Scaffold(
      key: scaffoldState,
      body: Center(
        child: Text('Hello World'),
      ),
    );
  }
}
