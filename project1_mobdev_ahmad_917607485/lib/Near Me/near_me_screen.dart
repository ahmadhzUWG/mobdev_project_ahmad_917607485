import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

import '../Home/home_screen.dart';
import '../main.dart';

class NearMeScreen extends StatefulWidget {
  final String username;

  const NearMeScreen({super.key, required this.username});

  @override
  NearMeScreenState createState() => NearMeScreenState();
}

class NearMeScreenState extends State<NearMeScreen> {
  late GoogleMapController mapController;
  LatLng? currentPosition;
  bool isLoading = true;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  getLocation() async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();
      
      if (permission == LocationPermission.denied || 
          permission == LocationPermission.deniedForever) {
        setState(() {
          errorMessage = 'Location permission denied';
          isLoading = false;
        });
        return;
      }

      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      double lat = position.latitude;
      double long = position.longitude;

      LatLng location = LatLng(lat, long);
      print('Current Position: Lat: $lat, Long: $long');

      setState(() {
        currentPosition = location;
        isLoading = false;
      });
    } catch (e) {
      print('Error getting location: $e');
      setState(() {
        errorMessage = 'Error retrieving location: $e';
        isLoading = false;
      });
    }
  }

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
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
          Expanded(
            child: isLoading
                ? const Center(child: CircularProgressIndicator())
                : errorMessage.isNotEmpty
                    ? Center(child: Text(errorMessage, style: const TextStyle(color: Colors.red)))
                    : currentPosition != null // Ensure currentPosition is not null
                        ? Container(
                            margin: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.red, width: 5),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: GoogleMap(
                              onMapCreated: onMapCreated,
                              initialCameraPosition: CameraPosition(
                                target: currentPosition!, 
                                zoom: 16.0,
                              ),
                            ),
                          )
                        : const Center(child: Text('Unable to retrieve location.', style: TextStyle(color: Colors.red))),
          ),
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
    );
  }
}
