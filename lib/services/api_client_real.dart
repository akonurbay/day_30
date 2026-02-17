import 'dart:async';
import 'api_client.dart';

class ApiClientReal implements ApiClient {
  @override
  Future<List<Map<String, dynamic>>> fetchRawTasks() async {
    // Здесь реальная логика запроса к серверу. Для примера — фиктивные данные.
    await Future.delayed(const Duration(milliseconds: 300));
    return [
      {'id': '1', 'title': 'Real Task 1', 'isCompleted': false},
      {'id': '2', 'title': 'Real Task 2', 'isCompleted': true},
    ];
  }
}