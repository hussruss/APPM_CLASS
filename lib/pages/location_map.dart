import 'dart:async';
import 'dart:math';

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

  TextEditingController _controllerInput = TextEditingController();

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
        _currentLocator = LatLng(19.4326552, -99.1330327);
        _markers.add(Marker(
            markerId: MarkerId('currentLocator'),
            position: _currentLocator,
            infoWindow: InfoWindow(title: 'Marka')));
      });
      _moveCameraToCurrentLocator(_currentLocator);
    } catch (e) {
      print('Error $e');
      setState(() {});
    }
  }

  Future<void> _moveCameraToCurrentLocator(LatLng latLng) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: latLng, zoom: 14)));
  }

  void _addMark() {
    if (_controllerInput.text.isEmpty) {
      return;
    }
    LatLng latlng = _generateRandomLatLng();
    setState(() {
      _markers.add(Marker(
          markerId: MarkerId('currentLocator'),
          position: latlng,
          infoWindow: InfoWindow(title: _controllerInput.text)));
    });
    _moveCameraToCurrentLocator(latlng);
    _controllerInput.clear();
  }

  LatLng _generateRandomLatLng() {
    final random = Random();
    final lat =
        -90.0 + random.nextDouble() * 180.0; // Rango de latitud: -90 a 90
    final lng =
        -180.0 + random.nextDouble() * 360.0; // Rango de longitud: -180 a 180
    return LatLng(lat, lng);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Geolocalización y Google Maps')),
      body: Column(
        children: [
          Container(
            height: 130,
            padding: EdgeInsets.all(15.0),
            child: Column(
              children: [
                TextField(
                  controller: _controllerInput,
                ),
                ElevatedButton(
                    onPressed: _addMark, child: Text('Agregar marcador'))
              ],
            ),
          ),
          Flexible(
            child: Stack(
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
          ),
        ],
      ),
    );
  }
}
