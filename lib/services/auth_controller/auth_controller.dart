import 'package:firebase_auth/firebase_auth.dart';

class AuthController {
  final FirebaseAuth _auth = FirebaseAuth.instance;



  Future<User?> login(String email, String password) async {
    try {
      final UserCredential result =
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return result.user;
    } catch (e) {
      print('Login error: $e');
      return null;
    }
  }

  Future<User?> register(String email, String password) async {
    try {
      final UserCredential result =
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return result.user;
    } catch (e) {
      print('Registration error: $e');
      return null;
    }
  }
}