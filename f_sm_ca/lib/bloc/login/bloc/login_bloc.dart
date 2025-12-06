import 'package:f_sm_ca/bloc/login/bloc/login_event.dart';
import 'package:f_sm_ca/bloc/login/bloc/login_state.dart';
import 'package:f_sm_ca/bloc/login/model/login_response_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repo/login_repo.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitialState()) {
    on<LoginReqEvent>((event, emit) async {
      emit(LoginLoadingState());

      try {
        LoginResModel loginResModel = await LoginRepo().login(
          event.loginReqModel.username!,
          event.loginReqModel.password!,
        );

        emit(LoginLoadedState(loginResModel: loginResModel));
      } catch (e) {
        emit(LoginErrorState(errorMessage: e.toString()));
      }
    });
  }
}
