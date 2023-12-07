import 'package:rxdart/rxdart.dart';

import 'custom_auth_manager.dart';

class MBTWorkOrderAuthUser {
  MBTWorkOrderAuthUser({required this.loggedIn, this.uid});

  bool loggedIn;
  String? uid;
}

/// Generates a stream of the authenticated user.
BehaviorSubject<MBTWorkOrderAuthUser> mBTWorkOrderAuthUserSubject =
    BehaviorSubject.seeded(MBTWorkOrderAuthUser(loggedIn: false));
Stream<MBTWorkOrderAuthUser> mBTWorkOrderAuthUserStream() =>
    mBTWorkOrderAuthUserSubject
        .asBroadcastStream()
        .map((user) => currentUser = user);
