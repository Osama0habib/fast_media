import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fast_media/authentication/domain/use_cases/save_userdata_usecase.dart';

import '../../../domain/use_cases/get_userdata_usecase.dart';
import '../../models/user_model.dart';

abstract class BaseDatabaseRemoteDataSource {
  Future<void> saveUserData(SaveUserDataParameter parameters);
  Future<UserModel> retrieveUserData(GetUserDataParameter parameters);
}

class DatabaseRemoteDatasource extends BaseDatabaseRemoteDataSource {
  final FirebaseFirestore db  = FirebaseFirestore.instance;
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
    print("retrieve User Data");
    DocumentSnapshot<Map<String, dynamic>> snapshot =
    await db.collection("Users").doc(parameters.id).get();
    print(snapshot.data());
    // DocumentSnapshot<Map<String, dynamic>> favorite = await db.collection("Users").doc(parameters.id).collection("favorite").get();
    return UserModel.fromFireStore(snapshot);
  }
}
