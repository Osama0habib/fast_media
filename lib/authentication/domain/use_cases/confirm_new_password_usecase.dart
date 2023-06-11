import 'package:dartz/dartz.dart';
import 'package:fast_media/core/base_usercase/base_auth_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth_platform_interface/src/firebase_auth_exception.dart';

import '../../data/repositories/base_auth_repository.dart';


class ConfirmNewPasswordUseCase extends BaseAuthUseCase<void,ConfirmNewPasswordParameter> {
  BaseAuthRepository baseAuthRepository ;
  ConfirmNewPasswordUseCase(this.baseAuthRepository);
  @override
  Future<Either<FirebaseAuthException, void>> call(ConfirmNewPasswordParameter parameters) async {
   return await baseAuthRepository.confirmNewPassword(parameters);
  }

}


class ConfirmNewPasswordParameter extends Equatable {

  final String code;
  final String password;

  const ConfirmNewPasswordParameter({required this.code, required this.password});

  @override
  List<Object> get props => [code,password,];
}