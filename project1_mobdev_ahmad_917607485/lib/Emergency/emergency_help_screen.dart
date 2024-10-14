import 'package:flutter/material.dart';

import '../Home/home_screen.dart';
import '../Login/login_screen.dart';

class EmergencyHelpScreen extends StatelessWidget {
  final String username;

  const EmergencyHelpScreen({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.red, size: 50),
        flexibleSpace: Container(
          alignment: Alignment.bottomCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: createButton('Logout', () {
                  logout(context);
                }, 100),
              ),
            ],
          ),
        ),
        actions: const [
          Text('Battery:'), //TODO battery monitoring
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[], //TODO hamburger menu
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 30),
                child: Text(
                  'Hi, $username',
                  style: const TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 32,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: createCallWidgets('Medical Emergency'),
              ),
              createHSpaceFiller(20),
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
        createTextBox(text),
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

  Container createTextBox(String text) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          color: Colors.red, borderRadius: BorderRadius.circular(8)),
      height: 150,
      width: 150,
      child: Text(
        textAlign: TextAlign.center,
        text,
        style: const TextStyle(
            color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}

Column createBackWidget(BuildContext context) {
    return Column(
      children: [
        IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_circle_left,
              size: 75,
              color: Colors.red,
            )),
        const Text(
          'Back',
          style: TextStyle(
            color: Colors.red,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

SizedBox createHSpaceFiller(double width) {
  return SizedBox(
    width: width,
  );
}

SizedBox createVSpaceFiller(double height) {
  return SizedBox(
    height: height,
  );
}
