import 'package:dartz/dartz.dart';
import 'package:fast_media/core/base_usercase/base_auth_usecase.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../data/repositories/base_auth_repository.dart';

class SignInWithFaceBookUseCase extends BaseAuthUseCase<UserCredential,NoParameter>  {
  BaseAuthRepository baseAuthRepository ;
  SignInWithFaceBookUseCase(this.baseAuthRepository);

  @override
  Future<Either<FirebaseAuthException, UserCredential>> call(NoParameter parameters) async{
    return await baseAuthRepository.signInWithFacebook(parameters);
  }
}