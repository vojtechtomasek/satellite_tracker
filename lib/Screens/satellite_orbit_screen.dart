import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SatelliteOrbitScreen extends StatefulWidget {
  const SatelliteOrbitScreen({super.key});

  @override
  State<SatelliteOrbitScreen> createState() => _SatelliteOrbitScreenState();
}

class _SatelliteOrbitScreenState extends State<SatelliteOrbitScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.router.back();
          },
        ),
      ),
      body: const Center(
        child: Text('Satellite Orbit Screen'),
      ),
    );
  }
}