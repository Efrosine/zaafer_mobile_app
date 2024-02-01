import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zaafer_mobile_app/features/auth/data/models/auth_model.dart';

class AuthService {
  AuthService(this._auth, this._pref);

  final FirebaseAuth _auth;
  final SharedPreferences _pref;

  Future<UserCredential> signIn(AuthModel model) async {
    return await _auth.signInWithEmailAndPassword(
        email: model.email, password: model.password);
  }

  Future<UserCredential> signUp(AuthModel model) async {
    return await _auth.createUserWithEmailAndPassword(
        email: model.email, password: model.password);
  }

  Future<void> signOut() async {
    await _auth.signOut();
    await _pref.clear();
  }

  bool isSignedIn() {
    bool isSignedIn = false;
    _auth.authStateChanges().listen(
      (event) {
        if (event == null) {
          isSignedIn = false;
          _pref.clear();
        } else {
          isSignedIn = true;
          _pref.setString('uid', event.uid);
        }
      },
    );
    return isSignedIn;
  }
}
