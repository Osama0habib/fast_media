part of 'sign_in_bloc.dart';

abstract class SignInState extends Equatable {
  const SignInState();
}

class SignInInitial extends SignInState {
  @override
  List<Object> get props => [];
}

class FormsValidate extends SignInState {
  const FormsValidate(
      {this.email = "",
      this.password = "",
      this.isEmailValid = true,
      this.isPasswordValid = true,
      this.isLoading = false,
      this.errorMessage = "",});

  final String email;
  final String password;
  final bool isEmailValid;
  final bool isPasswordValid;
  final bool isLoading;
  final String errorMessage;

  FormsValidate copyWith(
      {String? email,
      String? password,
      bool? isEmailValid,
      bool? isPasswordValid,
      bool? isLoading,
      String? errorMessage,}) {
    return FormsValidate(
        email: email ?? this.email,
        password: password ?? this.password,
        isEmailValid: isEmailValid ?? this.isEmailValid,
        isPasswordValid: isPasswordValid ?? this.isPasswordValid,
        isLoading: isLoading ?? this.isLoading,
        errorMessage: errorMessage ?? this.errorMessage,
);
  }

  @override
  List<Object?> get props => [
        email,
        password,
        isEmailValid,
        isPasswordValid,
        isLoading,
        errorMessage,

      ];
}
