import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fast_media/authentication/data/repositories/base_auth_repository.dart';
import 'package:fast_media/authentication/data/repositories/base_database_repository.dart';
import 'package:fast_media/home/data/models/favorite_model.dart';

import '../../../core/base_usercase/base_auth_usecase.dart';
import '../../../core/base_usercase/base_firestore_usecase.dart';
import '../../../core/constants/api_enums.dart';
import '../../../core/error/failure.dart';
import '../entities/cast.dart';
import '../repository/base_movies_repository.dart';
import 'base_usecase.dart';

class GetFavoriteUseCase extends BaseFireStoreUseCase<List<FavoriteModel>, NoParameter> {
  final BaseDatabaseRepository baseDatabaseRepository;

  GetFavoriteUseCase(this.baseDatabaseRepository);

  @override
  Future<Either<FirebaseException, List<FavoriteModel>>> call(NoParameter parameters) async =>
      await baseDatabaseRepository.getFavorite(parameters);
}


