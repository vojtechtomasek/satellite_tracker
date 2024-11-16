class SatellitePass {
  final bool visible;
  final Map<String, dynamic> rise;
  final Map<String, dynamic> culmination;
  final Map<String, dynamic> set;

  SatellitePass({
    required this.visible,
    required this.rise,
    required this.culmination,
    required this.set,
  });

  factory SatellitePass.fromJson(Map<String, dynamic> json) {
    return SatellitePass(
      visible: json['visible'] ?? false,
      rise: json['rise'] as Map<String, dynamic>,
      culmination: json['culmination'] as Map<String, dynamic>,
      set: json['set'] as Map<String, dynamic>,
    );
  }
}