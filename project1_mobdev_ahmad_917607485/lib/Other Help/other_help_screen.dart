import 'package:flutter/material.dart';
import 'package:project1_mobdev_ahmad_917607485/Emergency/emergency_help_screen.dart';
import 'package:project1_mobdev_ahmad_917607485/main.dart';

import '../Home/home_screen.dart';
import '../Login/login_screen.dart';

class OtherHelpScreen extends StatelessWidget {
  final String username;

  const OtherHelpScreen({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: createAppBar(context),
      drawer: createDrawer(context, username),
      body: Column(
        children: [
          createUsernameSection(username),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 45, top: 30),
                child: Column(
                  children: [
                    createTextBox('Feeding Help?', 150, 140),
                    createButton('Request', () {}, 120)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, top: 30),
                child: Column(
                  children: [
                    createTextBox('Medicine Help?', 150, 150),
                    createButton('Request', () {}, 120)
                  ],
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Column(
                  children: [
                    createTextBox('Restroom Help?', 140, 150),
                    createButton('Request', () {}, 120)
                  ],
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: createBackWidget(context),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [createImage('assets/images/CareMateLogo.png', 75, 70)],
          ),
        ],
      ),
    );
  }
}
