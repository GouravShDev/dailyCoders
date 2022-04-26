import 'package:uuid/uuid.dart';

// Object for unique id generation
// This ensures the id is unique and not reused
class UniqueId {
  final String value;

  // We cannot let a simple String be passed in. This would allow for possible non-unique IDs.
  factory UniqueId() {
    return UniqueId._(
      const Uuid().v1(),
    );
  }

  /// Used with strings we trust are unique, such as database IDs.
  factory UniqueId.fromUniqueString(String uniqueIdStr) {
    return UniqueId._(
      uniqueIdStr,
    );
  }

  const UniqueId._(this.value);
}
