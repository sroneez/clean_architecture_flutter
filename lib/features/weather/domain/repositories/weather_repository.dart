import 'package:clean_architecture_flutter/features/weather/domain/entities/weather_entity.dart';

abstract class WeatherRepository {
  Future<WeatherEntity> getWeather(double lat, double long);
}
