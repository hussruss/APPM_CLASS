import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  String _location = 'Desconocida';

  Future<void> _getLocator() async {
    try {
      final position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      setState(() {
        _location =
            'Latitud: ${position.latitude}, Longitud: ${position.longitude}';
      });
    } catch (e) {
      setState(() {
        _location = 'Error ${e.toString()}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ubicación actual')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Ubicación = $_location'),
            ElevatedButton(
                onPressed: _getLocator, child: Text('Obtener ubicación'))
          ],
        ),
      ),
    );
  }
}
