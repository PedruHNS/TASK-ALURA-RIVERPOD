import 'package:app_task_alura/screens/home/components/filter/filter_state.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class FilterNivel extends ConsumerWidget {
  const FilterNivel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SegmentedButton(
        segments: const <ButtonSegment<FiltroDificuldade>>[
          ButtonSegment<FiltroDificuldade>(
            value: FiltroDificuldade.all,
            label: Icon(Icons.list_alt_outlined),
          ),
          ButtonSegment<FiltroDificuldade>(
              value: FiltroDificuldade.one, label: Text('1')),
          ButtonSegment<FiltroDificuldade>(
            value: FiltroDificuldade.two,
            label: Text('2'),
          ),
          ButtonSegment<FiltroDificuldade>(
            value: FiltroDificuldade.three,
            label: Text('3'),
          ),
          ButtonSegment<FiltroDificuldade>(
            value: FiltroDificuldade.four,
            label: Text('4'),
          ),
          ButtonSegment<FiltroDificuldade>(
            value: FiltroDificuldade.five,
            label: Text('5'),
          ),
        ],
        selected: <FiltroDificuldade>{ref.watch(filterProvider)},
        onSelectionChanged: (Set<FiltroDificuldade> p0) {
          ref.read(filterProvider.notifier).state = p0.first;
        },
      ),
    );
  }
}
