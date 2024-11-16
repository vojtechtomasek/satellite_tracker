import 'package:http/http.dart' as http;
import 'package:satellite_tracker/models/satellite_params.dart';

class SatelliteApi {
  final String _baseUrl = 'https://sat.terrestre.ar/passes';

// https://sat.terrestre.ar/passes/15544?lat=37&lon=-122&limit=100&days=7&visible_only=false
  Future<http.Response> getSatelliteData(SatelliteParams params) async {
    final url = Uri.parse(
     '$_baseUrl/${params.satelliteId}?lat=${params.latitude}&lon=${params.longitude}&limit=100&days=7&visible_only=${params.visibleOnly}' 
    );
    print('API URL: ${url.toString()}');

    return await http.get(url);
  }
}