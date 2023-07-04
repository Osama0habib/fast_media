import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:fast_media/core/base_usercase/base_auth_usecase.dart';

import '../../../home/data/models/favorite_model.dart';
import '../../domain/use_cases/get_userdata_usecase.dart';
import '../../domain/use_cases/save_userdata_usecase.dart';
import '../models/user_model.dart';

abstract class BaseDatabaseRepository {
  Future<Either<FirebaseException, void>> saveUserData(SaveUserDataParameter parameters);
  Future<Either<FirebaseException, UserModel>> getUserData(GetUserDataParameter parameters);
  Future<Either<FirebaseException,List<FavoriteModel>>> getFavorite(NoParameter parameter);

}