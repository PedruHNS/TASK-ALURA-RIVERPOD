
import 'package:app_task_alura/shared/task_provider.dart';
import'package:flutter_riverpod/flutter_riverpod.dart';
enum FiltroDificuldade {
  all,
  one,
  two,
  three,
  four,
  five;
}

final filterProvider = StateProvider(((ref) => FiltroDificuldade.all));

final filterListTask = Provider((ref) {
  final filtro = ref.watch(filterProvider);
  final task = ref.watch(taskProvider);
  final todos = task.todos;

  return switch (filtro) {
    FiltroDificuldade.all => todos,
    FiltroDificuldade.one =>
      todos.where((task) => task.dificuldade == 1).toList(),
    FiltroDificuldade.two =>
      todos.where((task) => task.dificuldade == 2).toList(),
    FiltroDificuldade.three =>
      todos.where((task) => task.dificuldade == 3).toList(),
    FiltroDificuldade.four =>
      todos.where((task) => task.dificuldade == 4).toList(),
    FiltroDificuldade.five =>
      todos.where((task) => task.dificuldade == 5).toList(),
  };
});