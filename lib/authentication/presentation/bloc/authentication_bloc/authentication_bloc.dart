import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fast_media/authentication/data/repositories/base_auth_repository.dart';
import 'package:fast_media/core/base_usercase/base_auth_usecase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../domain/repositories/auth_repository.dart';
import '../../../domain/use_cases/sign_out_usecase.dart';

part 'authentication_event.dart';

part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final BaseAuthRepository _authenticationRepository;
  final SignOutUseCase signOutUseCase;

  AuthenticationBloc(this._authenticationRepository, this.signOutUseCase)
      : super(AuthenticationInitial()) {
    on<AuthenticationEvent>((event, emit) async {
      if (event is AuthenticationStarted) {
        Stream<User?> stream = _authenticationRepository.authChanges(const NoParameter());
        await emit.onEach(stream,
            onData: (user) {
              if(user == null){
                emit(const AuthenticationFailure());
              }else{
                emit(const AuthenticationSuccess());

              }
            },
            onError: (Object object, StackTrace stackTrace) =>
                emit(const AuthenticationFailure()));
      } else if (event is AuthenticationSignedOut) {
        await signOutUseCase(const NoParameter());
        emit(const AuthenticationFailure());
      }
    });
  }
}
