import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../routes/app_router.dart';
import '../models/satellite_pass.dart';

@RoutePage()
class SatelliteInfoScreen extends StatelessWidget {
  final List<SatellitePass> passes;
  const SatelliteInfoScreen({required this.passes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Satellite Info'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.router.back(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.info),
            onPressed: () => context.router.push(const SatelliteOrbitRoute()),
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
              child: _buildPassInfo(context, pass, index),
            ),
          );
        },
      ),
    );
  }

  Widget _buildPassInfo(BuildContext context, SatellitePass pass, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Pass ${index + 1}',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 8),
        Text('Visible: ${pass.visible ? 'Yes' : 'No'}'),
        if (pass.rise.isNotEmpty) ...[
          const Divider(),
          Text(
            'Rise:',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          _buildPhaseInfo(pass.rise),
        ],
        if (pass.culmination.isNotEmpty) ...[
          const Divider(),
          Text(
            'Culmination:',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          _buildPhaseInfo(pass.culmination),
        ],
        if (pass.set.isNotEmpty) ...[
          const Divider(),
          Text(
            'Set:',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          _buildPhaseInfo(pass.set),
        ],
      ],
    );
  }

  Widget _buildPhaseInfo(Map<String, dynamic> phaseData) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 8.0),
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
                color: phaseData["is_sunlit"] ? Colors.amber : Colors.blueGrey,
              ),
            ],
          ),
        ],
      ),
    );
  }
}