import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../Home/home_screen.dart';
import '../main.dart';

class NearMeScreen extends StatefulWidget {
  final String username;

  const NearMeScreen({super.key, required this.username});

  @override
  NearMeScreenState createState() => NearMeScreenState();
}

class NearMeScreenState extends State<NearMeScreen> {

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: createAppBar(context),
      drawer: createDrawer(context, widget.username),
      body: Column(
        children: [
          createUsernameSection(widget.username),
          Expanded(child: content()),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: createBackWidget(context),
              ),
              createImage('assets/images/CareMateLogo.png', 75, 70),
            ],
          ),
        ],
      ),
    );
  }

  Widget content() {
    return FlutterMap (
      options: const MapOptions(
        initialCenter: LatLng(33.5753, -85.1041),
        initialZoom: 14,
        interactionOptions:  InteractionOptions(flags: ~InteractiveFlag.doubleTapDragZoom,),
      ),
      children: [
        openStreetMapTileLater,
        const MarkerLayer(markers: [
          Marker(
            point: LatLng(33.5753, -85.1041), 
            width: 60,
            height: 60,
            alignment: Alignment.centerLeft,
            child: Icon(
              Icons.location_pin,
              size: 60,
              color: Colors.red,
            )
          )
        ])
      ],
    );
  }
}

TileLayer get openStreetMapTileLater => TileLayer(
  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
  userAgentPackageName: 'dev.fleaflet.flutter_map.example',
);