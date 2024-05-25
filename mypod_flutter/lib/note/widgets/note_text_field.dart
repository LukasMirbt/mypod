import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mypod_flutter/note/cubit/cubit.dart';

class NoteTextField extends StatefulWidget {
  const NoteTextField({super.key});

  @override
  State<NoteTextField> createState() => _NoteTextFieldState();
}

class _NoteTextFieldState extends State<NoteTextField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: const InputDecoration(
        hintText: 'Note',
      ),
      onChanged: context.read<NoteCubit>().onChanged,
      onSubmitted: (value) {
        context.read<NoteCubit>().add();
        _controller.clear();
      },
    );
  }
}
