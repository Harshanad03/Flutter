import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:chan_s_application4/presentation/first_station_tab_container_screen/first_station_tab_container_screen.dart';

void main() {
  runApp(Mytest());
}

class Mytest extends StatelessWidget {
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
        title: Text('Google Maps'),
      ),
      body: GoogleMap(
        onMapCreated: (controller) {

          setState(() {
            mapController = controller;
            // Add a marker to the map
            markers.add(
              Marker(
                markerId: MarkerId('Neelambur station'),
                onTap: () {
                  onTapLetsGoButton(context);
                },
                position: LatLng(11.07218, 77.08525),
                infoWindow: InfoWindow(title: 'Neelambur station'),
              ),

            );
          });
          setState(() {
            mapController = controller;
            // Add a marker to the map
            markers.add(
              Marker(
                markerId: MarkerId('Pelamadu station'),
                onTap: () {
                  onTapLetsGoButton(context);
                },
                position: LatLng(11.03464, 77.01557),
                infoWindow: InfoWindow(title: 'Pelamadu station'),
              ),

            );
          });
          setState(() {
            mapController = controller;
            // Add a marker to the map
            markers.add(
              Marker(
                markerId: MarkerId('Saravanampatti station'),
                onTap: () {
                  onTapLetsGoButton(context);
                },
                position: LatLng(11.08326, 77.00299),
                infoWindow: InfoWindow(title: 'Saravanampatti station'),
              ),

            );
          });
          setState(() {
            mapController = controller;
            // Add a marker to the map
            markers.add(
              Marker(
                markerId: MarkerId('Lakashmi mills'),
                onTap: () {
                  onTapLetsGoButton(context);
                },
                position: LatLng(11.01413, 76.98608),
                infoWindow: InfoWindow(title: 'Lakashmi mills'),
              ),

            );
          });
          setState(() {
            mapController = controller;
            // Add a marker to the map
            markers.add(
              Marker(
                markerId: MarkerId('Sulur station'),
                onTap: () {
                  onTapLetsGoButton(context);
                },
                position: LatLng(11.03257, 77.12304),
                infoWindow: InfoWindow(title: 'sulur station'),
              ),

            );
          });


          final polyline = Polyline(
            polylineId: PolylineId('route'),
            points: [LatLng(11.08326, -77.00299), LatLng(11.03257, -77.12304)],
            color: Colors.blue,
            width: 5,
          );

          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(37.422004, -122.084099), // Center on starting point
              zoom: 11.0,
            ),
            polylines: Set<Polyline>.of([polyline]),
          );
        },
        initialCameraPosition: CameraPosition(
          target: LatLng(11.023660, 77.020475),
          zoom: 10.0,
        ),
        markers: markers,
      ),
    );
  }
  onTapLetsGoButton(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) => FirstStationTabContainerScreen(),
        isScrollControlled:true);
  }
}
