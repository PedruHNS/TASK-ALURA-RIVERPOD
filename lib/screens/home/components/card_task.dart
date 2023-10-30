import 'package:app_task_alura/screens/home/components/progress_level.dart';
import 'package:app_task_alura/screens/home/components/star.dart';
import 'package:app_task_alura/shared/image_task.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../models/task.dart';
import '../../../shared/task_provider.dart';

class CardTask extends ConsumerWidget {
  final Task task;
  const CardTask({required this.task, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        height: 140,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 181, 139, 248),
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 1,
              offset: Offset(1, 1),
              spreadRadius: 1,
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ImagemTask(url: task.imagem),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      task.titulo,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    DificuldadeTask(dificuldade: task.dificuldade),
                    const SizedBox(height: 10),
                    ProgressNivel(
                      dificuldade: task.dificuldade,
                      nivel: task.nivel,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  ref.read(taskProvider.notifier).increment(task.id);
                  
                },
                child: const Icon(Icons.arrow_drop_up_outlined),
              ),
            )
          ],
        ),
      ),
    );
  }
}
