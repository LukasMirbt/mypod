import 'package:mypod_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class NoteEndpoint extends Endpoint {
  Future<List<Note>> fetchAll(Session session) async {
    final noteList = await Note.db.find(
      session,
      orderBy: (t) => t.id,
    );
    return noteList;
  }

  Future<void> create(Session session, Note note) async {
    print('Creating note: ${note.text}');
    await Note.db.insertRow(session, note);
  }

  Future<void> delete(Session session, Note note) async {
    await Note.db.deleteRow(session, note);
  }
}
