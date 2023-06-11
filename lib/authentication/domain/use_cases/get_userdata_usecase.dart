import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fast_media/authentication/data/models/user_model.dart';

import '../../../core/base_usercase/base_firestore_usecase.dart';
import '../../data/repositories/base_database_repository.dart';

class GetUserDataUseCase extends BaseFireStoreUseCase<UserModel,GetUserDataParameter> {
  BaseDatabaseRepository baseDatabaseRepository ;
  GetUserDataUseCase(this.baseDatabaseRepository);

  @override
  Future<Either<FirebaseException, UserModel>> call(GetUserDataParameter parameters) async {
    return await baseDatabaseRepository.getUserData(parameters);
  }




}
class GetUserDataParameter extends Equatable {

  final String id;


  const GetUserDataParameter({ required this.id});

  @override
  List<Object> get props => [id,];
}