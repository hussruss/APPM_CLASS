import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GpsScreen extends StatefulWidget {
  const GpsScreen({Key? key}) : super(key: key);

  @override
  State<GpsScreen> createState() => _GpsScreenState();
}

class _GpsScreenState extends State<GpsScreen> {
  late GoogleMapController _controller;
  Set<Marker> _markers = <Marker>{};
  LatLng _gps = const LatLng(48.8583701, 2.2944813);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.pink, Colors.purple],
            ),
          ),
          child: Stack(
            children: [
              GoogleMap(
                onMapCreated: (controller) {
                  _controller = controller;
                  setState(() {});
                },
                initialCameraPosition: CameraPosition(target: _gps, zoom: 11),
                markers: _markers,
              ),
              Positioned(
                bottom: 30,
                left: MediaQuery.of(context).size.width * 0.4,
                child: FloatingActionButton(
                  onPressed: () async {
                    final Geolocator geolocator = Geolocator();
                    LocationPermission permission =
                        await Geolocator.requestPermission();
                    Position position = await Geolocator.getCurrentPosition(
                        desiredAccuracy: LocationAccuracy.low);
                    print(position);
                    setState(() {
                      _gps = LatLng(position.latitude, position.longitude);
                      _markers.clear();
                      _markers.add(
                          Marker(markerId: MarkerId('Home'), position: _gps));
                      _controller.animateCamera(CameraUpdate.newCameraPosition(
                          CameraPosition(target: _gps, zoom: 11)));
                    });
                  },
                  backgroundColor: Colors.black,
                  child: const Icon(Icons.gps_fixed),
                ),
              ),
            ],
          )),
    );
  }
}
