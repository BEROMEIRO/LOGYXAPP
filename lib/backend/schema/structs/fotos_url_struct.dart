// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class FotosUrlStruct extends FFFirebaseStruct {
  FotosUrlStruct({
    String? photoUrl,
    String? photos,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _photoUrl = photoUrl,
        _photos = photos,
        super(firestoreUtilData);

  // "photoUrl" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  set photoUrl(String? val) => _photoUrl = val;

  bool hasPhotoUrl() => _photoUrl != null;

  // "photos" field.
  String? _photos;
  String get photos => _photos ?? '';
  set photos(String? val) => _photos = val;

  bool hasPhotos() => _photos != null;

  static FotosUrlStruct fromMap(Map<String, dynamic> data) => FotosUrlStruct(
        photoUrl: data['photoUrl'] as String?,
        photos: data['photos'] as String?,
      );

  static FotosUrlStruct? maybeFromMap(dynamic data) =>
      data is Map ? FotosUrlStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'photoUrl': _photoUrl,
        'photos': _photos,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'photoUrl': serializeParam(
          _photoUrl,
          ParamType.String,
        ),
        'photos': serializeParam(
          _photos,
          ParamType.String,
        ),
      }.withoutNulls;

  static FotosUrlStruct fromSerializableMap(Map<String, dynamic> data) =>
      FotosUrlStruct(
        photoUrl: deserializeParam(
          data['photoUrl'],
          ParamType.String,
          false,
        ),
        photos: deserializeParam(
          data['photos'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'FotosUrlStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FotosUrlStruct &&
        photoUrl == other.photoUrl &&
        photos == other.photos;
  }

  @override
  int get hashCode => const ListEquality().hash([photoUrl, photos]);
}

FotosUrlStruct createFotosUrlStruct({
  String? photoUrl,
  String? photos,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    FotosUrlStruct(
      photoUrl: photoUrl,
      photos: photos,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

FotosUrlStruct? updateFotosUrlStruct(
  FotosUrlStruct? fotosUrl, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    fotosUrl
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addFotosUrlStructData(
  Map<String, dynamic> firestoreData,
  FotosUrlStruct? fotosUrl,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (fotosUrl == null) {
    return;
  }
  if (fotosUrl.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && fotosUrl.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final fotosUrlData = getFotosUrlFirestoreData(fotosUrl, forFieldValue);
  final nestedData = fotosUrlData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = fotosUrl.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getFotosUrlFirestoreData(
  FotosUrlStruct? fotosUrl, [
  bool forFieldValue = false,
]) {
  if (fotosUrl == null) {
    return {};
  }
  final firestoreData = mapToFirestore(fotosUrl.toMap());

  // Add any Firestore field values
  fotosUrl.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getFotosUrlListFirestoreData(
  List<FotosUrlStruct>? fotosUrls,
) =>
    fotosUrls?.map((e) => getFotosUrlFirestoreData(e, true)).toList() ?? [];
