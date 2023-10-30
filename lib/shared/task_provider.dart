import 'package:app_task_alura/data/database.dart';
import 'package:app_task_alura/data/database_interface.dart';
import 'package:app_task_alura/shared/state_task.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/task.dart';

final taskProvider = StateNotifierProvider<TaskNotifier, StateTodo>(
  (ref) {
    return TaskNotifier(repository: ref.watch(dataBaseProvider));
  },
);

class TaskNotifier extends StateNotifier<StateTodo> {
  final DatabaseInterface repository;

  TaskNotifier({required this.repository}) : super(TodoStateInitial());

  Future<void> loaded() async {
    final todos = await repository.loadTodos();

    state = TodoLoadState(todos: todos);
  }

  Future<void> addTask(Task task) async {
    await repository.savetask(task);

    state = TodoStateAdd(todos: [...state.todos, task]);
  }

  Future<void> increment(String id) async {
    final todos = state.todos;
    final taskIndex = todos.indexWhere((task) => task.id == id);
    if (taskIndex < 0) return;

    final task = todos[taskIndex];

    final incrementNew = task.copyWith(nivel: task.nivel + 1);
    
    final newList = [
      ...todos.sublist(0, taskIndex),
      incrementNew,
      ...todos.sublist(taskIndex + 1)
    ];

    await repository.updateTask(incrementNew);
    state = TodoStateUpdate(todos: newList);
  }

  Future<void> delete(String id) async {
    // .where pega somente as tasks que forem diferente do id passado
    final todos = state.todos;
    final taskIndex = todos.indexWhere((task) => task.id == id);
    final remove = todos[taskIndex];
    await repository.deleteTask(remove);

    final newList = [
      ...todos.sublist(0, taskIndex),
      ...todos.sublist(taskIndex + 1),
    ];

    state = TodoStateDelete(todos: newList);
  }
}
