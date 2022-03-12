import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_bloc/core/services/network_info.dart';
import 'package:todo_bloc/features/todo_pomodoro/data/datasources/local_data_source.dart';
import 'package:todo_bloc/features/todo_pomodoro/data/repositories/todo_repository_impl.dart';
import 'package:todo_bloc/features/todo_pomodoro/domain/repositories/todo_repository.dart';
import 'package:todo_bloc/features/todo_pomodoro/domain/usecases/add_todo.dart';
import 'package:todo_bloc/features/todo_pomodoro/presentation/bloc/todo_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => TodoBloc(
        addTodoUseCase: sl(),
      ));

  // ! Domain - Use cases
  sl.registerLazySingleton(() => AddTodoUseCase(repository: sl()));
  // ! Repository
  sl.registerLazySingleton<TodoRepository>(() => TodoRepositoryImpl(
        localDataSource: sl(),
      
      ));
  //Data Sources
  sl.registerLazySingleton<TodoLocalDataSource>(
    () => TodoLocalDataSourceImpl(sharedPreferences: sl()),
  );

  // ? External
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}
