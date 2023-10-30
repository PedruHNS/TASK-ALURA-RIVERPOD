import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProgressNivel extends ConsumerWidget {
  final int dificuldade;
  final int nivel;

  const ProgressNivel({
    required this.dificuldade,
    required this.nivel,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: 110,
      child: LinearProgressIndicator(
        backgroundColor: const Color.fromARGB(199, 255, 255, 255),
        color: const Color.fromARGB(255, 101, 77, 139),
        value: (dificuldade >= 0) ? (nivel / dificuldade) / 10 : 1,
      ),
    );
  }
}
