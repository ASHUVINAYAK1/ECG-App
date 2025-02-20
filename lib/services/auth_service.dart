import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<bool> signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } catch (e) {
      print("SignIn Error: $e");
      return false;
    }
  }

  Future<bool> register(String email, String password, String role) async {
    try {
      UserCredential userCred = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Store additional user data in Firestore.
      await _db.collection('users').doc(userCred.user!.uid).set({
        'email': email,
        'role': role,
      });
      return true;
    } catch (e) {
      print("Registration Error: $e");
      return false;
    }
  }

  Future signOut() async {
    await _auth.signOut();
  }
}
