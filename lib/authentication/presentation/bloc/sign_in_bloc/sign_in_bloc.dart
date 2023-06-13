import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fast_media/authentication/data/models/user_model.dart';
import 'package:fast_media/core/base_usercase/base_auth_usecase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_platform_interface/src/firebase_auth_exception.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/services/service_locator.dart';
import '../../../domain/use_cases/forget_password_usecase.dart';
import '../../../domain/use_cases/get_userdata_usecase.dart';
import '../../../domain/use_cases/save_userdata_usecase.dart';
import '../../../domain/use_cases/sign_in_with_Apple_usecase.dart';
import '../../../domain/use_cases/sign_in_with_email_usecase.dart';
import '../../../domain/use_cases/sign_in_with_facebook_usecase.dart';
import '../../../domain/use_cases/sign_in_with_google_usecase.dart';

part 'sign_in_event.dart';

part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, FormsValidate> {
  final SignInWithEmailUseCase signInWithEmailUseCase;
  final SignInWithGoogleUseCase signInWithGoogleUseCase;
  final SignInWithFaceBookUseCase signInWithFaceBookUseCase;
  final SignInWithAppleUseCase signInWithAppleUseCase;
  final GetUserDataUseCase getUserDataUseCase;
  final SaveUserDataUseCase saveUserDataUseCase;
  final ForgetPasswordUseCase forgetPasswordUseCase;

  SignInBloc(
    this.signInWithEmailUseCase,
    this.signInWithGoogleUseCase,
    this.signInWithFaceBookUseCase,
    this.signInWithAppleUseCase,
    this.getUserDataUseCase,
    this.saveUserDataUseCase,
    this.forgetPasswordUseCase,
  ) : super(const FormsValidate()) {
    on<SignInPressedEvent>(_signInWithEmail);
    on<GooglePressedEvent>(_signInWithGoogle);
    on<FaceBookPressedEvent>(_signInWithFacebook);
    on<ApplePressedEvent>(_signInWithApple);
    // on<ForgetPasswordPressedEvent>(_forgetPassword);
    on<RememberMePressedEvent>(_rememberMe);
    on<EmailChangesEvent>(_onEmailChanged);
    on<PasswordChangesEvent>(_onPasswordChanged);
    on<GetUSerDataEvent>(_getUserData);
    on<SaveUserDataEvent>(_saveUserData);
    on<ForgetPasswordEvent>(_forgetPassword);
  }

  Future<FutureOr<void>> _signInWithEmail(
      SignInPressedEvent event, Emitter<FormsValidate> emit) async {
    // if (_isFormValid()) {
    emit(state.copyWith(isLoading: true));
    final result = await signInWithEmailUseCase(
      SignInWithEmailParameter(
        email: state.email,
        password: state.password,
      ),
    );
    result.fold((l) {
      print("left : $l");
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: l.message,
        ),
      );
    }, (r) async {
      add(GetUSerDataEvent(r.user!.uid));
    });
    // }
  }

  Future<FutureOr<void>> _signInWithGoogle(
      GooglePressedEvent event, Emitter<FormsValidate> emit) async {
    emit(state.copyWith(isLoading: true));
    final result = await signInWithGoogleUseCase(const NoParameter());
    result.fold(
        (l) => emit(
              state.copyWith(
                isLoading: false,
                errorMessage: l.message,
              ),
            ), (r) async {
      if (r.additionalUserInfo!.isNewUser) {
        final userData = UserModel(
            uid: r.user!.uid,
            imageUrl: r.user?.photoURL,
            isVerified: false,
            email: r.user?.email,
            displayName: r.user?.displayName,
            phone: r.user?.phoneNumber,
            gender: null);
        add(SaveUserDataEvent(userData));
      } else {
        add(GetUSerDataEvent(r.user!.uid));
      }
    });
  }

  Future<FutureOr<void>> _signInWithFacebook(
      FaceBookPressedEvent event, Emitter<FormsValidate> emit) async {
    emit(state.copyWith(isLoading: true));
    final result = await signInWithFaceBookUseCase(const NoParameter());
    result.fold(
        (l) => emit(
              state.copyWith(
                isLoading: false,
                errorMessage: l.message,
              ),
            ), (r) async {
      if (r.additionalUserInfo!.isNewUser) {
        final userData = UserModel(
            uid: r.user!.uid,
            imageUrl: r.user?.photoURL,
            isVerified: false,
            email: r.user?.email,
            displayName: r.user?.displayName,
            phone: r.user?.phoneNumber,
            gender: null);
        add(SaveUserDataEvent(userData));
      } else {
        add(GetUSerDataEvent(r.user!.uid));
      }
    });
  }

  Future<FutureOr<void>> _signInWithApple(
      ApplePressedEvent event, Emitter<FormsValidate> emit) async {
    emit(state.copyWith(isLoading: true));
    final result = await signInWithAppleUseCase(const NoParameter());
    result.fold(
        (l) => emit(
              state.copyWith(
                isLoading: false,
                errorMessage: l.message,
              ),
            ), (r) async {
      if (r.additionalUserInfo!.isNewUser) {
        final userData = UserModel(
            uid: r.user!.uid,
            imageUrl: r.user?.photoURL,
            isVerified: false,
            email: r.user?.email,
            displayName: r.user?.displayName,
            phone: r.user?.phoneNumber,
            gender: null);
        add(SaveUserDataEvent(userData));
      } else {
        add(GetUSerDataEvent(r.user!.uid));
      }
    });
  }

  FutureOr<void> _rememberMe(
      RememberMePressedEvent event, Emitter<FormsValidate> emit) async {}

  FutureOr<void> _onEmailChanged(
      EmailChangesEvent event, Emitter<FormsValidate> emit) {
    emit(state.copyWith(
      email: event.email,
      isEmailValid: _isEmailValid(event.email),
    ));
  }

  FutureOr<void> _onPasswordChanged(
      PasswordChangesEvent event, Emitter<FormsValidate> emit) {
    emit(state.copyWith(
      password: event.password,
      isEmailValid: _isPasswordValid(event.password),
    ));
  }

  final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );

  final RegExp _passwordRegExp = RegExp(
    r'^.{8,}$',
  );

  bool _isEmailValid(String email) {
    return _emailRegExp.hasMatch(email);
  }

  bool _isPasswordValid(String password) {
    return _passwordRegExp.hasMatch(password);
  }

  bool _isFormValid() {
    return state.isEmailValid && state.isPasswordValid;
  }

  /// ToDo : it shoud be saved in localDatabase Hive
  Future<FutureOr<void>> _getUserData(
      GetUSerDataEvent event, Emitter<FormsValidate> emit) async {
    final result = await getUserDataUseCase(
      GetUserDataParameter(
        id: event.id,
      ),
    );
    result.fold(
        (l) => emit(state.copyWith(isLoading: false, errorMessage: l.message)),
        (r) => emit(state.copyWith(isLoading: false)));
  }

  String? validationText() {
    if (state.isEmailValid && state.isPasswordValid) {
      return null;
    } else {
      if (state.isEmailValid) {
        return "please Enter A Valid password";
      } else {
        return "please Enter A Valid password";
      }
    }
  }

  Future<FutureOr<void>> _saveUserData(
      SaveUserDataEvent event, Emitter<FormsValidate> emit) async {
    final result = await saveUserDataUseCase(
        SaveUserDataParameter(userData: event.userModel));
    result.fold(
        (l) => emit(state.copyWith(isLoading: false, errorMessage: l.message)),
        (r) => emit(state.copyWith(isLoading: false)));
  }

  Future<FutureOr<void>> _forgetPassword(
      ForgetPasswordEvent event, Emitter<FormsValidate> emit) async {
    final result = await forgetPasswordUseCase(
        ForgetPasswordParameter(email: event.email));
    result.fold(
        (l) => emit(state.copyWith(
            isLoading: false,
            errorMessage: l.message,
            forgetPasswordValidEmail: false)), (r) {
      emit(state.copyWith(isLoading: false));
      emit(const ForgetPasswordSuccess());
    });
  }
}
