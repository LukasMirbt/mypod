import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mypod_client/mypod_client.dart';
import 'package:mypod_flutter/home/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.client) : super(const HomeState());

  final Client client;

  void changeText(String text) {
    emit(
      state.copyWith(
        text: text,
      ),
    );
  }

  Future<void> hello() async {
    final result = await client.example.hello(state.text);

    emit(
      state.copyWith(
        result: result,
      ),
    );
  }
}
