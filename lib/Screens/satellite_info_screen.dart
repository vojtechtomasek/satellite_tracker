import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:satellite_tracker/routes/app_router.dart';

@RoutePage()
class SatelliteInfoScreen extends StatefulWidget {
  final String data;
  const SatelliteInfoScreen({required this.data});

  @override
  State<SatelliteInfoScreen> createState() => _SatelliteInfoScreenState();
}

class _SatelliteInfoScreenState extends State<SatelliteInfoScreen> {
  late List<Map<String, dynamic>> passes;

  @override
  void initState() {
    super.initState();
    List<dynamic> jsonList = jsonDecode(widget.data);
    passes = List<Map<String, dynamic>>.from(jsonList);
  }
  
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
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: passes.length,
        itemBuilder: (context, index) {
          final pass = passes[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pass ${index + 1}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 8),
                  if (pass['visible'] != null)
                    Text('Visible: ${pass['visible'] ? 'Yes' : 'No'}'),
                  if (pass['rise'] != null) ...[
                    const Divider(),
                    Text(
                      'Rise:',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    _buildPhaseInfo(pass['rise'] as Map<String, dynamic>),
                  ],
                  if (pass['culmination'] != null) ...[
                    const Divider(),
                    Text(
                      'Culmination:',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    _buildPhaseInfo(pass['culmination'] as Map<String, dynamic>),
                  ],
                  if (pass['set'] != null) ...[
                    const Divider(),
                    Text(
                      'Set:',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    _buildPhaseInfo(pass['set'] as Map<String, dynamic>),
                  ],
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildPhaseInfo(Map<String, dynamic> phaseData) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Time: ${phaseData["utc_datetime"]}'),
          Text('Altitude: ${phaseData["alt"]}°'),
          Text('Azimuth: ${phaseData["az"]}°'),
          Text('Direction: ${phaseData["az_octant"]}'),
          Row(
            children: [
              const Text('Sunlit: '),
              Icon(
                phaseData["is_sunlit"] ? Icons.wb_sunny : Icons.nightlight_round,
                color: phaseData["is_sunlit"] ? Colors.yellow : Colors.blueGrey,
              ),
            ],
          ),
          Row(
            children: [
              const Text('Visible: '),
              Text(phaseData["visible"] ? "Yes" : "No")
            ],
          )
        ],
      ),
    );
  }
}

// vracet ten json jako objekt do info_screen.dart
// jsondecoder možná přemístit do satellite_api.dart


// impeler
// flutter scene -> beta verze flutter SDK + beta verze dart SDK