import 'package:daily_coders/core/objects/firebase_user.dart';
import 'package:daily_coders/core/objects/unique_id.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;

// To convert the User from firebase to FirebaseUser (domain model)
extension FirebaseUserDomainX on firebase.User {
  FirebaseUser toDomain() {
    return FirebaseUser(
      id: UniqueId.fromUniqueString(uid),
      firebaseUser: this,
    );
  }
}
