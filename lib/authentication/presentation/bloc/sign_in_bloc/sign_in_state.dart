part of 'sign_in_bloc.dart';

abstract class SignInState extends Equatable {
  const SignInState();
}

class SignInInitial extends SignInState {
  @override
  List<Object> get props => [];
}

class FormsValidate extends SignInState {
  const FormsValidate({this.email = "",
    this.password = "",
    this.isEmailValid = true,
    this.isPasswordValid = true,
    this.isLoading = false,
    this.errorMessage = "",
    this.forgetPasswordValidEmail = false,
    this.forgetPasswordValidCode = false,});

  final String email;
  final String password;
  final bool isEmailValid;
  final bool isPasswordValid;
  final bool isLoading;
  final String errorMessage;
  final bool forgetPasswordValidEmail;

  final bool forgetPasswordValidCode;

  FormsValidate copyWith({String? email,
    String? password,
    bool? isEmailValid,
    bool? isPasswordValid,
    bool? isLoading,
    bool? forgetPasswordValidEmail,
    bool? forgetPasswordValidCode,
    String? errorMessage,}) {
    return FormsValidate(
      email: email ?? this.email,
      password: password ?? this.password,
      isEmailValid: isEmailValid ?? this.isEmailValid,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      forgetPasswordValidEmail: forgetPasswordValidEmail ??
          this.forgetPasswordValidEmail,
      forgetPasswordValidCode: forgetPasswordValidCode ??
          this.forgetPasswordValidCode,
    );
  }

  @override
  List<Object?> get props =>
      [
        email,
        password,
        isEmailValid,
        isPasswordValid,
        isLoading,
        errorMessage,
        forgetPasswordValidEmail,
        forgetPasswordValidCode,

      ];
}

class ForgetPasswordSuccess extends FormsValidate {
  const ForgetPasswordSuccess();

  @override
  List<Object> get props => [];
}
