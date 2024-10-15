import 'package:flutter/material.dart';

import 'package:table_calendar/table_calendar.dart';
import '../Home/home_screen.dart';
import '../main.dart';

class CalenderScreen extends StatefulWidget {
  final String username;

  const CalenderScreen({super.key, required this.username});

  @override
  CalenderScreenState createState() => CalenderScreenState();
}

class CalenderScreenState extends State<CalenderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: createAppBar(context),
      drawer: createDrawer(context, widget.username),
      body: Column(
        children: [
          createUsernameSection(widget.username),
          TableCalendar(
              focusedDay: DateTime.now(),
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 12, 31)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: createBackWidget(context),
                  ),
                  createImage('assets/images/CareMateLogo.png', 75, 70)
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
