import 'package:clock_app/widgets/clock_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    var formatedTime = DateFormat('HH:mm').format(now);
    var formatedDate = DateFormat('EEE,d MMM').format(now);
    var timeZonString = now.timeZoneOffset.toString().split('.').first;
    String offsetSign = '';
    if (!timeZonString.startsWith('-')) offsetSign = '+';
    return Scaffold(
        backgroundColor: Color(0xFF2D2F41),
        body: Container(
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Clock',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
              Text(
                formatedTime,
                style: TextStyle(color: Colors.white, fontSize: 64),
              ),
              Text(
                formatedDate,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              ClockView(),
              Text(
                'Timezone',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              Row(children: [
                Icon(Icons.language),
                Text(
                  'UTC' + offsetSign + timeZonString,
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ])
            ],
          ),
        ));
  }
}

class Edgeinsets {}
