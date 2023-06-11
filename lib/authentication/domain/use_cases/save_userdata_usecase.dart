import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fast_media/authentication/data/models/user_model.dart';
import 'package:fast_media/authentication/data/repositories/base_database_repository.dart';
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';

import '../../../core/base_usercase/base_firestore_usecase.dart';


class SaveUserDataUseCase extends BaseFireStoreUseCase<void,SaveUserDataParameter> {
  BaseDatabaseRepository baseDatabaseRepository ;
  SaveUserDataUseCase(this.baseDatabaseRepository);

  @override
  Future<Either<FirebaseException, void>> call(SaveUserDataParameter parameters) async {
    return await baseDatabaseRepository.saveUserData(parameters);
  }




}
class SaveUserDataParameter extends Equatable {

  final UserModel userData;


  const SaveUserDataParameter({ required this.userData});

  @override
  List<Object> get props => [userData,];
}