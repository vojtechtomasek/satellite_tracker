import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:satellite_tracker/routes/app_router.dart';
import 'package:geolocator/geolocator.dart';
import 'package:satellite_tracker/models/satellite_params.dart';
import 'package:satellite_tracker/api/satellite_api.dart';

@RoutePage()
class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  bool _isSwitched = false;
  final TextEditingController _controller = TextEditingController();
  String _location = 'Location: Unknown';
  Position? _currentPosition;

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  Future<void> _getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() {
        _location = 'Location: Disabled';
        _currentPosition = null;
      });
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() {
          _location = 'Location permissions are denied';
          _currentPosition = null;
        });
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      setState(() {
        _location = 'Location permissions are permanently denied, we cannot request permissions.';
        _currentPosition = null;
      });
      return;
    }

    Position position = await Geolocator.getCurrentPosition();
    setState(() {
      _currentPosition = null;
      _location = 'Lat: ${position.latitude}, Lon: ${position.longitude}';
    });

  }

  Future<void> _submitData() async {
    if (_controller.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Enter satellite ID and location'))
      );
      return;
    }

    final satelliteId = int.tryParse(_controller.text);
    if (satelliteId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Enter valid number'))
      );
      return;
    }

    try {
      final params = SatelliteParams(
        satelliteId: satelliteId, 
        latitude: _currentPosition?.latitude ?? 37, 
        longitude: _currentPosition?.longitude ?? -122, 
        visibleOnly: _isSwitched
        );

        final api = SatelliteApi();
        final response = await api.getSatelliteData(params);

        if (!mounted) return;

        if (response.statusCode == 200) {
          context.router.push(SatelliteInfoRoute(data: response.body));
        } else {
          throw Exception('Failed to load satellite data');
        }
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 350,
              child: TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter number',
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Switch(
                  value: _isSwitched,
                  onChanged: (value) {
                    setState(() {
                      _isSwitched = value;
                    });
                  },
                  activeColor: Colors.green,
                ),
                const SizedBox(width: 20),
                const Text('Visible'),
              ],
            ),
            const SizedBox(height: 100),
            ElevatedButton(
                onPressed: _submitData,
                child: const Text('Submit')),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            _location,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}