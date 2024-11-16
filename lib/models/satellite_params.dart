class SatelliteParams {
  final int satelliteId;
  final double latitude;
  final double longitude;
  final bool visibleOnly;

  SatelliteParams({
    required this.satelliteId, 
    required this.latitude, 
    required this.longitude, 
    required this.visibleOnly
    });
}