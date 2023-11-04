import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationMapScreen extends StatefulWidget {
  const LocationMapScreen({super.key});

  @override
  State<LocationMapScreen> createState() => _LocationMapScreenState();
}

class _LocationMapScreenState extends State<LocationMapScreen> {
  Completer<GoogleMapController> _controller = Completer<GoogleMapController>();
  LatLng _currentLocator = LatLng(0, 0);
  Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _getLocator();
  }

  Future<void> _getLocator() async {
    try {
      final position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      setState(() {
        _currentLocator = LatLng(position.latitude, position.longitude);
        _markers.add(Marker(
            markerId: MarkerId('currentLocator'), position: _currentLocator));
      });
      _moveCameraToCurrentLocator();
    } catch (e) {
      print('Error $e');
      setState(() {});
    }
  }

  Future<void> _moveCameraToCurrentLocator() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: _currentLocator, zoom: 14)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Geolocalización y Google Maps')),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition:
                CameraPosition(target: _currentLocator, zoom: 14),
            myLocationEnabled: true,
            markers: _markers,
            onMapCreated: (controller) {
              _controller.complete(controller);
            },
          ),
          Positioned(
              bottom: 10,
              right: 10,
              child: FloatingActionButton(
                  child: Icon(Icons.my_location), onPressed: _getLocator))
        ],
      ),
    );
  }
}
