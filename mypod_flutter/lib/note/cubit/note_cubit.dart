import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mypod_client/mypod_client.dart';
import 'package:mypod_flutter/note/cubit/note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit(this._client) : super(const NoteState());

  final Client _client;

  Future<void> load() async {
    final list = await _client.note.fetchAll();

    emit(
      state.copyWith(
        list: list,
      ),
    );
  }

  void onChanged(String text) {
    emit(
      state.copyWith(
        text: text,
      ),
    );
  }

  Future<void> add() async {
    final note = Note(text: state.text);

    await _client.note.create(note);

    emit(
      state.copyWith(
        list: [...state.list, note],
      ),
    );
  }

  Future<void> delete(Note noteToDelete) async {
    await _client.note.delete(noteToDelete);

    emit(
      state.copyWith(
        list: [
          for (final note in state.list)
            if (note != noteToDelete) note,
        ],
      ),
    );
  }
}
