import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mypod_client/mypod_client.dart';
import 'package:mypod_flutter/note/cubit/note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit(this._client) : super(NoteState.initial()) {
    _client.note.stream.listen(_onUpdated);
  }

  final Client _client;

  void _onUpdated(SerializableEntity list) {
    emit(
      state.copyWith(
        list: list as NoteList,
      ),
    );
  }

  Future<void> start() async {
    await _client.openStreamingConnection();

    final list = await _client.note.fetchAll();

    emit(
      state.copyWith(
        list: list,
      ),
    );
  }

  Future<void> add() async {
    final note = Note(text: state.text);
    final updatedList = await _client.note.create(note);

    emit(
      state.copyWith(
        list: updatedList,
      ),
    );
  }

  Future<void> delete(Note noteToDelete) async {
    final updatedList = await _client.note.delete(noteToDelete);

    emit(
      state.copyWith(
        list: updatedList,
      ),
    );
  }

  void onTextChanged(String text) {
    emit(
      state.copyWith(
        text: text,
      ),
    );
  }
}
