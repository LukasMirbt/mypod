import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mypod_client/mypod_client.dart';
import 'package:mypod_flutter/note/cubit/cubit.dart';
import 'package:mypod_flutter/note/cubit/note_cubit.dart';
import 'package:mypod_flutter/note/note.dart';

class NotePage extends StatelessWidget {
  const NotePage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(
      builder: (_) => BlocProvider(
        create: (context) => NoteCubit(
          context.read<Client>(),
        )..load(),
        child: const NotePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Serverpod Codelab'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            NoteTextField(),
            SizedBox(height: 16),
            NoteList(),
          ],
        ),
      ),
    );
  }
}
