import 'package:equatable/equatable.dart';
import 'package:fast_media/home/data/models/favorite_model.dart';

import '../../../home/domain/entities/favorite.dart';

enum Gender { male, female }

class UserEntity extends Equatable {
  final String? uid;
  final bool? isVerified;
  final String? email;
  final String? imageUrl;
  final String? displayName;
  final String? phone;
  final Gender? gender;
  List<FavoriteModel> favorite;

   UserEntity(
      { this.uid,
        this.imageUrl,
       this.isVerified,
       this.email,
       this.displayName,
       this.phone,
       this.gender,
       this.favorite =const []});

  @override
  List<Object?> get props =>
      [uid, isVerified, email, displayName, phone, gender,imageUrl,favorite];
}