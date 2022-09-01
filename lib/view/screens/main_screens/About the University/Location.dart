import 'dart:async';
import 'package:flutter_share/flutter_share.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  final Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(30.916123853477572, 41.07974528008654),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: _kGooglePlex,
        markers: <Marker>{
          Marker(
            markerId: MarkerId('1'),
            position: LatLng(30.9159812, 41.0771167),
            infoWindow: InfoWindow(
              title: 'Northern Border University',
              snippet: 'Arar, Saudi Arabia',
            ),
          ),
        },
        onMapCreated: _controller.complete,
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: share,
        label: Text('Share My Location'),
        icon: Icon(Icons.share_location),
      ),
    );
  }

  void share() async {
    await FlutterShare.share(
        title: 'NBU',
        text: 'Northern Border University',
        linkUrl: 'https://goo.gl/maps/ntBbsxx9fTD6se1W8',
        chooserTitle: 'Share with');
  }
}
