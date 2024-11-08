import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:satellite_tracker/routes/app_router.dart';

@RoutePage()
class SatelliteInfoScreen extends StatefulWidget {
  const SatelliteInfoScreen({super.key});

  @override
  State<SatelliteInfoScreen> createState() => _SatelliteInfoScreenState();
}

class _SatelliteInfoScreenState extends State<SatelliteInfoScreen> {
  final satelliteData = {
    "rise": {
      "alt": "string",
      "az": "string",
      "az_octant": "N",
      "utc_datetime": "2024-11-08T20:32:49.872Z",
      "utc_timestamp": 0,
      "is_sunlit": true,
      "visible": true
    },
    "culmination": {
      "alt": "string",
      "az": "string",
      "az_octant": "N",
      "utc_datetime": "2024-11-08T20:32:49.872Z",
      "utc_timestamp": 0,
      "is_sunlit": true,
      "visible": true
    },
    "set": {
      "alt": "string",
      "az": "string",
      "az_octant": "N",
      "utc_datetime": "2024-11-08T20:32:49.872Z",
      "utc_timestamp": 0,
      "is_sunlit": false,
      "visible": true
    },
    "visible": true
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Satellite Info'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.router.back();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.info),
            onPressed: () {
             context.router.push(const SatelliteOrbitRoute());
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildVisibleStatus(satelliteData['visible'] as bool),
            const Divider(),
            _buildPhaseInfo('Rise', satelliteData['rise'] as Map<String, dynamic>),
            const Divider(),
            _buildPhaseInfo('Culmination', satelliteData['culmination'] as Map<String, dynamic>),
            const Divider(),
            _buildPhaseInfo('Set', satelliteData['set'] as Map<String, dynamic>),
          ],
        ),
      ),
    );
  }

  Widget _buildVisibleStatus(bool isVisible) {
    return Row(
      children: [
        Text(
          'Visible: ${isVisible ? 'Yes' : 'No'}',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildPhaseInfo(String phaseName, Map<String, dynamic> phaseData) {
    return Column(
      children: [
        Text(
          phaseName,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)
        ),
        const SizedBox(height: 8),
        Text("Time: ${phaseData["utc_datetime"]}"),
        Text("Direction: ${phaseData["az_octant"]} (Azimuth: ${phaseData["az"]}°)"),
        Text("Altitude: ${phaseData["alt"]}°"),
        Row(
          children: [
            const Text("Sunlit: "),
            Icon(
              phaseData["is_sunlit"] ? Icons.wb_sunny : Icons.nightlight_round,
              color: phaseData["is_sunlit"] ? Colors.yellow : Colors.blueGrey,
            ),
          ],
        ),
      ],
    );
  }
}