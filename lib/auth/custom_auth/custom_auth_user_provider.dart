import 'package:rxdart/rxdart.dart';

import '/backend/schema/structs/index.dart';
import 'custom_auth_manager.dart';

class LogyxappAuthUser {
  LogyxappAuthUser({
    required this.loggedIn,
    this.uid,
    this.userData,
  });

  bool loggedIn;
  String? uid;
  UserStruct? userData;
}

/// Generates a stream of the authenticated user.
BehaviorSubject<LogyxappAuthUser> logyxappAuthUserSubject =
    BehaviorSubject.seeded(LogyxappAuthUser(loggedIn: false));
Stream<LogyxappAuthUser> logyxappAuthUserStream() => logyxappAuthUserSubject
    .asBroadcastStream()
    .map((user) => currentUser = user);
