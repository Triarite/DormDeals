import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductsRecord extends FirestoreRecord {
  ProductsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "owner_uid" field.
  String? _ownerUid;
  String get ownerUid => _ownerUid ?? '';
  bool hasOwnerUid() => _ownerUid != null;

  // "owner_ref" field.
  DocumentReference? _ownerRef;
  DocumentReference? get ownerRef => _ownerRef;
  bool hasOwnerRef() => _ownerRef != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "isSold" field.
  bool? _isSold;
  bool get isSold => _isSold ?? false;
  bool hasIsSold() => _isSold != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _price = castToType<double>(snapshotData['price']);
    _description = snapshotData['description'] as String?;
    _ownerUid = snapshotData['owner_uid'] as String?;
    _ownerRef = snapshotData['owner_ref'] as DocumentReference?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _image = snapshotData['image'] as String?;
    _category = snapshotData['category'] as String?;
    _isSold = snapshotData['isSold'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('products');

  static Stream<ProductsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProductsRecord.fromSnapshot(s));

  static Future<ProductsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProductsRecord.fromSnapshot(s));

  static ProductsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProductsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProductsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProductsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProductsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProductsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProductsRecordData({
  String? title,
  double? price,
  String? description,
  String? ownerUid,
  DocumentReference? ownerRef,
  DateTime? createdAt,
  String? image,
  String? category,
  bool? isSold,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'price': price,
      'description': description,
      'owner_uid': ownerUid,
      'owner_ref': ownerRef,
      'created_at': createdAt,
      'image': image,
      'category': category,
      'isSold': isSold,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProductsRecordDocumentEquality implements Equality<ProductsRecord> {
  const ProductsRecordDocumentEquality();

  @override
  bool equals(ProductsRecord? e1, ProductsRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.price == e2?.price &&
        e1?.description == e2?.description &&
        e1?.ownerUid == e2?.ownerUid &&
        e1?.ownerRef == e2?.ownerRef &&
        e1?.createdAt == e2?.createdAt &&
        e1?.image == e2?.image &&
        e1?.category == e2?.category &&
        e1?.isSold == e2?.isSold;
  }

  @override
  int hash(ProductsRecord? e) => const ListEquality().hash([
        e?.title,
        e?.price,
        e?.description,
        e?.ownerUid,
        e?.ownerRef,
        e?.createdAt,
        e?.image,
        e?.category,
        e?.isSold
      ]);

  @override
  bool isValidKey(Object? o) => o is ProductsRecord;
}
