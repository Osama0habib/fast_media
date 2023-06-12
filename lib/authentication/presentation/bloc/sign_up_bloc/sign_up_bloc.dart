import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fast_media/authentication/presentation/bloc/sign_in_bloc/sign_in_bloc.dart';

import '../../../data/models/user_model.dart';
import '../../../domain/use_cases/save_userdata_usecase.dart';
import '../../../domain/use_cases/sign_up_with_email_usecase.dart';

part 'sign_up_event.dart';

part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final SignUpWithEmailUseCase signUpWithEmailUseCase;
  final SaveUserDataUseCase saveUserDataUseCase;

  SignUpBloc(this.signUpWithEmailUseCase, this.saveUserDataUseCase)
      : super(const SignUpState()) {
    on<SignUpWithEmailEvent>(_signUpWithEmail);
    on<EmailChangesEvent>(_onEmailChange);
    on<PasswordChangesEvent>(_onPasswordChange);
    on<UserNameChangesEvent>(_onUserNameChange);
    on<PhoneChangesEvent>(_onPhoneChange);
    on<SaveUserDataEvent>(_saveUserData);
  }

  Future<FutureOr<void>> _signUpWithEmail(
      SignUpWithEmailEvent event, Emitter<SignUpState> emit) async {
    emit(state.copyWith(isLoading: true));
    print(_isFormValid());
    if (_isFormValid()) {
      final result = await signUpWithEmailUseCase(SignUpWithEmailParameter(
          email: event.email, password: event.password));
      result.fold(
          (l) =>
              emit(state.copyWith(isLoading: false, errorMessage: l.message)),
          (r) {
        final UserModel userModel = UserModel(
          uid: r.user!.uid,
          imageUrl: null,
          isVerified: false,
          email: event.phone,
          displayName: event.userName,
          phone: event.phone,
          gender: null,
        );
        add(SaveUserDataEvent(userModel));
      });
    }
  }

  FutureOr<void> _onEmailChange(
      EmailChangesEvent event, Emitter<SignUpState> emit) {
    emit(state.copyWith(
      email: event.email,
      isEmailValid: _isEmailValid(event.email),
    ));
  }

  FutureOr<void> _onPasswordChange(
      PasswordChangesEvent event, Emitter<SignUpState> emit) {
    emit(state.copyWith(
      password: event.password,
      isPasswordValid: _isPasswordValid(event.password),
    ));
  }

  FutureOr<void> _onUserNameChange(
      UserNameChangesEvent event, Emitter<SignUpState> emit) {
    emit(state.copyWith(
      userName: event.useName,
      isUserNameValid: _isUserNameValid(event.useName),
    ));
  }

  FutureOr<void> _onPhoneChange(
      PhoneChangesEvent event, Emitter<SignUpState> emit) {
    emit(state.copyWith(
      phone: event.phone,
      isPhoneValid: _isPhoneValid(event.phone),
    ));
  }

  final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );

  final RegExp _passwordRegExp = RegExp(
    r'^.{8,}$',
  );

  // final RegExp _userNameRegExp =
  //     RegExp(r'^(?=[a-zA-Z0-9._]{5,20}$)(?!.*[_.]{2})[^_.].*[^_.]$');
  //
  // final RegExp _phoneRegExp = RegExp(r'^(?:[+0]9)?[0-9]{10}$');

  bool _isPhoneValid(String phone) {
    return phone.length >= 11 ;
  }

  bool _isUserNameValid(String userName) {
    return userName.isNotEmpty;
  }

  bool _isEmailValid(String email) {
    return _emailRegExp.hasMatch(email);
  }

  bool _isPasswordValid(String password) {
    return _passwordRegExp.hasMatch(password);
  }

  bool _isFormValid() {
    print("state.isEmailValid : ${state.isEmailValid} , state.isPasswordValid : ${state.isPasswordValid} , state.isUserNameValid : ${state.isUserNameValid} , state.isPhoneValid : ${state.isPhoneValid}");
    return state.isEmailValid &&
        state.isPasswordValid &&
        state.isUserNameValid &&
        state.isPhoneValid;
  }

  Future<FutureOr<void>> _saveUserData(
      SaveUserDataEvent event, Emitter<SignUpState> emit) async {
    final result = await saveUserDataUseCase(
        SaveUserDataParameter(userData: event.userModel));
    result.fold(
        (l) => emit(state.copyWith(isLoading: false, errorMessage: l.message)),
        (r) => emit(state.copyWith(isLoading: false)));
  }
}
