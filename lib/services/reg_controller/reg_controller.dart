// Implement user authentication using Firebase Authentication
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import '../auth_controller/auth_controller.dart';


class RegController {
  final FirebaseDatabase _database = FirebaseDatabase.instance;
  

  Future<void> registerUser(String email, String password) async {
    print ("Registering user with email: $email and password: $password");
    try {
      final User? result = await AuthController().register(email, password);
      if (result != null) {
        final User? user = result.user;
        final ref = _database.reference().child('users').child(user?.uid);
        print("Successful");
        ref.set({
          'email': email,
          'password': password,
        });
      }
    } catch (e) {
      print(e.toString());
    }
  }
}

extension on FirebaseDatabase {
  reference() {}
}

extension on User {
  User? get user => null;
}
