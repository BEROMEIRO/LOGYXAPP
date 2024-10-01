import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'schema/util/firestore_util.dart';
import 'schema/users_record.dart';

// Importações necessárias
export 'dart:async' show StreamSubscription;
export 'package:cloud_firestore/cloud_firestore.dart' hide Order;
export 'package:firebase_core/firebase_core.dart';
export 'schema/index.dart';
export 'schema/util/firestore_util.dart';
export 'schema/util/schema_util.dart';
export 'schema/users_record.dart';

// Classe para gerenciar logs
class Logger {
  void error(String context, String message) {
    // Aqui você pode implementar a lógica para armazenar logs
    // Por exemplo, em um arquivo, banco de dados, ou apenas exibir no console
    if (kDebugMode) {
      print('[$context] ERROR: $message');
    } // Descomente se quiser ver no console
  }
}

final logger = Logger();

/// Funções para consultar registros de usuários (como um Stream e como um Future).
Future<int> queryUsersRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) async {
  return queryCollectionCount(
    UsersRecord.collection,
    queryBuilder: queryBuilder,
    limit: limit,
  );
}

Stream<List<UsersRecord>> queryUsersRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) {
  return queryCollection(
    UsersRecord.collection,
    UsersRecord.fromSnapshot,
    queryBuilder: queryBuilder,
    limit: limit,
    singleRecord: singleRecord,
  );
}

Future<List<UsersRecord>> queryUsersRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) async {
  return queryCollectionOnce(
    UsersRecord.collection,
    UsersRecord.fromSnapshot,
    queryBuilder: queryBuilder,
    limit: limit,
    singleRecord: singleRecord,
  );
}

Future<int> queryCollectionCount(
  Query collection, {
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) async {
  final builder = queryBuilder ?? (q) => q;
  var query = builder(collection);
  if (limit > 0) {
    query = query.limit(limit);
  }

  try {
    final value = await query.count().get();
    return value.count ?? 0; // Retorna 0 se count for nulo
  } catch (err) {
    logger.error('queryCollectionCount', 'Erro ao contar documentos: $err');
    return 0; // Retorne um valor padrão em caso de erro
  }
}

Stream<List<T>> queryCollection<T>(
  Query collection,
  RecordBuilder<T> recordBuilder, {
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) {
  final builder = queryBuilder ?? (q) => q;
  var query = builder(collection);
  if (limit > 0 || singleRecord) {
    query = query.limit(singleRecord ? 1 : limit);
  }

  return query.snapshots().handleError((err) {
    logger.error('queryCollection', 'Erro ao consultar $collection: $err');
  }).map((s) {
    return s.docs
        .map((d) => safeGet(
              () => recordBuilder(d),
              (e) => logger.error('queryCollection',
                  'Erro ao serializar doc ${d.reference.path}:\n$e'),
            ))
        .where((d) => d != null)
        .map((d) => d!)
        .toList();
  });
}

Future<List<T>> queryCollectionOnce<T>(
  Query collection,
  RecordBuilder<T> recordBuilder, {
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) async {
  final builder = queryBuilder ?? (q) => q;
  var query = builder(collection);
  if (limit > 0 || singleRecord) {
    query = query.limit(singleRecord ? 1 : limit);
  }

  try {
    final s = await query.get();
    return s.docs
        .map((d) => safeGet(
              () => recordBuilder(d),
              (e) => logger.error('queryCollectionOnce',
                  'Erro ao serializar doc ${d.reference.path}:\n$e'),
            ))
        .where((d) => d != null)
        .map((d) => d!)
        .toList();
  } catch (err) {
    logger.error(
        'queryCollectionOnce', 'Erro ao consultar documentos uma vez: $err');
    return []; // Retorna uma lista vazia em caso de erro
  }
}

// Funções de filtro
Filter filterIn(String field, List? list) => (list?.isEmpty ?? true)
    ? Filter(field, whereIn: null)
    : Filter(field, whereIn: list);

Filter filterArrayContainsAny(String field, List? list) =>
    (list?.isEmpty ?? true)
        ? Filter(field, arrayContainsAny: null)
        : Filter(field, arrayContainsAny: list);

// Extensão para o Query
extension QueryExtension on Query {
  Query whereIn(String field, List? list) => (list?.isEmpty ?? true)
      ? where(field, whereIn: null)
      : where(field, whereIn: list);

  Query whereNotIn(String field, List? list) => (list?.isEmpty ?? true)
      ? where(field, whereNotIn: null)
      : where(field, whereNotIn: list);

  Query whereArrayContainsAny(String field, List? list) =>
      (list?.isEmpty ?? true)
          ? where(field, arrayContainsAny: null)
          : where(field, arrayContainsAny: list);
}

// Classe para paginar resultados
class FFFirestorePage<T> {
  final List<T> data;
  final Stream<List<T>>? dataStream;
  final QueryDocumentSnapshot? nextPageMarker;

  FFFirestorePage(this.data, this.dataStream, this.nextPageMarker);
}

// Função para paginar consultas
Future<FFFirestorePage<T>> queryCollectionPage<T>(
  Query collection,
  RecordBuilder<T> recordBuilder, {
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
}) async {
  final builder = queryBuilder ?? (q) => q;
  var query = builder(collection).limit(pageSize);
  if (nextPageMarker != null) {
    query = query.startAfterDocument(nextPageMarker);
  }

  Stream<QuerySnapshot>? docSnapshotStream;
  QuerySnapshot docSnapshot;

  if (isStream) {
    docSnapshotStream = query.snapshots();
    docSnapshot = await docSnapshotStream.first;
  } else {
    docSnapshot = await query.get();
  }

  getDocs(QuerySnapshot s) {
    return s.docs
        .map((d) => safeGet(
              () => recordBuilder(d),
              (e) => logger.error(
                  'getDocs', 'Erro ao serializar doc ${d.reference.path}:\n$e'),
            ))
        .where((d) => d != null)
        .map((d) => d!)
        .toList();
  }

  final data = getDocs(docSnapshot);
  final dataStream = docSnapshotStream?.map(getDocs);
  final nextPageToken = docSnapshot.docs.isEmpty ? null : docSnapshot.docs.last;

  return FFFirestorePage(data, dataStream, nextPageToken);
}
