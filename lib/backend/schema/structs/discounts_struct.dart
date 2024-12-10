// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class DiscountsStruct extends FFFirebaseStruct {
  DiscountsStruct({
    int? discountPercentage,
    String? startDate,
    String? endDate,
    int? id,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _discountPercentage = discountPercentage,
        _startDate = startDate,
        _endDate = endDate,
        _id = id,
        super(firestoreUtilData);

  // "discountPercentage" field.
  int? _discountPercentage;
  int get discountPercentage => _discountPercentage ?? 0;
  set discountPercentage(int? val) => _discountPercentage = val;

  void incrementDiscountPercentage(int amount) =>
      discountPercentage = discountPercentage + amount;

  bool hasDiscountPercentage() => _discountPercentage != null;

  // "startDate" field.
  String? _startDate;
  String get startDate => _startDate ?? '';
  set startDate(String? val) => _startDate = val;

  bool hasStartDate() => _startDate != null;

  // "endDate" field.
  String? _endDate;
  String get endDate => _endDate ?? '';
  set endDate(String? val) => _endDate = val;

  bool hasEndDate() => _endDate != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  static DiscountsStruct fromMap(Map<String, dynamic> data) => DiscountsStruct(
        discountPercentage: castToType<int>(data['discountPercentage']),
        startDate: data['startDate'] as String?,
        endDate: data['endDate'] as String?,
        id: castToType<int>(data['id']),
      );

  static DiscountsStruct? maybeFromMap(dynamic data) => data is Map
      ? DiscountsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'discountPercentage': _discountPercentage,
        'startDate': _startDate,
        'endDate': _endDate,
        'id': _id,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'discountPercentage': serializeParam(
          _discountPercentage,
          ParamType.int,
        ),
        'startDate': serializeParam(
          _startDate,
          ParamType.String,
        ),
        'endDate': serializeParam(
          _endDate,
          ParamType.String,
        ),
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
      }.withoutNulls;

  static DiscountsStruct fromSerializableMap(Map<String, dynamic> data) =>
      DiscountsStruct(
        discountPercentage: deserializeParam(
          data['discountPercentage'],
          ParamType.int,
          false,
        ),
        startDate: deserializeParam(
          data['startDate'],
          ParamType.String,
          false,
        ),
        endDate: deserializeParam(
          data['endDate'],
          ParamType.String,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'DiscountsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DiscountsStruct &&
        discountPercentage == other.discountPercentage &&
        startDate == other.startDate &&
        endDate == other.endDate &&
        id == other.id;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([discountPercentage, startDate, endDate, id]);
}

DiscountsStruct createDiscountsStruct({
  int? discountPercentage,
  String? startDate,
  String? endDate,
  int? id,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DiscountsStruct(
      discountPercentage: discountPercentage,
      startDate: startDate,
      endDate: endDate,
      id: id,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DiscountsStruct? updateDiscountsStruct(
  DiscountsStruct? discounts, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    discounts
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDiscountsStructData(
  Map<String, dynamic> firestoreData,
  DiscountsStruct? discounts,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (discounts == null) {
    return;
  }
  if (discounts.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && discounts.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final discountsData = getDiscountsFirestoreData(discounts, forFieldValue);
  final nestedData = discountsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = discounts.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDiscountsFirestoreData(
  DiscountsStruct? discounts, [
  bool forFieldValue = false,
]) {
  if (discounts == null) {
    return {};
  }
  final firestoreData = mapToFirestore(discounts.toMap());

  // Add any Firestore field values
  discounts.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDiscountsListFirestoreData(
  List<DiscountsStruct>? discountss,
) =>
    discountss?.map((e) => getDiscountsFirestoreData(e, true)).toList() ?? [];
