// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductStruct extends FFFirebaseStruct {
  ProductStruct({
    int? id,
    int? price,
    String? name,
    List<String>? images,
    List<DiscountsStruct>? discounts,
    int? priceWithDiscount,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _price = price,
        _name = name,
        _images = images,
        _discounts = discounts,
        _priceWithDiscount = priceWithDiscount,
        super(firestoreUtilData);

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "price" field.
  int? _price;
  int get price => _price ?? 0;
  set price(int? val) => _price = val;

  void incrementPrice(int amount) => price = price + amount;

  bool hasPrice() => _price != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "images" field.
  List<String>? _images;
  List<String> get images => _images ?? const [];
  set images(List<String>? val) => _images = val;

  void updateImages(Function(List<String>) updateFn) {
    updateFn(_images ??= []);
  }

  bool hasImages() => _images != null;

  // "discounts" field.
  List<DiscountsStruct>? _discounts;
  List<DiscountsStruct> get discounts => _discounts ?? const [];
  set discounts(List<DiscountsStruct>? val) => _discounts = val;

  void updateDiscounts(Function(List<DiscountsStruct>) updateFn) {
    updateFn(_discounts ??= []);
  }

  bool hasDiscounts() => _discounts != null;

  // "priceWithDiscount" field.
  int? _priceWithDiscount;
  int get priceWithDiscount => _priceWithDiscount ?? 0;
  set priceWithDiscount(int? val) => _priceWithDiscount = val;

  void incrementPriceWithDiscount(int amount) =>
      priceWithDiscount = priceWithDiscount + amount;

  bool hasPriceWithDiscount() => _priceWithDiscount != null;

  static ProductStruct fromMap(Map<String, dynamic> data) => ProductStruct(
        id: castToType<int>(data['id']),
        price: castToType<int>(data['price']),
        name: data['name'] as String?,
        images: getDataList(data['images']),
        discounts: getStructList(
          data['discounts'],
          DiscountsStruct.fromMap,
        ),
        priceWithDiscount: castToType<int>(data['priceWithDiscount']),
      );

  static ProductStruct? maybeFromMap(dynamic data) =>
      data is Map ? ProductStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'price': _price,
        'name': _name,
        'images': _images,
        'discounts': _discounts?.map((e) => e.toMap()).toList(),
        'priceWithDiscount': _priceWithDiscount,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'price': serializeParam(
          _price,
          ParamType.int,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'images': serializeParam(
          _images,
          ParamType.String,
          isList: true,
        ),
        'discounts': serializeParam(
          _discounts,
          ParamType.DataStruct,
          isList: true,
        ),
        'priceWithDiscount': serializeParam(
          _priceWithDiscount,
          ParamType.int,
        ),
      }.withoutNulls;

  static ProductStruct fromSerializableMap(Map<String, dynamic> data) =>
      ProductStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        price: deserializeParam(
          data['price'],
          ParamType.int,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        images: deserializeParam<String>(
          data['images'],
          ParamType.String,
          true,
        ),
        discounts: deserializeStructParam<DiscountsStruct>(
          data['discounts'],
          ParamType.DataStruct,
          true,
          structBuilder: DiscountsStruct.fromSerializableMap,
        ),
        priceWithDiscount: deserializeParam(
          data['priceWithDiscount'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'ProductStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ProductStruct &&
        id == other.id &&
        price == other.price &&
        name == other.name &&
        listEquality.equals(images, other.images) &&
        listEquality.equals(discounts, other.discounts) &&
        priceWithDiscount == other.priceWithDiscount;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([id, price, name, images, discounts, priceWithDiscount]);
}

ProductStruct createProductStruct({
  int? id,
  int? price,
  String? name,
  int? priceWithDiscount,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ProductStruct(
      id: id,
      price: price,
      name: name,
      priceWithDiscount: priceWithDiscount,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ProductStruct? updateProductStruct(
  ProductStruct? product, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    product
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addProductStructData(
  Map<String, dynamic> firestoreData,
  ProductStruct? product,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (product == null) {
    return;
  }
  if (product.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && product.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final productData = getProductFirestoreData(product, forFieldValue);
  final nestedData = productData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = product.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getProductFirestoreData(
  ProductStruct? product, [
  bool forFieldValue = false,
]) {
  if (product == null) {
    return {};
  }
  final firestoreData = mapToFirestore(product.toMap());

  // Add any Firestore field values
  product.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getProductListFirestoreData(
  List<ProductStruct>? products,
) =>
    products?.map((e) => getProductFirestoreData(e, true)).toList() ?? [];
