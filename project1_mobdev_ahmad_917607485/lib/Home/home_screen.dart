import 'package:flutter/material.dart';
import 'package:project1_mobdev_ahmad_917607485/Emergency/emergency_help_screen.dart';
import 'package:project1_mobdev_ahmad_917607485/Other%20Help/other_help_screen.dart';

import '../Login/login_screen.dart';

class HomeScreen extends StatelessWidget {
  final String username;

  const HomeScreen({super.key, required this.username});

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
                padding: const EdgeInsets.symmetric(vertical: 30),
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
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: createImage('assets/images/emergency.jpg', 150, 100),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: createImage('assets/images/non_emergency.png', 150, 100),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(27, 0, 0, 40),
                child: createButton('Emergency Help', () {
                  emergency(context, username);
                }, 150),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 0, 0, 40),
                child: createButton('Other Help', () {
                  otherHelp(context, username);
                }, 150),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: createImage('assets/images/meal.jpg', 150, 100),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: createImage('assets/images/calender.png', 150, 100),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(27, 0, 0, 40),
                child: createButton(
                    'Request Meal', () {}, 150), // Load meal screen
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 0, 0, 40),
                child: createButton(
                    'Calender', () {}, 150), // Load calender screen
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: createImage('assets/images/camera.jpg', 150, 100),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.red,
                      width: 5,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: createImage('assets/images/near_me.png', 150, 100),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(27, 0, 0, 40),
                child: createButton('Camera', () {}, 150), // Load camera screen
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(52.5, 0, 0, 40),
                child:
                    createButton('Near Me', () {}, 150), // Load near me screen
              ),
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

void otherHelp(BuildContext context, String username) {
  Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => OtherHelpScreen(
              username: username,
            )),
  );
}

void emergency(BuildContext context, String username) {
  Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => EmergencyHelpScreen(
              username: username,
            )),
  );
}

void logout(BuildContext context) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => const LoginScreen()),
    (route) => false,
  );
}

ClipRRect createImage(String path, double width, double height) {
  return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image(
        image: AssetImage(path),
        width: width,
        height: height,
        fit: BoxFit.fill,
      ));
}
