import 'dart:io';

import 'package:daily_coders/layers/domain/users/user.dart';
import 'package:daily_coders/layers/domain/users/user_failure.dart';
import 'package:dartz/dartz.dart';

abstract class IUserRepository {
  Future<Either<UserFailure, User>> getUser();
  Future<Either<UserFailure, User>> updateUser(User user, File? image);
  Future<Either<UserFailure, User>> createUser(User user);
}
