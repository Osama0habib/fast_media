import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fast_media/authentication/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.uid,
    required super.imageUrl,
    required super.isVerified,
    required super.email,
    required super.displayName,
    required super.phone,
    required super.gender,
  });


  factory UserModel.fromFireStore(DocumentSnapshot<Map<String, dynamic>> doc) =>
      UserModel(
        uid: doc.id,
        isVerified: doc.data()!["isVerified"],
        email: doc.data()!["email"],
        displayName: doc.data()!["displayName"],
        phone: doc.data()!["phone"],
        imageUrl: doc.data()!["imageUrl"],
        gender: doc.data()!["gender"],
      );

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'isVerified': isVerified,
      'email': email,
      'displayName': displayName,
      'phone': phone,
      'imageUrl': imageUrl,
      'gender': gender,
    };
  }

  UserModel copyWith({
    bool? isVerified,
    String? uid,
    String? email,
    String? displayName,
    String? imageUrl,
    String? phone,
    Gender? gender,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      displayName: displayName ?? this.displayName,
      isVerified: isVerified ?? this.isVerified,
      imageUrl: imageUrl ?? this.imageUrl,
      phone: phone ?? this.phone,
      gender: gender ?? this.gender,
    );
  }
}
