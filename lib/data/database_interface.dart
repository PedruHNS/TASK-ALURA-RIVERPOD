import 'package:app_task_alura/models/task.dart';

abstract interface class DatabaseInterface {
  Future<List<Task>> loadTodos();
  Future<void> savetask(Task task);
  Future<void> updateTask(Task task);
  Future<void> deleteTask(Task task);
}
