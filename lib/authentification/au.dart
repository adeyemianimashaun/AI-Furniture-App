// ignore: depend_on_referenced_packages
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _store = FirebaseFirestore.instance;

  User? get currentUser => _auth.currentUser;

  // SIGN IN ANONYMOUSLY
  Future<User?> signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return user;
    } catch (e) {
      print(e);
      return null;
    }
  }

  // SAVE USER DATA TO FIRESTORE
  Future<void> saveUserData({
    required String firstName,
    required String lastName,
    required String email,
  }) async {
    try {
      await _store.collection('users').add({
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'createdAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      print(e);
    }
  }

  // SIGN IN WITH EMAIL AND PASSWORD
  Future<User?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential result =
          await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return result.user;
    } catch (e) {
      print(e);
      return null;
    }
  }

  // REGISTER USER
  Future<User?> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    try {
      UserCredential cred =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = cred.user;

      if (user != null) {
        await _store.collection("users").doc(user.uid).set({
          "uid": user.uid,
          "firstName": firstName,
          "lastName": lastName,
          "email": email,
          "createdAt": FieldValue.serverTimestamp(),
        });
      }

      return user;
    } catch (e) {
      print(e);
      return null;
    }
  }

  // LOGOUT
  Future<void> logout() async {
    await _auth.signOut();
  }
}