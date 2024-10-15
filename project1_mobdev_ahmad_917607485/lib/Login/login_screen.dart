import 'package:flutter/material.dart';
import 'package:project1_mobdev_ahmad_917607485/Custom%20Widgets/battery.dart';

import '../Home/home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: const [
          BatteryMonitorWidget(),
        ],
      ),
      body: Column(children: [
        Column(
          children: [
            SizedBox(
              height: 250,
              child: Image.asset('assets/images/CareMateLogo.png'),
            ),
            const Text(
              'CareMate',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.red,
                shadows: [
                  Shadow(
                      color: Colors.black,
                      blurRadius: 1.5,
                      offset: Offset(1.0, 1.0))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 55),
              child: createTextField('Enter username'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 55),
              child: createTextField('Enter password'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
                  child: createButton('Login', () {
                    login(context);
                  }, 100),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                  child: createButton('Sign Up', () {
                    signUp(context);
                  }, 100),
                )
              ],
            ),
          ],
        ),
      ]),
    );
  }

  void login(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen(username: 'test')),
    );
  }

  void signUp(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen(username: 'test')),
    );
  }
}

TextFormField createTextField(String text) {
  return TextFormField(
    decoration: InputDecoration(
      hintText: text,
      enabledBorder: const OutlineInputBorder(
          borderSide:
              BorderSide(width: 2, color: Color.fromARGB(255, 255, 17, 0))),
      focusedBorder: const OutlineInputBorder(
          borderSide:
              BorderSide(width: 2, color: Color.fromARGB(255, 255, 195, 195))),
      border: const OutlineInputBorder(),
    ),
  );
}

ElevatedButton createButton(String text, VoidCallback onPressed, double width_size) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
        fixedSize: Size.fromWidth(width_size),
        backgroundColor: Colors.red,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7))),
    child: Text(
      text,
      style: const TextStyle(color: Colors.white),
      textAlign: TextAlign.center,
    ),
  );
}
