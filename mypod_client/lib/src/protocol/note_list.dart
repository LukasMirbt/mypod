/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'protocol.dart' as _i2;

abstract class NoteList implements _i1.SerializableModel {
  NoteList._({required this.items});

  factory NoteList({required List<_i2.Note> items}) = _NoteListImpl;

  factory NoteList.fromJson(Map<String, dynamic> jsonSerialization) {
    return NoteList(
        items: (jsonSerialization['items'] as List)
            .map((e) => _i2.Note.fromJson((e as Map<String, dynamic>)))
            .toList());
  }

  List<_i2.Note> items;

  NoteList copyWith({List<_i2.Note>? items});
  @override
  Map<String, dynamic> toJson() {
    return {'items': items.toJson(valueToJson: (v) => v.toJson())};
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _NoteListImpl extends NoteList {
  _NoteListImpl({required List<_i2.Note> items}) : super._(items: items);

  @override
  NoteList copyWith({List<_i2.Note>? items}) {
    return NoteList(items: items ?? this.items.clone());
  }
}
