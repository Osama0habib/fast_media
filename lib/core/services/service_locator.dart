
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fast_media/authentication/data/data_sources/remote_data_source/database_remote_datasource.dart';
import 'package:fast_media/authentication/data/data_sources/remote_data_source/firebase_auth_Remote_service.dart';
import 'package:fast_media/authentication/data/repositories/base_auth_repository.dart';
import 'package:fast_media/authentication/data/repositories/base_database_repository.dart';
import 'package:fast_media/authentication/domain/repositories/auth_repository.dart';
import 'package:fast_media/authentication/domain/repositories/database_repository.dart';
import 'package:fast_media/authentication/domain/use_cases/confirm_new_password_usecase.dart';
import 'package:fast_media/authentication/domain/use_cases/forget_password_usecase.dart';
import 'package:fast_media/authentication/domain/use_cases/get_userdata_usecase.dart';
import 'package:fast_media/authentication/domain/use_cases/save_userdata_usecase.dart';
import 'package:fast_media/authentication/domain/use_cases/sign_in_with_Apple_usecase.dart';
import 'package:fast_media/authentication/domain/use_cases/sign_in_with_email_usecase.dart';
import 'package:fast_media/authentication/domain/use_cases/sign_in_with_facebook_usecase.dart';
import 'package:fast_media/authentication/domain/use_cases/sign_in_with_google_usecase.dart';
import 'package:fast_media/authentication/domain/use_cases/sign_out_usecase.dart';
import 'package:fast_media/authentication/domain/use_cases/sign_up_with_email_usecase.dart';
import 'package:fast_media/authentication/domain/use_cases/verify_email_usecase.dart';
import 'package:fast_media/authentication/domain/use_cases/verify_password_reset_code_usecase.dart';
import 'package:fast_media/authentication/presentation/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:fast_media/authentication/presentation/bloc/sign_up_bloc/sign_up_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../authentication/presentation/bloc/sign_in_bloc/sign_in_bloc.dart';


final sl = GetIt.instance;
class ServiceLocator {
  void init(){
    /// Bloc
    sl.registerFactory(() => AuthenticationBloc(sl(),sl()));
    sl.registerFactory(() => SignInBloc(sl(),sl(),sl(),sl(),sl(),sl(),sl()));
    sl.registerFactory(() => SignUpBloc(sl(), sl()));


    /// Remote DataSource
    sl.registerLazySingleton<BaseFirebaseAuthRemoteDataSource>(() => FirebaseAuthRemoteService());
    sl.registerLazySingleton<BaseDatabaseRemoteDataSource>(() => DatabaseRemoteDatasource());

    /// Repository
    sl.registerLazySingleton<BaseAuthRepository>(() => AuthRepository());
    sl.registerLazySingleton<BaseDatabaseRepository>(() => DatabaseRepository(sl()));


    /// Usecases
    sl.registerLazySingleton(() => ConfirmNewPasswordUseCase(sl()));
    sl.registerLazySingleton(() => ForgetPasswordUseCase(sl()));
    sl.registerLazySingleton(() => GetUserDataUseCase(sl()));
    sl.registerLazySingleton(() => SaveUserDataUseCase(sl()));
    sl.registerLazySingleton(() => SignInWithAppleUseCase(sl()));
    sl.registerLazySingleton(() => SignInWithEmailUseCase(sl()));
    sl.registerLazySingleton(() => SignInWithFaceBookUseCase(sl()));
    sl.registerLazySingleton(() => SignInWithGoogleUseCase(sl()));
    sl.registerLazySingleton(() => SignOutUseCase(sl()));
    sl.registerLazySingleton(() => SignUpWithEmailUseCase(sl()));
    sl.registerLazySingleton(() => VerifyEmailUseCase(sl()));
    sl.registerLazySingleton(() => VerifyPasswordCodeUseCase(sl()));

    //
    // sl.registerSingletonAsync<PackageInfo>(() async => await PackageInfo.fromPlatform());
    // sl.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
    // sl.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);


  }
}