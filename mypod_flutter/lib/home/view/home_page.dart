import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mypod_client/mypod_client.dart';
import 'package:mypod_flutter/home/cubit/cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(
      builder: (_) => BlocProvider(
        create: (context) => HomeCubit(
          context.read<Client>(),
        ),
        child: const HomePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Serverpod Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: _TextField(),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: ElevatedButton(
                onPressed: context.read<HomeCubit>().hello,
                child: const Text('Send to Server'),
              ),
            ),
            const _ResultDisplay(),
          ],
        ),
      ),
    );
  }
}

class _TextField extends StatefulWidget {
  const _TextField();

  @override
  State<_TextField> createState() => _TextFieldState();
}

class _TextFieldState extends State<_TextField> {
  final _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _textEditingController,
      decoration: const InputDecoration(
        hintText: 'Enter your name',
      ),
    );
  }
}

class _ResultDisplay extends StatelessWidget {
  const _ResultDisplay();

  @override
  Widget build(BuildContext context) {
    final result = context.select(
      (HomeCubit cubit) => cubit.state.result,
    );

    String text;
    Color backgroundColor;

    if (result.isNotEmpty) {
      backgroundColor = Colors.green[300]!;
      text = result;
    } else {
      backgroundColor = Colors.grey[300]!;
      text = 'No server response yet.';
    }

    return Container(
      height: 50,
      color: backgroundColor,
      child: Center(
        child: Text(text),
      ),
    );
  }
}
