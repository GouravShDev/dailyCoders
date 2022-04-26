import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daily_coders/core/objects/unique_id.dart';
import 'package:daily_coders/core/utils/constants.dart';
import 'package:daily_coders/layers/domain/users/i_user_repository.dart';
import 'package:daily_coders/layers/domain/users/user.dart';
import 'package:daily_coders/layers/domain/users/user_failure.dart';
import 'package:daily_coders/layers/infrastructure/users/user_dtos.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:injectable/injectable.dart';

@Injectable(as: IUserRepository)
class UserRepository implements IUserRepository {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _firebaseAuth;

  final String _usersCollection = FirestoreDatabases.users.name;

  UserRepository(this._firestore, this._firebaseAuth);

  @override
  Future<Either<UserFailure, User>> getUser() async {
    try {
      final userDoc = _firestore.collection(_usersCollection);
      final doc = await userDoc.doc(_firebaseAuth.currentUser!.uid).get();
      return right<UserFailure, User>(UserDto.fromFirestore(doc).toDomain());
    } on FirebaseException {
      return left(const UserFailure.unexpected());
    } on Exception {
      return left(const UserFailure.unexpected());
    }
  }

  @override
  Future<Either<UserFailure, User>> updateUser(User user, File? image) async {
    try {
      final User updatedUser = user;
      if (image != null) {
        // TODO : remove this code
        // final Reference storageReference = _firebaseStorage
        // .ref()
        // .child('profilePic/${_firebaseAuth.currentUser!.uid}');
        // final snapshot = await storageReference.putFile(image);
        // final downloadUrl = await snapshot.ref.getDownloadURL();
        // updatedUser = updatedUser.copyWith(imageUrl: downloadUrl);
      }
      final userDoc = _firestore.collection(_usersCollection);
      final userDto = UserDto.fromDomain(updatedUser);
      await userDoc
          .doc(_firebaseAuth.currentUser!.uid)
          .update(userDto.toJson());
      return right(updatedUser);
    } on FirebaseException {
      return left(const UserFailure.unexpected());
    }
  }

  @override
  Future<Either<UserFailure, User>> createUser(User user) async {
    // create user in firebase collection
    try {
      final userDoc = _firestore.collection(_usersCollection);
      final userDto = UserDto.fromDomain(user);
      final userJson = userDto.toJson();
      // create empty array for user's likes post
      userJson['likes'] = [];
      await userDoc.doc(_firebaseAuth.currentUser!.uid).set(userJson);
      return right(
        user.copyWith(
          id: UniqueId.fromUniqueString(_firebaseAuth.currentUser!.uid),
        ),
      );
    } on FirebaseException {
      return left(const UserFailure.unexpected());
    }
  }
}
