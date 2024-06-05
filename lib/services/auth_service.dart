import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static String verifyId = "";
  // to sent and otp to user
  static Future sentOtp({
    required String phone,
    required Function errorStep,
    required Function nextStep,
  }) async {
    await _firebaseAuth
        .verifyPhoneNumber(
      timeout: Duration(seconds: 30),
      phoneNumber: "+228$phone",
      verificationCompleted: (phoneAuthCredential) async {
        print('verifivationCompleted');
        return;
      },
      verificationFailed: (error) async {
        print("verification pas marcher");
        return;
      },
      codeSent: (verificationId, forceResendingToken) async {
        print('code sent');
        verifyId = verificationId;
        nextStep();
      },
      codeAutoRetrievalTimeout: (verificationId) async {
        print('controle time');
        return;
      },
    )
        .onError((error, stackTrace) {
      errorStep();
    });
  }

  static Future<String> registerUser({
    required String phoneUser,
    required String NomUser,
    required String age,
    required String email,
    required String sexe,
    required String niveauSColaire,
    required String SituationMatrimoniale,
    required String emploi,
  }) async {
    try {
      // Récupérer l'utilisateur actuellement connecté
      final user = _firebaseAuth.currentUser;

      print(user);
      if (user != null) {
        // Create a new user with a first and last name
        final userId = <String, dynamic>{
          'id': user.uid,
          'phoneUser': phoneUser,
          'NomUser': NomUser,
          'age': age,
          'email': email,
          'sexe': sexe,
          'niveauSColaire': niveauSColaire,
          'SituationMatrimoniale': SituationMatrimoniale,
          'emploi': emploi,
        };

        print(userId);

        // Add a new document with a generated ID
        await _firestore.collection("users").add(userId).then(
            (DocumentReference doc) =>
                print('DocumentSnapshot added with ID: ${doc.id}'));
        print(user);
        // Enregistrer les données de l'utilisateur dans Firestore

        print("Utilisateur enregistré avec succès");
        return "Success";
      } else {
        return "Error: No user is currently logged in.";
      }
    } catch (e) {
      print("Erreur lors de l'enregistrement de l'utilisateur: $e");
      return "Error: $e";
    }
  }

  static Future<Map<String, dynamic>?> getUserByUid() async {
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;

    final user = _firebaseAuth.currentUser;
    if (user != null) {
      final QuerySnapshot querySnapshot = await _firestore
          .collection("users")
          .where("id", isEqualTo: user.uid)
          .get();
      if (querySnapshot.docs.isNotEmpty) {
        print("nous l'avons trouve");
        final DocumentSnapshot docSnapshot = querySnapshot.docs.first;
        return docSnapshot.data() as Map<String, dynamic>;
      }
    }
    return null;
  }

  static Future<void> updateUserData({
    required String phoneUser,
    required String NomUser,
    required String age,
    required String email,
    required String sexe,
    required String niveauSColaire,
    required String SituationMatrimoniale,
    required String emploi,
  }) async {
    try {
      print('dbut modif');
      // Récupérer l'utilisateur actuellement connecté
      final user = _firebaseAuth.currentUser;

      print('curent trouver');

      if (user != null) {
        // Récupérer la référence du document de l'utilisateur
        final userDocRef = _firestore.collection("users").doc(user.uid);

        print('debut modification');

        // Mettre à jour les informations de l'utilisateur
        await userDocRef.update({
          'phoneUser': phoneUser,
          'NomUser': NomUser,
          'age': age,
          'email': email,
          'sexe': sexe,
          'niveauSColaire': niveauSColaire,
          'SituationMatrimoniale': SituationMatrimoniale,
          'emploi': emploi,
        });

        print("Informations de l'utilisateur mises à jour avec succès");
      } else {
        print("Erreur: Aucun utilisateur n'est actuellement connecté.");
      }
    } catch (e) {
      print(
          "Erreur lors de la mise à jour des informations de l'utilisateur: $e");
    }
  }

  // verify the otp code and login
  static Future loginWithOtp({
    required String otp,
  }) async {
    final cred =
        PhoneAuthProvider.credential(verificationId: verifyId, smsCode: otp);

    try {
      final user = await _firebaseAuth.signInWithCredential(cred);
      if (user.user != null) {
        print('login whith otp');

        return "Success";
      } else {
        return "Error in Otp login";
      }
    } on FirebaseAuthException catch (e) {
      return e.message.toString();
    } catch (e) {
      return e.toString();
    }
  }

  // to logout the user
  static Future logout() async {
    await _firebaseAuth.signOut();
  }

  // check whether the user is logged in or not
  static Future<bool> isLoggedIn() async {
    var user = _firebaseAuth.currentUser;
    return user != null;
  }
}
