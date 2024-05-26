import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mypod_client/mypod_client.dart';
import 'package:mypod_flutter/note/cubit/cubit.dart';

class NoteListWidget extends StatelessWidget {
  const NoteListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final list = context.select(
      (NoteCubit cubit) => cubit.state.list,
    );

    return Column(
      children: [
        for (final note in list.items) _Item(note),
      ],
    );
  }
}

class _Item extends StatelessWidget {
  const _Item(this.note);

  final Note note;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(note.text),
      trailing: IconButton(
        icon: const Icon(Icons.close),
        onPressed: () {
          context.read<NoteCubit>().delete(note);
        },
      ),
    );
  }
}
