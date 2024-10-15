import 'package:flutter/material.dart';
import 'package:project1_mobdev_ahmad_917607485/Calender/calender_screen.dart';
import 'package:project1_mobdev_ahmad_917607485/Camera/camera_screen.dart';
import 'package:project1_mobdev_ahmad_917607485/Meal/meal_screen.dart';
import 'package:project1_mobdev_ahmad_917607485/Near%20Me/near_me_screen.dart';
import 'package:project1_mobdev_ahmad_917607485/Other%20Help/other_help_screen.dart';

import 'Custom Widgets/battery.dart';
import 'Emergency/emergency_help_screen.dart';
import 'Home/home_screen.dart';
import 'Login/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginScreen(),
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

Drawer createDrawer(BuildContext context, String username) {
  return Drawer(
    backgroundColor: Colors.white,
    child: ListView(
      children: <Widget>[
        DrawerHeader(
            decoration: const BoxDecoration(color: Colors.red),
            child: Column(
              children: [
                const Text(
                  'CareMate',
                  style: TextStyle(fontSize: 42, color: Colors.white),
                ),
                const SizedBox(height: 15),
                createImage('assets/images/CareMateLogo.png', 50, 50)
              ],
            )),
        const SizedBox(height: 20),
        createHamburgerMenuItem(
            'Emergency Help', 'assets/images/emergency.jpg', 100, 100, () {
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EmergencyHelpScreen(
                      username: username,
                    )),
          );
        }),
        const SizedBox(height: 20),
        createHamburgerMenuItem(
            'Other Help', 'assets/images/non_emergency.png', 100, 100, () {
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => OtherHelpScreen(
                      username: username,
                    )),
          );
        }),
        const SizedBox(height: 30),
        createHamburgerMenuItem('Meals', 'assets/images/meal.jpg', 100, 100,
            () {
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MealScreen(
                      username: username,
                    )),
          );
        }),
        const SizedBox(height: 30),
        createHamburgerMenuItem(
            'Calender', 'assets/images/calender.png', 100, 100, () {
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CalenderScreen(
                      username: username,
                    )),
          );
        }),
        const SizedBox(height: 30),
        createHamburgerMenuItem('Camera', 'assets/images/camera.jpg', 100, 100,
            () {
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CameraScreen(
                      username: username,
                    )),
          );
        }),
        const SizedBox(height: 30),
        createHamburgerMenuItemWithBorder(
            'Near Me', 'assets/images/near_me.png', 90, 90, () {
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => NearMeScreen(
                      username: username,
                    )),
          );
        }),
        const SizedBox(height: 90),
        Center(
          child: createImage('assets/images/CareMateLogo.png', 75, 70),
        ),
      ],
    ),
  );
}

ListTile createHamburgerMenuItem(String text, String imagePath, double width,
    double height, VoidCallback onTap) {
  return ListTile(
    leading: createImage(imagePath, width, height),
    title: Text(
      textAlign: TextAlign.center,
      text,
      style: const TextStyle(
          color: Colors.red, fontWeight: FontWeight.bold, fontSize: 26),
    ),
    onTap: () {
      onTap();
    },
  );
}

ListTile createHamburgerMenuItemWithBorder(String text, String imagePath,
    double width, double height, VoidCallback onTap) {
  return ListTile(
    leading: Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.red, width: 5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: createImage(imagePath, width, height),
    ),
    title: Text(
      textAlign: TextAlign.center,
      text,
      style: const TextStyle(
          color: Colors.red, fontWeight: FontWeight.bold, fontSize: 26),
    ),
    onTap: () {
      onTap();
    },
  );
}

AppBar createAppBar(BuildContext context) {
  return AppBar(
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
      BatteryMonitorWidget(),
    ],
  );
}

Row createUsernameSection(String username) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 15),
        child: createUsernameText(username),
      )
    ],
  );
}
