import 'package:get_it/get_it.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'repositories/tasks_repository.dart';
import 'repositories/fake_tasks_repository.dart';
import 'services/api_client.dart';
import 'services/api_client_real.dart';
import 'services/api_client_mock.dart';
import 'usecases/fetch_tasks_usecase.dart';

final getIt = GetIt.instance;

Future<void> setupDependencies({bool useFake = false}) async {
  // Асинхронная инициализация (SharedPreferences)
  final prefs = await SharedPreferences.getInstance();
  if (!getIt.isRegistered<SharedPreferences>()) {
    getIt.registerSingleton<SharedPreferences>(prefs);
  }

  // Если уже зарегистрированы, удаляем — удобно для тестов/перезапуска
  if (getIt.isRegistered<ITasksRepository>()) {
    getIt.unregister<ITasksRepository>();
  }
  if (getIt.isRegistered<ApiClient>()) {
    getIt.unregister<ApiClient>();
  }
  if (getIt.isRegistered<FetchTasksUseCase>()) {
    getIt.unregister<FetchTasksUseCase>();
  }

  // Выбираем реализацию ApiClient по флагу сборки (release/debug)
  if (kReleaseMode) {
    getIt.registerLazySingleton<ApiClient>(() => ApiClientReal());
  } else {
    getIt.registerLazySingleton<ApiClient>(() => ApiClientMock());
  }

  // Регистрируем репозиторий (возможность переключать на Fake)
  if (useFake) {
    getIt.registerLazySingleton<ITasksRepository>(() => FakeTasksRepository());
  } else {
    // Если ваш TasksRepository требует ApiClient, он может взять его из get_it
    // Здесь предполагается, что TasksRepository имеет конструктор без параметров
    // или использует get_it внутри — при необходимости адаптируйте.
    getIt.registerLazySingleton<ITasksRepository>(() => TasksRepository());
  }

  // Регистрируем UseCase
  getIt.registerFactory<FetchTasksUseCase>(() => FetchTasksUseCase(getIt<ITasksRepository>()));
}
