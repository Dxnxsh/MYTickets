import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CartRecord extends FirestoreRecord {
  CartRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "seat" field.
  DocumentReference? _seat;
  DocumentReference? get seat => _seat;
  bool hasSeat() => _seat != null;

  // "isConfirmed" field.
  bool? _isConfirmed;
  bool get isConfirmed => _isConfirmed ?? false;
  bool hasIsConfirmed() => _isConfirmed != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _seat = snapshotData['seat'] as DocumentReference?;
    _isConfirmed = snapshotData['isConfirmed'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('cart')
          : FirebaseFirestore.instance.collectionGroup('cart');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('cart').doc();

  static Stream<CartRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CartRecord.fromSnapshot(s));

  static Future<CartRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CartRecord.fromSnapshot(s));

  static CartRecord fromSnapshot(DocumentSnapshot snapshot) => CartRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CartRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CartRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CartRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CartRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCartRecordData({
  DocumentReference? seat,
  bool? isConfirmed,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'seat': seat,
      'isConfirmed': isConfirmed,
    }.withoutNulls,
  );

  return firestoreData;
}

class CartRecordDocumentEquality implements Equality<CartRecord> {
  const CartRecordDocumentEquality();

  @override
  bool equals(CartRecord? e1, CartRecord? e2) {
    return e1?.seat == e2?.seat && e1?.isConfirmed == e2?.isConfirmed;
  }

  @override
  int hash(CartRecord? e) =>
      const ListEquality().hash([e?.seat, e?.isConfirmed]);

  @override
  bool isValidKey(Object? o) => o is CartRecord;
}
