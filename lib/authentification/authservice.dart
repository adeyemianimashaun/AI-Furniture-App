// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class AuthService {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   // CURRENT USER
//   User? get currentUser => _auth.currentUser;

//   // AUTH STATE CHANGES
//   Stream<User?> get authStateChanges => _auth.authStateChanges();

//   // =============================
//   // ANONYMOUS SIGN IN (GUEST USER)
//   // =============================
//   Future<User?> signInAnon() async {
//     try {
//       UserCredential result = await _auth.signInAnonymously();
//       User? user = result.user;
//       return user;
//     } catch (e) {
//       print('Anonymous Sign In Error: $e');
//       return null;
//     }
//   }

//   // =============================
//   // REGISTER WITH EMAIL + PASSWORD
//   // =============================
//   Future<User?> registerWithEmail({
//     required String email,
//     required String password,
//     required String fullName,
//   }) async {
//     try {
//       UserCredential result = await _auth.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );

//       User? user = result.user;

//       if (user != null) {
//         await _firestore.collection('users').doc(user.uid).set({
//           'uid': user.uid,
//           'fullName': fullName,
//           'email': email,
//           'createdAt': FieldValue.serverTimestamp(),
//         });
//       }

//       return user;
//     } catch (e) {
//       print('Register Error: $e');
//       return null;
//     }
//   }

//   // =============================
//   // LOGIN WITH EMAIL + PASSWORD
//   // =============================
//   Future<User?> loginWithEmail({
//     required String email,
//     required String password,
//   }) async {
//     try {
//       UserCredential result = await _auth.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );

//       return result.user;
//     } catch (e) {
//       print('Login Error: $e');
//       return null;
//     }
//   }

//   // =============================
//   // RESET PASSWORD
//   // =============================
//   Future<void> resetPassword({
//     required String email,
//   }) async {
//     try {
//       await _auth.sendPasswordResetEmail(email: email);
//     } catch (e) {
//       print('Reset Password Error: $e');
//     }
//   }

//   // =============================
//   // SIGN OUT
//   // =============================
//   Future<void> signOut() async {
//     try {
//       await _auth.signOut();
//     } catch (e) {
//       print('Sign Out Error: $e');
//     }
//   }
// }
