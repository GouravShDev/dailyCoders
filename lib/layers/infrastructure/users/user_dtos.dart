import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daily_coders/core/objects/unique_id.dart';
import 'package:daily_coders/layers/domain/users/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_dtos.freezed.dart';
part 'user_dtos.g.dart';

@freezed
class UserDto with _$UserDto {
  const factory UserDto({
    @JsonKey(ignore: true) String? id,
    required String name,
    required String imageUrl,
    required String profileUrl,
  }) = _UserDto;
  const UserDto._();

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  factory UserDto.fromDomain(User user) => UserDto(
        id: user.id.value,
        name: user.name,
        imageUrl: user.imageUrl,
        profileUrl: user.profileUrl,
      );

  User toDomain() => User(
        id: UniqueId.fromUniqueString(id!),
        name: name,
        imageUrl: imageUrl,
        profileUrl: profileUrl,
      );
  factory UserDto.fromFirestore(DocumentSnapshot doc) {
    return UserDto.fromJson(doc.data()! as Map<String, dynamic>)
        .copyWith(id: doc.id);
  }
}
