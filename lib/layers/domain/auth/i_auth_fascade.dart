import 'package:daily_coders/core/objects/firebase_user.dart';
import 'package:daily_coders/layers/domain/auth/auth_failure.dart';
import 'package:dartz/dartz.dart';

/// This an abstract class which contains all the methods that are required to
/// implement the authentication logic.
/// The methods are implemented in the infrastructer layer.
abstract class IAuthFacade {
  Future<Option<FirebaseUser>> getSignedInUser();
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    required String emailAddress,
    required String password,
  });
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    required String emailAddress,
    required String password,
  });
  Future<bool> isUserAlreadyExists();

  Future<void> signOut();
}
