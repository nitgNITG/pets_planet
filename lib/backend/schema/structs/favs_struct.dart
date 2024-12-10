// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FavsStruct extends FFFirebaseStruct {
  FavsStruct({
    PetStruct? pet,
    ProductStruct? product,
    int? id,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _pet = pet,
        _product = product,
        _id = id,
        super(firestoreUtilData);

  // "pet" field.
  PetStruct? _pet;
  PetStruct get pet => _pet ?? PetStruct();
  set pet(PetStruct? val) => _pet = val;

  void updatePet(Function(PetStruct) updateFn) {
    updateFn(_pet ??= PetStruct());
  }

  bool hasPet() => _pet != null;

  // "product" field.
  ProductStruct? _product;
  ProductStruct get product => _product ?? ProductStruct();
  set product(ProductStruct? val) => _product = val;

  void updateProduct(Function(ProductStruct) updateFn) {
    updateFn(_product ??= ProductStruct());
  }

  bool hasProduct() => _product != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  static FavsStruct fromMap(Map<String, dynamic> data) => FavsStruct(
        pet: PetStruct.maybeFromMap(data['pet']),
        product: ProductStruct.maybeFromMap(data['product']),
        id: castToType<int>(data['id']),
      );

  static FavsStruct? maybeFromMap(dynamic data) =>
      data is Map ? FavsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'pet': _pet?.toMap(),
        'product': _product?.toMap(),
        'id': _id,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'pet': serializeParam(
          _pet,
          ParamType.DataStruct,
        ),
        'product': serializeParam(
          _product,
          ParamType.DataStruct,
        ),
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
      }.withoutNulls;

  static FavsStruct fromSerializableMap(Map<String, dynamic> data) =>
      FavsStruct(
        pet: deserializeStructParam(
          data['pet'],
          ParamType.DataStruct,
          false,
          structBuilder: PetStruct.fromSerializableMap,
        ),
        product: deserializeStructParam(
          data['product'],
          ParamType.DataStruct,
          false,
          structBuilder: ProductStruct.fromSerializableMap,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'FavsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FavsStruct &&
        pet == other.pet &&
        product == other.product &&
        id == other.id;
  }

  @override
  int get hashCode => const ListEquality().hash([pet, product, id]);
}

FavsStruct createFavsStruct({
  PetStruct? pet,
  ProductStruct? product,
  int? id,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    FavsStruct(
      pet: pet ?? (clearUnsetFields ? PetStruct() : null),
      product: product ?? (clearUnsetFields ? ProductStruct() : null),
      id: id,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

FavsStruct? updateFavsStruct(
  FavsStruct? favs, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    favs
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addFavsStructData(
  Map<String, dynamic> firestoreData,
  FavsStruct? favs,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (favs == null) {
    return;
  }
  if (favs.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && favs.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final favsData = getFavsFirestoreData(favs, forFieldValue);
  final nestedData = favsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = favs.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getFavsFirestoreData(
  FavsStruct? favs, [
  bool forFieldValue = false,
]) {
  if (favs == null) {
    return {};
  }
  final firestoreData = mapToFirestore(favs.toMap());

  // Handle nested data for "pet" field.
  addPetStructData(
    firestoreData,
    favs.hasPet() ? favs.pet : null,
    'pet',
    forFieldValue,
  );

  // Handle nested data for "product" field.
  addProductStructData(
    firestoreData,
    favs.hasProduct() ? favs.product : null,
    'product',
    forFieldValue,
  );

  // Add any Firestore field values
  favs.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getFavsListFirestoreData(
  List<FavsStruct>? favss,
) =>
    favss?.map((e) => getFavsFirestoreData(e, true)).toList() ?? [];
