import '../models/task.dart';

abstract class ITasksRepository {
  Future<List<Task>> getTasks();
  Future<void> addTask(Task task);
  Future<void> deleteTask(int taskId);
}

class TasksRepository implements ITasksRepository {
  // Имитация сетевого запроса
  @override
  Future<List<Task>> getTasks() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      Task(id: 1, title: 'Learn Dart', isCompleted: true),
      Task(id: 2, title: 'Learn Flutter', isCompleted: true),
      Task(id: 3, title: 'Build an app', isCompleted: false),
    ];
  }

  @override
  Future<void> addTask(Task task) async {
    await Future.delayed(const Duration(milliseconds: 500));
    print('Added task: $task');
  }

  @override
  Future<void> deleteTask(int taskId) async {
    await Future.delayed(const Duration(milliseconds: 500));
    print('Deleted task with id: $taskId');
  }
}
