import 'package:flutter/material.dart';
import 'di.dart';
import 'repositories/tasks_repository.dart';
import 'screens/tasks_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Асинхронная инициализация зависимостей перед runApp
  await setupDependencies();
  // Для использования FakeTasksRepository:
  // await setupDependencies(useFake: true);

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Передаём зависимость через фабрику TasksScreen.newWithLocator()
    return MaterialApp(
      home: TasksScreen.newWithLocator(),
    );
  }
}
