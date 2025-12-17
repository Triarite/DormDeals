import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatsRecord extends FirestoreRecord {
  ChatsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "lastMessage" field.
  String? _lastMessage;
  String get lastMessage => _lastMessage ?? '';
  bool hasLastMessage() => _lastMessage != null;

  // "LastMessageTime" field.
  DateTime? _lastMessageTime;
  DateTime? get lastMessageTime => _lastMessageTime;
  bool hasLastMessageTime() => _lastMessageTime != null;

  // "LastMessageSeenby" field.
  List<DocumentReference>? _lastMessageSeenby;
  List<DocumentReference> get lastMessageSeenby =>
      _lastMessageSeenby ?? const [];
  bool hasLastMessageSeenby() => _lastMessageSeenby != null;

  // "usernames" field.
  List<String>? _usernames;
  List<String> get usernames => _usernames ?? const [];
  bool hasUsernames() => _usernames != null;

  // "UserRef1_Chat" field.
  DocumentReference? _userRef1Chat;
  DocumentReference? get userRef1Chat => _userRef1Chat;
  bool hasUserRef1Chat() => _userRef1Chat != null;

  // "UserRef2_Chat" field.
  DocumentReference? _userRef2Chat;
  DocumentReference? get userRef2Chat => _userRef2Chat;
  bool hasUserRef2Chat() => _userRef2Chat != null;

  void _initializeFields() {
    _lastMessage = snapshotData['lastMessage'] as String?;
    _lastMessageTime = snapshotData['LastMessageTime'] as DateTime?;
    _lastMessageSeenby = getDataList(snapshotData['LastMessageSeenby']);
    _usernames = getDataList(snapshotData['usernames']);
    _userRef1Chat = snapshotData['UserRef1_Chat'] as DocumentReference?;
    _userRef2Chat = snapshotData['UserRef2_Chat'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Chats');

  static Stream<ChatsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatsRecord.fromSnapshot(s));

  static Future<ChatsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatsRecord.fromSnapshot(s));

  static ChatsRecord fromSnapshot(DocumentSnapshot snapshot) => ChatsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatsRecordData({
  String? lastMessage,
  DateTime? lastMessageTime,
  DocumentReference? userRef1Chat,
  DocumentReference? userRef2Chat,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'lastMessage': lastMessage,
      'LastMessageTime': lastMessageTime,
      'UserRef1_Chat': userRef1Chat,
      'UserRef2_Chat': userRef2Chat,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatsRecordDocumentEquality implements Equality<ChatsRecord> {
  const ChatsRecordDocumentEquality();

  @override
  bool equals(ChatsRecord? e1, ChatsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.lastMessage == e2?.lastMessage &&
        e1?.lastMessageTime == e2?.lastMessageTime &&
        listEquality.equals(e1?.lastMessageSeenby, e2?.lastMessageSeenby) &&
        listEquality.equals(e1?.usernames, e2?.usernames) &&
        e1?.userRef1Chat == e2?.userRef1Chat &&
        e1?.userRef2Chat == e2?.userRef2Chat;
  }

  @override
  int hash(ChatsRecord? e) => const ListEquality().hash([
        e?.lastMessage,
        e?.lastMessageTime,
        e?.lastMessageSeenby,
        e?.usernames,
        e?.userRef1Chat,
        e?.userRef2Chat
      ]);

  @override
  bool isValidKey(Object? o) => o is ChatsRecord;
}
