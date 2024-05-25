import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mypod_client/mypod_client.dart';

part 'note_state.freezed.dart';

@freezed
class NoteState with _$NoteState {
  const factory NoteState({
    @Default('') String text,
    @Default([]) List<Note> list,
  }) = _NoteState;
}
