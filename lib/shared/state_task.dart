import 'package:app_task_alura/models/task.dart';

sealed class StateTodo {
  final List<Task> todos;

  StateTodo({required this.todos});
}

final class TodoStateInitial extends StateTodo {
  TodoStateInitial() : super(todos: <Task>[]);
}

final class TodoStateAdd extends StateTodo {
  TodoStateAdd({required super.todos});
}

final class TodoStateUpdate extends StateTodo {
  TodoStateUpdate({required super.todos});
}

final class TodoStateDelete extends StateTodo {
  TodoStateDelete({required super.todos});
}

final class TodoLoadState extends StateTodo {
  TodoLoadState({required super.todos});
}
