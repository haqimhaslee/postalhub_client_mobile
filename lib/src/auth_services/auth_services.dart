import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  static final _firestore = FirebaseFirestore.instance;

  //LOGIN with email and password
  static Future<void> login(
      {required String email, required String password}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          throw 'No user found for that email.';
        case 'wrong-password':
          throw 'Wrong password provided.';
        default:
          throw 'Login failed. Please try again.';
      }
    }
  }

  //LOGOUT
  static Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }

  //LOGIN with Google (Old and New user)
  static Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

    final userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    final user = userCredential.user;

    if (user != null) {
      final userDoc = _firestore.collection('client_user').doc(user.uid);
      final snapshot = await userDoc.get();
      if (!snapshot.exists) {
        await userDoc.set({
          'uid': user.uid,
          'username': user.displayName,
          'email': user.email,
          'profilePic': user.photoURL,
          'regAt': FieldValue.serverTimestamp(),
          'provider': 'google',
          'membershipPoints': 5,
          'profileSetup': false
        });
      }
    }

    return userCredential;
  }

  //SIGN UP/REGISTER with email and password
  static Future<void> register({
    required String email,
    required String password,
    required String username,
  }) async {
    try {
      // Create account in Firebase Auth
      final userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      final user = userCredential.user;

      if (user != null) {
        // Save user data in Firestore
        final userDoc = _firestore.collection('client_user').doc(user.uid);
        await userDoc.set({
          'uid': user.uid,
          'username': username,
          'email': email,
          'profilePic': null,
          'regAt': FieldValue.serverTimestamp(),
          'provider': 'email',
          'membershipPoints': 5,
          'profileSetup': false
        });
      }
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'email-already-in-use':
          throw 'This email is already registered.';
        case 'weak-password':
          throw 'Password should be at least 6 characters.';
        case 'invalid-email':
          throw 'Email address is not valid.';
        default:
          throw 'Registration failed. Please try again.';
      }
    }
  }
}
