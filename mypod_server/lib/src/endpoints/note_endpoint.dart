import 'package:mypod_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class NoteEndpoint extends Endpoint {
  static const _noteChannel = 'noteChannel';

  @override
  bool get requireLogin => true;

  @override
  Future<void> streamOpened(StreamingSession session) async {
    session.messages.addListener(
      _noteChannel,
      (message) {
        sendStreamMessage(session, message);
      },
    );
  }

  Future<NoteList> fetchAll(Session session) async {
    final items = await Note.db.find(
      session,
      orderBy: (t) => t.id,
    );
    final noteList = NoteList(items: items);
    session.messages.postMessage(_noteChannel, noteList);
    return noteList;
  }

  Future<NoteList> create(Session session, Note note) async {
    await Note.db.insertRow(session, note);
    final noteList = await fetchAll(session);
    return noteList;
  }

  Future<NoteList> delete(Session session, Note note) async {
    await Note.db.deleteRow(session, note);
    final noteList = await fetchAll(session);
    return noteList;
  }
}
