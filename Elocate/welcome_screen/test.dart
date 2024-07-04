import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:chan_s_application4/presentation/first_station_page/first_station_page.dart';

void main() {
  runApp(Mylocat());
}

class Mylocat extends StatelessWidget {
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
  Set<Marker> markers = {};

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
            // Add a marker to the map
            markers.add(
              Marker(
                markerId: MarkerId('myMarker'),
                  onTap: () {
                    onTapLetsGoButton(context);
                    },
                position: LatLng(11.023660, 77.020475),
                infoWindow: InfoWindow(title: 'My Marker'),
              ),
            );
          });
        },
        initialCameraPosition: CameraPosition(
          target: LatLng(11.023660, 77.020475),
          zoom: 12.0,
        ),
        markers: markers,
      ),
    );
  }
  onTapLetsGoButton(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) => FirstStationPage(),
        isScrollControlled:true);
    }
}
