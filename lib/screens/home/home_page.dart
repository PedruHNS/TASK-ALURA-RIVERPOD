import 'package:app_task_alura/screens/home/components/card_task.dart';
import 'package:app_task_alura/screens/home/components/filter/filter.dart';
import 'package:app_task_alura/screens/home/components/filter/filter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../shared/task_provider.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    ref.read(taskProvider.notifier).loaded();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final listaTarefas = ref.watch(filterListTask);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 181, 139, 248),
        leading: Container(),
        title: const Text("App Task"),
      ),
      body: Column(
        children: [
          const FilterNivel(),
          Expanded(
            child: ListView.builder(
              itemCount: listaTarefas.length,
              itemBuilder: (_, index) {
                final item = listaTarefas[index];
                return Dismissible(
                  key: Key('TASK${item.id}'),
                  onDismissed: (direction) {
                    ref.read(taskProvider.notifier).delete(item.id);
                  },
                  child: CardTask(
                    task: item,
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.of(context).pushNamed("/addTask");
      }),
    );
  }
}
