import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mypod_client/mypod_client.dart';
import 'package:mypod_flutter/note/cubit/note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit(this._client)
      : super(
          NoteState(
            list: NoteList(items: []),
          ),
        ) {
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
        list: state.list.copyWith(
          items: [...state.list.items, note],
        ),
      ),
    );
  }

  Future<void> delete(Note noteToDelete) async {
    await _client.note.delete(noteToDelete);

    emit(
      state.copyWith(
        list: state.list.copyWith(
          items: [
            for (final note in state.list.items)
              if (note != noteToDelete) note,
          ],
        ),
      ),
    );
  }
}
