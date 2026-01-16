
import 'package:dio/dio.dart';

class AuthRepository {
  final String _baseUrl = "https://task.teamrabbil.com/api/v1";

  final Dio _dio = Dio();

  Future<String> login(String email, String password) async {
    try {
      final response = await _dio.post(
        "$_baseUrl/login",
        data: {'email': email, 'password': password},
      );
      if (response.statusCode == 200) {
        return response.data['token'];
      } else {
        throw Exception("Login Failed: Status ${response.statusCode}");
      }
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception(e.response?.data['status'] ?? "Unknown Error");
      } else {
        throw Exception("Connection Failed. Check internet.");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
