import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'Profile.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GoogleMapController mapController;
  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Set<Marker> _createMarker() {
    return <Marker>[
      Marker(
          markerId: MarkerId('home'),
          position: LatLng(45.521563, -122.677433),
          icon: BitmapDescriptor.defaultMarker,
          infoWindow: InfoWindow(title: 'Current Location'))
    ].toSet();
  }

  Set<Circle> _circles = Set.from([
    Circle(
        circleId: CircleId('Infection'),
        center: LatLng(45.521563, -122.677433),
        radius: 450,
        strokeColor: Colors.green)
  ]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Covid-19 Tracker"),
        automaticallyImplyLeading: false,
        actions: [
          MaterialButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Pofile()));
            },
            color: Colors.pinkAccent[700],
            child: Icon(
              Icons.person_outline,
              color: Colors.white,
              size: 24,
            ),
            shape: CircleBorder(),
            padding: EdgeInsets.all(0),
          )
        ],
      ),
      body: GoogleMap(
        markers: _createMarker(),
        circles: _circles,
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(target: _center, zoom: 14.0),
      ),
    );
  }
}
