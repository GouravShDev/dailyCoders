import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daily_coders/core/objects/firebase_user.dart';
import 'package:daily_coders/core/utils/constants.dart';
import 'package:daily_coders/layers/domain/auth/auth_failure.dart';
import 'package:daily_coders/layers/domain/auth/i_auth_fascade.dart';
import 'package:daily_coders/layers/infrastructure/auth/firebase_user_mapper.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:injectable/injectable.dart';

@Singleton(as: IAuthFacade)
class FirebaseAuthFacade implements IAuthFacade {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseFirestore;

  FirebaseAuthFacade(
    this._firebaseAuth,
    this._firebaseFirestore,
  );

  @override
  Future<Option<FirebaseUser>> getSignedInUser() async {
    return optionOf(_firebaseAuth.currentUser?.toDomain());
    // return optionOf(_firebaseAuth.currentUser?.toDomain());
  }

  @override
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    required String emailAddress,
    required String password,
  }) async {
    final emailAddressStr = emailAddress;
    final passwordStr = password;
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: emailAddressStr,
        password: passwordStr,
      );
      return right(unit);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return left(const AuthFailure.emailAlreadyInUse());
      } else {
        return left(const AuthFailure.serverError());
      }
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    required String emailAddress,
    required String password,
  }) async {
    final emailAddressStr = emailAddress;
    final passwordStr = password;
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: emailAddressStr,
        password: passwordStr,
      );
      return right(unit);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'wrong-password' || e.code == 'ERROR_USER_NOT_FOUND') {
        return left(const AuthFailure.invalidEmailAndPasswordCombination());
      } else {
        return left(const AuthFailure.serverError());
      }
    }
  }

  @override
  Future<void> signOut() => Future.wait([
        _firebaseAuth.signOut(),
      ]);

  @override
  Future<bool> isUserAlreadyExists() {
    // check if the current user exists in the database
    return _firebaseFirestore
        .collection(FirestoreDatabases.users.name)
        .doc(_firebaseAuth.currentUser!.uid)
        .get()
        .then((value) => value.exists);
  }
}
