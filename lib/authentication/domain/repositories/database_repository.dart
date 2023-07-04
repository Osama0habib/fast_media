import 'package:dartz/dartz.dart';
import 'package:fast_media/authentication/data/repositories/base_database_repository.dart';
import 'package:fast_media/core/base_usercase/base_auth_usecase.dart';
import 'package:fast_media/home/data/models/favorite_model.dart';
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';

import '../../data/data_sources/remote_data_source/database_remote_datasource.dart';
import '../../data/models/user_model.dart';
import '../use_cases/get_userdata_usecase.dart';
import '../use_cases/save_userdata_usecase.dart';

class DatabaseRepository implements BaseDatabaseRepository {
  BaseDatabaseRemoteDataSource databaseRemoteDatasource;
  DatabaseRepository(this.databaseRemoteDatasource);

  @override
  Future<Either<FirebaseException, UserModel>> getUserData(GetUserDataParameter parameters) async {
    final result = await databaseRemoteDatasource.retrieveUserData(parameters);
    try {
      return Right(result);
    }on FirebaseException catch (e){
      return Left(FirebaseException(code: e.code,message: e.message, plugin: e.plugin));
    }
  }

  @override
  Future<Either<FirebaseException, void>> saveUserData(SaveUserDataParameter parameters) async {
    final result = await databaseRemoteDatasource.saveUserData(parameters);
    try {
      return Right(result);
    }on FirebaseException catch (e){
      return Left(FirebaseException(code: e.code,message: e.message, plugin: e.plugin));
    }
  }

  @override
  Future<Either<FirebaseException, List<FavoriteModel>>> getFavorite(NoParameter parameter) async {
    final result = await databaseRemoteDatasource.getFavorite(parameter);
    try {
      return Right(result);
    }on FirebaseException catch (e){
      return Left(FirebaseException(code: e.code,message: e.message, plugin: e.plugin));
    }
  }







}