import 'package:clean_architecture_flutter/features/weather/domain/entities/weather_entity.dart';

class WeatherModel extends WeatherEntity {
  WeatherModel({
    required super.temperature,
    required super.windSpeed,
    required super.weatherCode,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    final current = json['current_weather'];

    return WeatherModel(
      temperature: current['temperature'],
      windSpeed: current['windspeed'],
      weatherCode: current['weathercode'],
    );
  }
}
