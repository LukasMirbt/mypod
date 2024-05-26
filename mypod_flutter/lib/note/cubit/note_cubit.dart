import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mypod_client/mypod_client.dart';
import 'package:mypod_flutter/note/cubit/note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit(this._client) : super(NoteState.initial());

  final Client _client;

  Future<void> start() async {
    // TODO(User): Implement this
  }

  Future<void> add() async {
    // TODO(User): Implement this
  }

  Future<void> delete() async {
    // TODO(User): Implement this
  }

  void onTextChanged(String text) {
    emit(
      state.copyWith(
        text: text,
      ),
    );
  }
}
