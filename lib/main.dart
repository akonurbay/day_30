import 'package:flutter/material.dart';
import 'di.dart';
import 'repositories/tasks_repository.dart';
import 'screens/tasks_screen.dart';

void main() {
  // Шаг 2: Вызываем setupDependencies() в main()
  setupDependencies();
  // Для использования FakeTasksRepository раскомментируйте строку ниже:
   //setupDependencies(useFake: true);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Получаем репозиторий из DI контейнера
    final repository = getIt<ITasksRepository>();
    
    return MaterialApp(
      home: TasksScreen(repository: repository),
    );
  }
}
