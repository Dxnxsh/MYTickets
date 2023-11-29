import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FavRecord extends FirestoreRecord {
  FavRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "isFav" field.
  bool? _isFav;
  bool get isFav => _isFav ?? false;
  bool hasIsFav() => _isFav != null;

  // "event" field.
  DocumentReference? _event;
  DocumentReference? get event => _event;
  bool hasEvent() => _event != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _isFav = snapshotData['isFav'] as bool?;
    _event = snapshotData['event'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('fav')
          : FirebaseFirestore.instance.collectionGroup('fav');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('fav').doc();

  static Stream<FavRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FavRecord.fromSnapshot(s));

  static Future<FavRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FavRecord.fromSnapshot(s));

  static FavRecord fromSnapshot(DocumentSnapshot snapshot) => FavRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FavRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FavRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FavRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FavRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFavRecordData({
  bool? isFav,
  DocumentReference? event,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'isFav': isFav,
      'event': event,
    }.withoutNulls,
  );

  return firestoreData;
}

class FavRecordDocumentEquality implements Equality<FavRecord> {
  const FavRecordDocumentEquality();

  @override
  bool equals(FavRecord? e1, FavRecord? e2) {
    return e1?.isFav == e2?.isFav && e1?.event == e2?.event;
  }

  @override
  int hash(FavRecord? e) => const ListEquality().hash([e?.isFav, e?.event]);

  @override
  bool isValidKey(Object? o) => o is FavRecord;
}
