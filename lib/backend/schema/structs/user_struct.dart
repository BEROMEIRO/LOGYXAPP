// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class UserStruct extends FFFirebaseStruct {
  UserStruct({
    String? uid,
    String? username,
    String? name,
    String? phone,
    String? email,
    String? codBase,
    String? documento,
    String? token,
    String? pwd,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _uid = uid,
        _username = username,
        _name = name,
        _phone = phone,
        _email = email,
        _codBase = codBase,
        _documento = documento,
        _token = token,
        _pwd = pwd,
        super(firestoreUtilData);

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  set uid(String? val) => _uid = val;

  bool hasUid() => _uid != null;

  // "username" field.
  String? _username;
  String get username => _username ?? '';
  set username(String? val) => _username = val;

  bool hasUsername() => _username != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "phone" field.
  String? _phone;
  String get phone => _phone ?? '';
  set phone(String? val) => _phone = val;

  bool hasPhone() => _phone != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

  // "cod_base" field.
  String? _codBase;
  String get codBase => _codBase ?? '';
  set codBase(String? val) => _codBase = val;

  bool hasCodBase() => _codBase != null;

  // "documento" field.
  String? _documento;
  String get documento => _documento ?? '';
  set documento(String? val) => _documento = val;

  bool hasDocumento() => _documento != null;

  // "TOKEN" field.
  String? _token;
  String get token => _token ?? '';
  set token(String? val) => _token = val;

  bool hasToken() => _token != null;

  // "pwd" field.
  String? _pwd;
  String get pwd => _pwd ?? '';
  set pwd(String? val) => _pwd = val;

  bool hasPwd() => _pwd != null;

  static UserStruct fromMap(Map<String, dynamic> data) => UserStruct(
        uid: data['uid'] as String?,
        username: data['username'] as String?,
        name: data['name'] as String?,
        phone: data['phone'] as String?,
        email: data['email'] as String?,
        codBase: data['cod_base'] as String?,
        documento: data['documento'] as String?,
        token: data['TOKEN'] as String?,
        pwd: data['pwd'] as String?,
      );

  static UserStruct? maybeFromMap(dynamic data) =>
      data is Map ? UserStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'uid': _uid,
        'username': _username,
        'name': _name,
        'phone': _phone,
        'email': _email,
        'cod_base': _codBase,
        'documento': _documento,
        'TOKEN': _token,
        'pwd': _pwd,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'uid': serializeParam(
          _uid,
          ParamType.String,
        ),
        'username': serializeParam(
          _username,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'phone': serializeParam(
          _phone,
          ParamType.String,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'cod_base': serializeParam(
          _codBase,
          ParamType.String,
        ),
        'documento': serializeParam(
          _documento,
          ParamType.String,
        ),
        'TOKEN': serializeParam(
          _token,
          ParamType.String,
        ),
        'pwd': serializeParam(
          _pwd,
          ParamType.String,
        ),
      }.withoutNulls;

  static UserStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserStruct(
        uid: deserializeParam(
          data['uid'],
          ParamType.String,
          false,
        ),
        username: deserializeParam(
          data['username'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        phone: deserializeParam(
          data['phone'],
          ParamType.String,
          false,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        codBase: deserializeParam(
          data['cod_base'],
          ParamType.String,
          false,
        ),
        documento: deserializeParam(
          data['documento'],
          ParamType.String,
          false,
        ),
        token: deserializeParam(
          data['TOKEN'],
          ParamType.String,
          false,
        ),
        pwd: deserializeParam(
          data['pwd'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'UserStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserStruct &&
        uid == other.uid &&
        username == other.username &&
        name == other.name &&
        phone == other.phone &&
        email == other.email &&
        codBase == other.codBase &&
        documento == other.documento &&
        token == other.token &&
        pwd == other.pwd;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [uid, username, name, phone, email, codBase, documento, token, pwd]);
}

UserStruct createUserStruct({
  String? uid,
  String? username,
  String? name,
  String? phone,
  String? email,
  String? codBase,
  String? documento,
  String? token,
  String? pwd,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserStruct(
      uid: uid,
      username: username,
      name: name,
      phone: phone,
      email: email,
      codBase: codBase,
      documento: documento,
      token: token,
      pwd: pwd,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserStruct? updateUserStruct(
  UserStruct? user, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    user
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserStructData(
  Map<String, dynamic> firestoreData,
  UserStruct? user,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (user == null) {
    return;
  }
  if (user.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && user.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userData = getUserFirestoreData(user, forFieldValue);
  final nestedData = userData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = user.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserFirestoreData(
  UserStruct? user, [
  bool forFieldValue = false,
]) {
  if (user == null) {
    return {};
  }
  final firestoreData = mapToFirestore(user.toMap());

  // Add any Firestore field values
  user.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserListFirestoreData(
  List<UserStruct>? users,
) =>
    users?.map((e) => getUserFirestoreData(e, true)).toList() ?? [];
