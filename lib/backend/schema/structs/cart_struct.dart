// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CartStruct extends FFFirebaseStruct {
  CartStruct({
    DocumentReference? evT,
    double? price,
    bool? isConfirmed,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _evT = evT,
        _price = price,
        _isConfirmed = isConfirmed,
        super(firestoreUtilData);

  // "EvT" field.
  DocumentReference? _evT;
  DocumentReference? get evT => _evT;
  set evT(DocumentReference? val) => _evT = val;
  bool hasEvT() => _evT != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  set price(double? val) => _price = val;
  void incrementPrice(double amount) => _price = price + amount;
  bool hasPrice() => _price != null;

  // "isConfirmed" field.
  bool? _isConfirmed;
  bool get isConfirmed => _isConfirmed ?? false;
  set isConfirmed(bool? val) => _isConfirmed = val;
  bool hasIsConfirmed() => _isConfirmed != null;

  static CartStruct fromMap(Map<String, dynamic> data) => CartStruct(
        evT: data['EvT'] as DocumentReference?,
        price: castToType<double>(data['price']),
        isConfirmed: data['isConfirmed'] as bool?,
      );

  static CartStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? CartStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'EvT': _evT,
        'price': _price,
        'isConfirmed': _isConfirmed,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'EvT': serializeParam(
          _evT,
          ParamType.DocumentReference,
        ),
        'price': serializeParam(
          _price,
          ParamType.double,
        ),
        'isConfirmed': serializeParam(
          _isConfirmed,
          ParamType.bool,
        ),
      }.withoutNulls;

  static CartStruct fromSerializableMap(Map<String, dynamic> data) =>
      CartStruct(
        evT: deserializeParam(
          data['EvT'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['events', 'eventTier'],
        ),
        price: deserializeParam(
          data['price'],
          ParamType.double,
          false,
        ),
        isConfirmed: deserializeParam(
          data['isConfirmed'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'CartStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CartStruct &&
        evT == other.evT &&
        price == other.price &&
        isConfirmed == other.isConfirmed;
  }

  @override
  int get hashCode => const ListEquality().hash([evT, price, isConfirmed]);
}

CartStruct createCartStruct({
  DocumentReference? evT,
  double? price,
  bool? isConfirmed,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CartStruct(
      evT: evT,
      price: price,
      isConfirmed: isConfirmed,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CartStruct? updateCartStruct(
  CartStruct? cart, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    cart
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCartStructData(
  Map<String, dynamic> firestoreData,
  CartStruct? cart,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (cart == null) {
    return;
  }
  if (cart.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && cart.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final cartData = getCartFirestoreData(cart, forFieldValue);
  final nestedData = cartData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = cart.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCartFirestoreData(
  CartStruct? cart, [
  bool forFieldValue = false,
]) {
  if (cart == null) {
    return {};
  }
  final firestoreData = mapToFirestore(cart.toMap());

  // Add any Firestore field values
  cart.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCartListFirestoreData(
  List<CartStruct>? carts,
) =>
    carts?.map((e) => getCartFirestoreData(e, true)).toList() ?? [];
