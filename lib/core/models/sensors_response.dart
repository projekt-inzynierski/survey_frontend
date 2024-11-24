class SensorsResponse {
  final double temperature;
  final double humidity;

  SensorsResponse({required this.temperature, required this.humidity});

  Map<String, dynamic> toJson() {
    return {
      'temperature': temperature,
      'humidity': humidity,
    };
  }

  factory SensorsResponse.fromJson(Map<String, dynamic> json) {
    return SensorsResponse(
      temperature: json['temperature'],
      humidity: json['humidity'],
    );
  }
}
