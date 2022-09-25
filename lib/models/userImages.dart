import 'dart:convert';

class UserImages {
  final List<String> images;

  UserImages({
    required this.images,
  });

  Map<String, dynamic> toMap() {
    return {
      'images': images,
    };
  }

  factory UserImages.fromMap(Map<String, dynamic> map) {
    return UserImages(
      images: List<String>.from(map['images']),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserImages.fromJson(String source) =>
      UserImages.fromMap(json.decode(source));

  UserImages copyWith({
    String? id,
    String? name,
    String? email,
    String? password,
    String? address,
    String? type,
    String? token,
    List<dynamic>? cart,
  }) {
    return UserImages(
      images: [],
    );
  }
}
