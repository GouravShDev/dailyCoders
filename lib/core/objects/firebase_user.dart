import 'package:daily_coders/core/objects/unique_id.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'firebase_user.freezed.dart';

@freezed
class FirebaseUser with _$FirebaseUser {
  const factory FirebaseUser({
    required UniqueId id,
    required User firebaseUser,
  }) = _FirebaseUser;
}
