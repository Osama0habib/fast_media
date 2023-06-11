import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fast_media/authentication/domain/use_cases/save_userdata_usecase.dart';

import '../../../domain/use_cases/get_userdata_usecase.dart';
import '../../models/user_model.dart';

abstract class BaseDatabaseRemoteDataSource {
  Future<void> saveUserData(SaveUserDataParameter parameters);
  Future<UserModel> retrieveUserData(GetUserDataParameter parameters);
}

class DatabaseRemoteDatasource extends BaseDatabaseRemoteDataSource {
  final FirebaseFirestore db ;
  DatabaseRemoteDatasource(this.db);

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
    return UserModel.fromFireStore(snapshot);
  }
}
