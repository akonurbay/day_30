import '../repositories/tasks_repository.dart';
import '../models/task.dart';

class FetchTasksUseCase {
  final ITasksRepository repository;

  FetchTasksUseCase(this.repository);

  Future<List<Task>> execute() => repository.getTasks();
}