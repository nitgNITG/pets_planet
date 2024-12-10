// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class PetStruct extends FFFirebaseStruct {
  PetStruct({
    int? id,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        super(firestoreUtilData);

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  static PetStruct fromMap(Map<String, dynamic> data) => PetStruct(
        id: castToType<int>(data['id']),
      );

  static PetStruct? maybeFromMap(dynamic data) =>
      data is Map ? PetStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
      }.withoutNulls;

  static PetStruct fromSerializableMap(Map<String, dynamic> data) => PetStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'PetStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PetStruct && id == other.id;
  }

  @override
  int get hashCode => const ListEquality().hash([id]);
}

PetStruct createPetStruct({
  int? id,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PetStruct(
      id: id,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PetStruct? updatePetStruct(
  PetStruct? pet, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    pet
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPetStructData(
  Map<String, dynamic> firestoreData,
  PetStruct? pet,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (pet == null) {
    return;
  }
  if (pet.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && pet.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final petData = getPetFirestoreData(pet, forFieldValue);
  final nestedData = petData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = pet.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPetFirestoreData(
  PetStruct? pet, [
  bool forFieldValue = false,
]) {
  if (pet == null) {
    return {};
  }
  final firestoreData = mapToFirestore(pet.toMap());

  // Add any Firestore field values
  pet.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPetListFirestoreData(
  List<PetStruct>? pets,
) =>
    pets?.map((e) => getPetFirestoreData(e, true)).toList() ?? [];
