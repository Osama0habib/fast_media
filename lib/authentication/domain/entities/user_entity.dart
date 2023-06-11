import 'package:equatable/equatable.dart';

enum Gender { male, female }

class UserEntity extends Equatable {
  final String uid;
  final bool isVerified;
  final String? email;
  final String? imageUrl;
  final String? displayName;
  final String? phone;
  final Gender? gender;

  const UserEntity(
      {required this.uid,
       required this.imageUrl,
      required this.isVerified,
      required this.email,
      required this.displayName,
      required this.phone,
      required this.gender});

  @override
  List<Object?> get props =>
      [uid, isVerified, email, displayName, phone, gender,imageUrl];
}