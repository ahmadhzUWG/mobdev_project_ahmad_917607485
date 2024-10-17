import 'package:flutter/material.dart';

import '../Home/home_screen.dart';
import '../main.dart';

class EmergencyHelpScreen extends StatelessWidget {
  final String username;

  const EmergencyHelpScreen({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: createAppBar(context),
      drawer: createDrawer(context, username),
      body: Column(
        children: [
          createUsernameSection(username),
          const SizedBox(height: 15),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: createCallWidgets('Medical Emergency'),
              ),
              const SizedBox(width: 20),
              createCallWidgets('Emergency Contact'),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 200),
                child: createBackWidget(context),
              ),
              createImage('assets/images/CareMateLogo.png', 75, 70)
            ],
          ),
        ],
      ),
    );
  }

  Column createCallWidgets(String text) {
    return Column(
      children: [
        createTextBox(text, 150, 150),
        Container(
          decoration:
              const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.call),
            iconSize: 50,
            color: Colors.white,
          ),
        ),
        const Text(
          'Call',
          style: TextStyle(
            color: Colors.red,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}

Container createTextBox(String text, double height, double width) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          color: Colors.red, borderRadius: BorderRadius.circular(8)),
      height: height,
      width: width,
      child: Text(
        textAlign: TextAlign.center,
        text,
        style: const TextStyle(
            color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }

Text createUsernameText(String username) {
    return Text(
                username,
                style: const TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 32,
                ),
              );
  }
