import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EventTierRecord extends FirestoreRecord {
  EventTierRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _price = castToType<double>(snapshotData['price']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('eventTier')
          : FirebaseFirestore.instance.collectionGroup('eventTier');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('eventTier').doc();

  static Stream<EventTierRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EventTierRecord.fromSnapshot(s));

  static Future<EventTierRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EventTierRecord.fromSnapshot(s));

  static EventTierRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EventTierRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EventTierRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EventTierRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EventTierRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EventTierRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEventTierRecordData({
  String? name,
  double? price,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'price': price,
    }.withoutNulls,
  );

  return firestoreData;
}

class EventTierRecordDocumentEquality implements Equality<EventTierRecord> {
  const EventTierRecordDocumentEquality();

  @override
  bool equals(EventTierRecord? e1, EventTierRecord? e2) {
    return e1?.name == e2?.name && e1?.price == e2?.price;
  }

  @override
  int hash(EventTierRecord? e) =>
      const ListEquality().hash([e?.name, e?.price]);

  @override
  bool isValidKey(Object? o) => o is EventTierRecord;
}
