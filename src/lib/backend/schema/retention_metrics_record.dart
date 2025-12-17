import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RetentionMetricsRecord extends FirestoreRecord {
  RetentionMetricsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "firstLogin" field.
  DateTime? _firstLogin;
  DateTime? get firstLogin => _firstLogin;
  bool hasFirstLogin() => _firstLogin != null;

  // "lastLogin" field.
  DateTime? _lastLogin;
  DateTime? get lastLogin => _lastLogin;
  bool hasLastLogin() => _lastLogin != null;

  // "userEmail" field.
  String? _userEmail;
  String get userEmail => _userEmail ?? '';
  bool hasUserEmail() => _userEmail != null;

  // "day_1" field.
  bool? _day1;
  bool get day1 => _day1 ?? false;
  bool hasDay1() => _day1 != null;

  // "day_7" field.
  bool? _day7;
  bool get day7 => _day7 ?? false;
  bool hasDay7() => _day7 != null;

  // "day_30" field.
  bool? _day30;
  bool get day30 => _day30 ?? false;
  bool hasDay30() => _day30 != null;

  void _initializeFields() {
    _firstLogin = snapshotData['firstLogin'] as DateTime?;
    _lastLogin = snapshotData['lastLogin'] as DateTime?;
    _userEmail = snapshotData['userEmail'] as String?;
    _day1 = snapshotData['day_1'] as bool?;
    _day7 = snapshotData['day_7'] as bool?;
    _day30 = snapshotData['day_30'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('retention_metrics');

  static Stream<RetentionMetricsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RetentionMetricsRecord.fromSnapshot(s));

  static Future<RetentionMetricsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => RetentionMetricsRecord.fromSnapshot(s));

  static RetentionMetricsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RetentionMetricsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RetentionMetricsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RetentionMetricsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RetentionMetricsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RetentionMetricsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRetentionMetricsRecordData({
  DateTime? firstLogin,
  DateTime? lastLogin,
  String? userEmail,
  bool? day1,
  bool? day7,
  bool? day30,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'firstLogin': firstLogin,
      'lastLogin': lastLogin,
      'userEmail': userEmail,
      'day_1': day1,
      'day_7': day7,
      'day_30': day30,
    }.withoutNulls,
  );

  return firestoreData;
}

class RetentionMetricsRecordDocumentEquality
    implements Equality<RetentionMetricsRecord> {
  const RetentionMetricsRecordDocumentEquality();

  @override
  bool equals(RetentionMetricsRecord? e1, RetentionMetricsRecord? e2) {
    return e1?.firstLogin == e2?.firstLogin &&
        e1?.lastLogin == e2?.lastLogin &&
        e1?.userEmail == e2?.userEmail &&
        e1?.day1 == e2?.day1 &&
        e1?.day7 == e2?.day7 &&
        e1?.day30 == e2?.day30;
  }

  @override
  int hash(RetentionMetricsRecord? e) => const ListEquality().hash(
      [e?.firstLogin, e?.lastLogin, e?.userEmail, e?.day1, e?.day7, e?.day30]);

  @override
  bool isValidKey(Object? o) => o is RetentionMetricsRecord;
}
