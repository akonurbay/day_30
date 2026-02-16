import 'package:get_it/get_it.dart';
import 'repositories/tasks_repository.dart';
import 'repositories/fake_tasks_repository.dart';

final getIt = GetIt.instance;

void setupDependencies({bool useFake = false}) {
  // Проверяем, была ли зависимость уже зарегистрирована
  if (getIt.isRegistered<ITasksRepository>()) {
    getIt.unregister<ITasksRepository>();
  }
  
  if (useFake) {
    getIt.registerLazySingleton<ITasksRepository>(
      () => FakeTasksRepository(),
    );
  } else {
    getIt.registerLazySingleton<ITasksRepository>(
      () => TasksRepository(),
    );
  }
}
