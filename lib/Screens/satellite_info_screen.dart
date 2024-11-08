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
        actions: [
          IconButton(
            icon: const Icon(Icons.info),
            onPressed: () {
             context.router.push(const SatelliteOrbitRoute());
            },
          ),
        ],
      ),
      body: const Center(
        child: Text('Satellite Info Screen'),
      ),
    );
  }
}