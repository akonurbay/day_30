import '../models/task.dart';
import 'tasks_repository.dart';

class FakeTasksRepository implements ITasksRepository {
  @override
  Future<List<Task>> getTasks() async {
    // Возвращает фейковые данные без задержки
    return [
      Task(id: 1, title: 'Fake Task 1', isCompleted: false),
      Task(id: 2, title: 'Fake Task 2', isCompleted: true),
    ];
  }

  @override
  Future<void> addTask(Task task) async {
    print('Fake: Added task: $task');
  }

  @override
  Future<void> deleteTask(int taskId) async {
    print('Fake: Deleted task with id: $taskId');
  }
}
