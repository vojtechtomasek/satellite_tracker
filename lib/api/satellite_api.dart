import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/satellite_params.dart';
import '../models/satellite_pass.dart';

class SatelliteApi {
  final String _baseUrl = 'https://sat.terrestre.ar/passes';

  Future<List<SatellitePass>> getSatelliteData(SatelliteParams params) async {
    final url = Uri.parse(
      '$_baseUrl/${params.satelliteId}?lat=${params.latitude}&lon=${params.longitude}&limit=100&days=7&visible_only=${params.visibleOnly}'
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList.map((json) => SatellitePass.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load satellite data');
    }
  }
}