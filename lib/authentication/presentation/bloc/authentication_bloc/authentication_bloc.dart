import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fast_media/authentication/data/models/user_model.dart';
import 'package:fast_media/authentication/data/repositories/base_auth_repository.dart';
import 'package:fast_media/core/base_usercase/base_auth_usecase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../domain/use_cases/get_userdata_usecase.dart';
import '../../../domain/use_cases/sign_out_usecase.dart';

part 'authentication_event.dart';

part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final BaseAuthRepository _authenticationRepository;
  final SignOutUseCase signOutUseCase;
  final GetUserDataUseCase getUSerDataUseCase;
  UserModel? currentUser;

  AuthenticationBloc(this._authenticationRepository, this.signOutUseCase,
      this.getUSerDataUseCase)
      : super(AuthenticationInitial()) {
    on<GetUSerDataEvent>(_getUserData);
    on<AuthenticationEvent>((event, emit) async {
      if (event is AuthenticationStarted) {
        Stream<User?> stream =
             _authenticationRepository.authChanges(const NoParameter());
        await emit.onEach(stream,
            onData: (user) {
              if (user == null) {
                emit(const AuthenticationFailure());
              } else {
                final userId = user.uid;
               add(GetUSerDataEvent(userId));
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

  Future<FutureOr<void>> _getUserData(
      GetUSerDataEvent event, Emitter<AuthenticationState> emit) async {
    final result = await getUSerDataUseCase(GetUserDataParameter(id: event.id));
    result.fold(
        (l) => emit(
            GetUserDataState(isSuccess: false, errorMsg: l.message ?? l.code)),
        (r) {
      currentUser = r;
      emit(GetUserDataState(isSuccess: true, currentUser: r));
      emit(AuthenticationSuccess(r));
    });
  }
}
