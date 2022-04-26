import 'package:daily_coders/core/objects/unique_id.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  const factory User({
    required UniqueId id,
    required String name,
    required String imageUrl,
    required String profileUrl,
  }) = _User;

  const User._();

  factory User.empty() => User(
        id: UniqueId(),
        name: '',
        imageUrl: '',
        profileUrl: '',
      );
}
