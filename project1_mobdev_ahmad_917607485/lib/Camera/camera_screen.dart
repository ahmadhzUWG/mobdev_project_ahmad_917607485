import 'package:flutter/material.dart';
import 'package:project1_mobdev_ahmad_917607485/main.dart';

import '../Home/home_screen.dart';

class CameraScreen extends StatefulWidget {
  final String username;

  const CameraScreen({super.key, required this.username});

  @override
  CameraScreenState createState() => CameraScreenState();
}

class CameraScreenState extends State<CameraScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBar(context),
      backgroundColor: Colors.white,
      drawer: createDrawer(context, widget.username),
      body: Column(
        children: [
          createUsernameSection(widget.username),
          const SizedBox(height: 10,),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.red, width: 5)),
            width: 300,
            height: 475,
            child: const Text('FUTURE PICTURE TAKING', textAlign: TextAlign.center,)
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.camera),
            color: Colors.red,
            iconSize: 75,
          ),
          const Text(
            'Take Picture',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              color: Colors.red,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const SizedBox(width: 60),
              createBackWidget(context),
              const SizedBox(width: 120),
              createImage('assets/images/CareMateLogo.png', 75, 70)
            ],
          ),
        ],
      ),
    );
  }
}
