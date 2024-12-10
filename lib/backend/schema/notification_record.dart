import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotificationRecord extends FirestoreRecord {
  NotificationRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "sendFrom" field.
  DocumentReference? _sendFrom;
  DocumentReference? get sendFrom => _sendFrom;
  bool hasSendFrom() => _sendFrom != null;

  // "SendTo" field.
  DocumentReference? _sendTo;
  DocumentReference? get sendTo => _sendTo;
  bool hasSendTo() => _sendTo != null;

  // "Descreption" field.
  String? _descreption;
  String get descreption => _descreption ?? '';
  bool hasDescreption() => _descreption != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  // "Title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "token" field.
  String? _token;
  String get token => _token ?? '';
  bool hasToken() => _token != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  bool hasId() => _id != null;

  // "orderid" field.
  int? _orderid;
  int get orderid => _orderid ?? 0;
  bool hasOrderid() => _orderid != null;

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "phone" field.
  String? _phone;
  String get phone => _phone ?? '';
  bool hasPhone() => _phone != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "createdAt" field.
  String? _createdAt;
  String get createdAt => _createdAt ?? '';
  bool hasCreatedAt() => _createdAt != null;

  void _initializeFields() {
    _sendFrom = snapshotData['sendFrom'] as DocumentReference?;
    _sendTo = snapshotData['SendTo'] as DocumentReference?;
    _descreption = snapshotData['Descreption'] as String?;
    _time = snapshotData['time'] as DateTime?;
    _title = snapshotData['Title'] as String?;
    _token = snapshotData['token'] as String?;
    _id = castToType<int>(snapshotData['id']);
    _orderid = castToType<int>(snapshotData['orderid']);
    _userId = snapshotData['userId'] as String?;
    _address = snapshotData['address'] as String?;
    _name = snapshotData['name'] as String?;
    _phone = snapshotData['phone'] as String?;
    _status = snapshotData['status'] as String?;
    _createdAt = snapshotData['createdAt'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Notification');

  static Stream<NotificationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotificationRecord.fromSnapshot(s));

  static Future<NotificationRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotificationRecord.fromSnapshot(s));

  static NotificationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NotificationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotificationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotificationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotificationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotificationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotificationRecordData({
  DocumentReference? sendFrom,
  DocumentReference? sendTo,
  String? descreption,
  DateTime? time,
  String? title,
  String? token,
  int? id,
  int? orderid,
  String? userId,
  String? address,
  String? name,
  String? phone,
  String? status,
  String? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'sendFrom': sendFrom,
      'SendTo': sendTo,
      'Descreption': descreption,
      'time': time,
      'Title': title,
      'token': token,
      'id': id,
      'orderid': orderid,
      'userId': userId,
      'address': address,
      'name': name,
      'phone': phone,
      'status': status,
      'createdAt': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotificationRecordDocumentEquality
    implements Equality<NotificationRecord> {
  const NotificationRecordDocumentEquality();

  @override
  bool equals(NotificationRecord? e1, NotificationRecord? e2) {
    return e1?.sendFrom == e2?.sendFrom &&
        e1?.sendTo == e2?.sendTo &&
        e1?.descreption == e2?.descreption &&
        e1?.time == e2?.time &&
        e1?.title == e2?.title &&
        e1?.token == e2?.token &&
        e1?.id == e2?.id &&
        e1?.orderid == e2?.orderid &&
        e1?.userId == e2?.userId &&
        e1?.address == e2?.address &&
        e1?.name == e2?.name &&
        e1?.phone == e2?.phone &&
        e1?.status == e2?.status &&
        e1?.createdAt == e2?.createdAt;
  }

  @override
  int hash(NotificationRecord? e) => const ListEquality().hash([
        e?.sendFrom,
        e?.sendTo,
        e?.descreption,
        e?.time,
        e?.title,
        e?.token,
        e?.id,
        e?.orderid,
        e?.userId,
        e?.address,
        e?.name,
        e?.phone,
        e?.status,
        e?.createdAt
      ]);

  @override
  bool isValidKey(Object? o) => o is NotificationRecord;
}
