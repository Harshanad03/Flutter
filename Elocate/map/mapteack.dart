import 'package:chan_s_application4/presentation/success/sucess.dart';
import 'package:chan_s_application4/presentation/track/track.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(Mymaptrack());
}

class Mymaptrack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MapScreen(),
    );
  }
}

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? mapController;

  final LatLng _initialPosition = const LatLng(37.7749, -122.4194); // San Francisco, CA

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Maps Example'),
      ),
      body: GoogleMap(
        onMapCreated: (controller) {
          setState(() {
            mapController = controller;
          });
        },
        initialCameraPosition: CameraPosition(
          target: LatLng(11.023660, 77.020475),
          zoom: 12.0,
        ),
        markers: {
          Marker(
            markerId: MarkerId("MarkerID"),
            position: _initialPosition,
            infoWindow: InfoWindow(
              title: 'Marker Title',
              snippet: 'Marker Snippet',
            ),
          ),
        },
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          onTapArrowDownon(context);
          // Handle the next action here
          print('Next button pressed!');
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(255, 45, 141, 66),
        ),
        child: Text(
          'reached',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }

  // Your function to handle button tap
  void onTapArrowDownon(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) => Mytrack(),
        isScrollControlled:true);

  }
}
