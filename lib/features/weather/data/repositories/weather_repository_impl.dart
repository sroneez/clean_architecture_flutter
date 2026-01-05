import 'dart:convert';

import 'package:clean_architecture_flutter/features/weather/data/models/weather_model.dart';
import 'package:clean_architecture_flutter/features/weather/domain/entities/weather_entity.dart';
import 'package:clean_architecture_flutter/features/weather/domain/repositories/weather_repository.dart';
import 'package:http/http.dart' as http;

class WeatherRepositoryImpl implements WeatherRepository {
  @override
  Future<WeatherEntity> getWeather(double lat, double long) async {
    final String baseUrl =
        "https://api.open-meteo.com/v1/forecast?latitude=$lat&longitude=$long&current_weather=true";

    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return WeatherModel.fromJson(data);
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
