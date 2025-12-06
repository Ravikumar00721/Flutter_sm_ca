import 'package:equatable/equatable.dart';
import '../model/login_req_model.dart';
import '../model/login_response_model.dart';

abstract class LoginState extends Equatable{}

class LoginInitialState extends LoginState{
  @override
  List<Object?> get props => [];
}

class LoginLoadingState extends LoginState{
  @override
  List<Object?> get props => [];
}


class LoginLoadedState extends LoginState{

  LoginResModel loginResModel;

  LoginLoadedState( {required this.loginResModel});

  @override
  List<Object?> get props => [loginResModel];
}


class LoginErrorState extends LoginState{
  String errorMessage;
  LoginErrorState({required this.errorMessage}  );

  @override
  List<Object?> get props => [errorMessage];
}