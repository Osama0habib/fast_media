import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:fast_media/authentication/domain/use_cases/save_userdata_usecase.dart';
import 'package:fast_media/core/base_usercase/base_auth_usecase.dart';
import 'package:fast_media/home/data/models/favorite_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/constants/api_constants.dart';
import '../../../../core/constants/api_enums.dart';
import '../../../../core/error/error_message_model.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../home/data/models/movie_details_model.dart';
import '../../../../home/domain/usecases/add_to_favorite.dart';
import '../../../../home/domain/usecases/get_movie_details_usecase.dart';
import '../../../domain/use_cases/get_userdata_usecase.dart';
import '../../models/user_model.dart';

abstract class BaseDatabaseRemoteDataSource {
  Future<void> saveUserData(SaveUserDataParameter parameters);
  Future<UserModel> retrieveUserData(GetUserDataParameter parameters);
  Future<List<FavoriteModel>> getFavorite(NoParameter parameter);

}

class DatabaseRemoteDatasource extends BaseDatabaseRemoteDataSource {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  DatabaseRemoteDatasource();
  @override
  Future<void> saveUserData(SaveUserDataParameter parameters) async {
    try {
      return await db
          .collection("Users")
          .doc(parameters.userData.uid)
          .set(parameters.userData.toMap());
    } on FirebaseException catch (e) {
      throw FirebaseException(
          code: e.code, message: e.message, plugin: e.plugin);
    }
  }

  @override
  Future<UserModel> retrieveUserData(GetUserDataParameter parameters) async {
    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await db.collection("Users").doc(parameters.id).get();
    final user = UserModel.fromFireStore(snapshot);
    user.favorite = await getFavorite(const NoParameter());
    return user;
  }

  @override
  Future<List<FavoriteModel>> getFavorite(NoParameter parameter) async {
    try {
      final response = await db.collection("Users").doc(UserModel.userModel?.uid).collection("favorite").get();
      return List<FavoriteModel>.from(response.docs.map((e) => FavoriteModel.fromDoc(e.data())));
    } on FirebaseException catch (e) {
      throw FirebaseException(plugin: e.plugin,
          stackTrace: e.stackTrace,
          code: e.code,
          message: e.message);
    }
  }

  // Future<MovieDetailsModel> getMovieDetails(
  //     MovieDetailsParameter parameter) async {
  //   final response =
  //   await Dio().get(ApiConstant.movieDetailsPath(parameter.movieId,Category.movie));
  //   if (response.statusCode == 200) {
  //     return MovieDetailsModel.fromJson(response.data);
  //   } else {
  //     throw ServerException(
  //         errorMessageModel: ErrorMessageModel.fromJson(response.data));
  //   }
  // }


}
