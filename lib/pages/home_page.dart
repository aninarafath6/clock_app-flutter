import 'package:clock_app/widgets/clock_view.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(),
        body: Container(
      alignment: Alignment.center,
      color: Color(0xFF2D2F41),
      child: ClockView(),
    ));
  }
}
