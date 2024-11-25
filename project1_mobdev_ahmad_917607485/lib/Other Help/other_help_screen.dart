import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:project1_mobdev_ahmad_917607485/Emergency/emergency_help_screen.dart';
import 'package:project1_mobdev_ahmad_917607485/Other%20Help/help_request.dart';
import 'package:project1_mobdev_ahmad_917607485/Other%20Help/other_help_controller.dart';
import 'package:project1_mobdev_ahmad_917607485/main.dart';

import '../Home/home_screen.dart';
import '../Login/login_screen.dart';
import 'help_type.dart';

class OtherHelpScreen extends StatelessWidget {
  int helpCounter = 0;
  final String username;
  final OtherHelpController _otherHelpController = OtherHelpController();

  OtherHelpScreen({super.key, required this.username});

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
                    createButton('Request', () {showInputDialog(context, HelpType.feeding);}, 120)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, top: 30),
                child: Column(
                  children: [
                    createTextBox('Medicine Help?', 150, 150),
                    createButton('Request', () {showInputDialog(context, HelpType.medical);}, 120)
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
                    createTextBox('Other Help?', 140, 150),
                    createButton('Request', () {showInputDialog(context, HelpType.other);}, 120)
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

  Future<void> showInputDialog(BuildContext context, HelpType type) async {
  TextEditingController controller = TextEditingController();

  return showDialog<void>(
    context: context,
    barrierDismissible: false,  
    builder: (BuildContext dialogContext) {
      return AlertDialog(
        title: Text('Help'),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(hintText: 'Enter your request'),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(dialogContext).pop(); 
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              String inputText = controller.text;
              HelpRequest helpRequest = HelpRequest();
              helpRequest.setId(helpCounter);
              helpCounter++;
              helpRequest.setDescription(inputText);
              helpRequest.setType(type);
              helpRequest.setTimestamp(DateTime.now());
              HelpRequest loggedHelpRequest = await _otherHelpController.logHelpRequest(helpRequest);
              log("Logged Help Request:\n\tId: ${loggedHelpRequest.id}\n\tDescription: ${loggedHelpRequest.description}\n\tType: ${loggedHelpRequest.type}\n\tTimestamp: ${loggedHelpRequest.timestamp.toIso8601String()}");
              Navigator.of(dialogContext).pop(); 
            },
            child: Text('Send'),
          ),
          ],
        );
     },
    );
  }
}


