import 'package:fidooo_challenge/auth/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _authManager = FirebaseAuthManager();
FirebaseAuthManager get authManager => _authManager;

String get currentJwtToken => _currentJwtToken ?? '';
bool get currentUserEmailVerified => currentUser?.emailVerified ?? false;

String? _currentJwtToken;
final jwtTokenStream = FirebaseAuth.instance
    .idTokenChanges()
    .map((user) async => _currentJwtToken = await user?.getIdToken())
    .asBroadcastStream();
