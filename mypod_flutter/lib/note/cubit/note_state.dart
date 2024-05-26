import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mypod_client/mypod_client.dart';

part 'note_state.freezed.dart';

@freezed
class NoteState with _$NoteState {
  const factory NoteState({
    required NoteList list,
    @Default('') String text,
  }) = _NoteState;

  factory NoteState.initial() => NoteState(
        list: NoteList(items: []),
      );
}
