// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class OrdensAtendidasStruct extends FFFirebaseStruct {
  OrdensAtendidasStruct({
    int? id,
    String? os,
    String? status,
    String? conclusaoOperador,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _os = os,
        _status = status,
        _conclusaoOperador = conclusaoOperador,
        super(firestoreUtilData);

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "os" field.
  String? _os;
  String get os => _os ?? '';
  set os(String? val) => _os = val;

  bool hasOs() => _os != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  // "conclusao_operador" field.
  String? _conclusaoOperador;
  String get conclusaoOperador => _conclusaoOperador ?? '';
  set conclusaoOperador(String? val) => _conclusaoOperador = val;

  bool hasConclusaoOperador() => _conclusaoOperador != null;

  static OrdensAtendidasStruct fromMap(Map<String, dynamic> data) =>
      OrdensAtendidasStruct(
        id: castToType<int>(data['id']),
        os: data['os'] as String?,
        status: data['status'] as String?,
        conclusaoOperador: data['conclusao_operador'] as String?,
      );

  static OrdensAtendidasStruct? maybeFromMap(dynamic data) => data is Map
      ? OrdensAtendidasStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'os': _os,
        'status': _status,
        'conclusao_operador': _conclusaoOperador,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'os': serializeParam(
          _os,
          ParamType.String,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'conclusao_operador': serializeParam(
          _conclusaoOperador,
          ParamType.String,
        ),
      }.withoutNulls;

  static OrdensAtendidasStruct fromSerializableMap(Map<String, dynamic> data) =>
      OrdensAtendidasStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        os: deserializeParam(
          data['os'],
          ParamType.String,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        conclusaoOperador: deserializeParam(
          data['conclusao_operador'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'OrdensAtendidasStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is OrdensAtendidasStruct &&
        id == other.id &&
        os == other.os &&
        status == other.status &&
        conclusaoOperador == other.conclusaoOperador;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, os, status, conclusaoOperador]);
}

OrdensAtendidasStruct createOrdensAtendidasStruct({
  int? id,
  String? os,
  String? status,
  String? conclusaoOperador,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    OrdensAtendidasStruct(
      id: id,
      os: os,
      status: status,
      conclusaoOperador: conclusaoOperador,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

OrdensAtendidasStruct? updateOrdensAtendidasStruct(
  OrdensAtendidasStruct? ordensAtendidas, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    ordensAtendidas
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addOrdensAtendidasStructData(
  Map<String, dynamic> firestoreData,
  OrdensAtendidasStruct? ordensAtendidas,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (ordensAtendidas == null) {
    return;
  }
  if (ordensAtendidas.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && ordensAtendidas.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final ordensAtendidasData =
      getOrdensAtendidasFirestoreData(ordensAtendidas, forFieldValue);
  final nestedData =
      ordensAtendidasData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = ordensAtendidas.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getOrdensAtendidasFirestoreData(
  OrdensAtendidasStruct? ordensAtendidas, [
  bool forFieldValue = false,
]) {
  if (ordensAtendidas == null) {
    return {};
  }
  final firestoreData = mapToFirestore(ordensAtendidas.toMap());

  // Add any Firestore field values
  ordensAtendidas.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getOrdensAtendidasListFirestoreData(
  List<OrdensAtendidasStruct>? ordensAtendidass,
) =>
    ordensAtendidass
        ?.map((e) => getOrdensAtendidasFirestoreData(e, true))
        .toList() ??
    [];
