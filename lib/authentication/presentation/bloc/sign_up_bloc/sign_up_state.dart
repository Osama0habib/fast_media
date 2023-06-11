part of 'sign_up_bloc.dart';

class SignUpState extends Equatable {
  final String email;
  final String password;
  final String phone;
  final String userName;
  final bool isEmailValid;
  final bool isPasswordValid;
  final bool isPhoneValid;
  final bool isUserNameValid;
  final bool isLoading;
  final String errorMessage;


  const SignUpState({this.email = "",
    this.password = "",
    this.phone = "",
    this.userName = "",
    this.isEmailValid = true,
    this.isPasswordValid = true,
    this.isPhoneValid = true,
    this.isUserNameValid = true,
    this.isLoading = false,
    this.errorMessage = ""});

  SignUpState copyWith({String? email,
    String? password,
    String? phone,
    String? userName,
    bool? isEmailValid,
    bool? isPasswordValid,
    bool? isPhoneValid,
    bool? isUserNameValid,
    bool? isLoading,
    String? errorMessage,}) {
    return SignUpState(
      email: email ?? this.email,
      password: password ?? this.password,
      phone: phone ?? this.phone,
      userName: userName ?? this.userName,
      isEmailValid: isEmailValid ?? this.isEmailValid,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      isPhoneValid: isPhoneValid ?? this.isPhoneValid,
      isUserNameValid: isUserNameValid ?? this.isUserNameValid,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props =>
      [
        email,
        password,
        phone,
        userName,
        isEmailValid,
        isPasswordValid,
        isPhoneValid,
        isUserNameValid,
        isLoading,
        errorMessage,
      ];
}


