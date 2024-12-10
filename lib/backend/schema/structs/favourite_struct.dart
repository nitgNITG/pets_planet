// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FavouriteStruct extends FFFirebaseStruct {
  FavouriteStruct({
    String? message,
    List<FavsStruct>? favs,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _message = message,
        _favs = favs,
        super(firestoreUtilData);

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  set message(String? val) => _message = val;

  bool hasMessage() => _message != null;

  // "favs" field.
  List<FavsStruct>? _favs;
  List<FavsStruct> get favs => _favs ?? const [];
  set favs(List<FavsStruct>? val) => _favs = val;

  void updateFavs(Function(List<FavsStruct>) updateFn) {
    updateFn(_favs ??= []);
  }

  bool hasFavs() => _favs != null;

  static FavouriteStruct fromMap(Map<String, dynamic> data) => FavouriteStruct(
        message: data['message'] as String?,
        favs: getStructList(
          data['favs'],
          FavsStruct.fromMap,
        ),
      );

  static FavouriteStruct? maybeFromMap(dynamic data) => data is Map
      ? FavouriteStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'message': _message,
        'favs': _favs?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'message': serializeParam(
          _message,
          ParamType.String,
        ),
        'favs': serializeParam(
          _favs,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static FavouriteStruct fromSerializableMap(Map<String, dynamic> data) =>
      FavouriteStruct(
        message: deserializeParam(
          data['message'],
          ParamType.String,
          false,
        ),
        favs: deserializeStructParam<FavsStruct>(
          data['favs'],
          ParamType.DataStruct,
          true,
          structBuilder: FavsStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'FavouriteStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is FavouriteStruct &&
        message == other.message &&
        listEquality.equals(favs, other.favs);
  }

  @override
  int get hashCode => const ListEquality().hash([message, favs]);
}

FavouriteStruct createFavouriteStruct({
  String? message,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    FavouriteStruct(
      message: message,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

FavouriteStruct? updateFavouriteStruct(
  FavouriteStruct? favourite, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    favourite
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addFavouriteStructData(
  Map<String, dynamic> firestoreData,
  FavouriteStruct? favourite,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (favourite == null) {
    return;
  }
  if (favourite.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && favourite.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final favouriteData = getFavouriteFirestoreData(favourite, forFieldValue);
  final nestedData = favouriteData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = favourite.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getFavouriteFirestoreData(
  FavouriteStruct? favourite, [
  bool forFieldValue = false,
]) {
  if (favourite == null) {
    return {};
  }
  final firestoreData = mapToFirestore(favourite.toMap());

  // Add any Firestore field values
  favourite.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getFavouriteListFirestoreData(
  List<FavouriteStruct>? favourites,
) =>
    favourites?.map((e) => getFavouriteFirestoreData(e, true)).toList() ?? [];
