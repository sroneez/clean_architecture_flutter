import 'package:clean_architecture_flutter/features/weather/domain/entities/weather_entity.dart';
import 'package:clean_architecture_flutter/features/weather/domain/repositories/weather_repository.dart';
import 'package:get/get.dart';

class WeatherController extends GetxController {
  final WeatherRepository weatherRepository;

  WeatherController({required this.weatherRepository});

  final Rx<WeatherEntity?> weather = Rx<WeatherEntity?>(null);
  RxBool isLoading = false.obs;

  @override
  onInit() {
    super.onInit();
    fetchWeatherData(23.81, 90.41);
  }

  Future<void> fetchWeatherData(double lat, double long) async {
    isLoading.value = true;
    try {
      final result = await weatherRepository.getWeather(lat, long);
      weather.value = result;
    } catch (e) {
      Get.snackbar('Error', 'Could not load weather');
    } finally {
      isLoading.value = false;
    }
  }
}
