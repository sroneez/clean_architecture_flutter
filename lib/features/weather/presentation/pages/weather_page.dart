import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/weather_controller.dart';

class WeatherPage extends StatelessWidget {
  // Find the controller
  final WeatherController controller = Get.find();

  WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dhaka Weather 🇧🇩")),
      body: Center(
        child: Obx(() {
          if (controller.isLoading.value) {
            return const CircularProgressIndicator();
          }

          if (controller.weather.value != null) {
            final data = controller.weather.value!;
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${data.temperature}°C",
                  style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),

                Text(
                  "Wind Speed: ${data.windSpeed} km/h",
                  style: const TextStyle(fontSize: 20),
                ),

                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () => controller.fetchWeatherData(23.81, 90.41),
                  child: const Text("Refresh"),
                )
              ],
            );
          }

          return const Text("No Data");
        }),
      ),
    );
  }
}