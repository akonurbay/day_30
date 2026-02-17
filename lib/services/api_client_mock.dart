import 'dart:async';
import 'api_client.dart';

class ApiClientMock implements ApiClient {
  @override
  Future<List<Map<String, dynamic>>> fetchRawTasks() async {
    await Future.delayed(const Duration(milliseconds: 10));
    return [
      {'id': 'm1', 'title': 'Mock Task A', 'isCompleted': false},
      {'id': 'm2', 'title': 'Mock Task B', 'isCompleted': true},
    ];
  }
}