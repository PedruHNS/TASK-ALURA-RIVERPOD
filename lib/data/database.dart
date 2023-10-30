import 'package:app_task_alura/data/database_interface.dart';
import 'package:app_task_alura/models/task.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final dataBaseProvider = Provider<DatabaseInterface>((ref) => Database());

class Database implements DatabaseInterface {
  @override
  Future<void> deleteTask(Task task) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(task.id);
  }

  @override
  Future<List<Task>> loadTodos() async {
    final prefs = await SharedPreferences.getInstance();
    final keys = prefs.getKeys();

    return keys
        // fas um map na lista de keys pegando a key e apresentando o value
        .map((key) => prefs.getString(key))
        //faz um where validando se o value é null
        .where((element) => element != null)
        //faz um cast pra setar o valor do value como String
        .cast<String>()
        //aqui eu faço um novo map dessa vez transformando o value da key  em um objeto task
        .map<Task>(Task.fromJson)
        //por fim transformo o iterable de objeto Task em lista
        .toList();
  }

  @override
  Future<void> savetask(Task task) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(task.id, task.toJson());
  }

  @override
  Future<void> updateTask(Task task) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(task.id, task.toJson());
  
  }
}
