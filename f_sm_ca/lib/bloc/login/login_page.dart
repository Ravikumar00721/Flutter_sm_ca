import 'package:f_sm_ca/bloc/login/bloc/login_event.dart';
import 'package:f_sm_ca/bloc/login/bloc/login_state.dart';
import 'package:f_sm_ca/bloc/login/model/login_req_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/login_bloc.dart';
class LoginBlocScreen extends StatefulWidget {
  const LoginBlocScreen({super.key});

  @override
  State<LoginBlocScreen> createState() => _LoginBlocScreenState();
}

class _LoginBlocScreenState extends State<LoginBlocScreen> {

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {

    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Screen"),
      ),
      body: BlocBuilder<LoginBloc,LoginState>(
        builder: (BuildContext context, state) {
          if(state is LoginInitialState)
            {
              return Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    TextField(
                      controller: usernameController,
                      decoration: const InputDecoration(
                        labelText: "Username",
                        border: OutlineInputBorder(),
                      ),
                    ),

                    const SizedBox(height: 16),

                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: "Password",
                        border: OutlineInputBorder(),
                      ),
                    ),

                    const SizedBox(height: 16),

                    ElevatedButton(
                      onPressed: () {
                        final username = usernameController.text;
                        final password = passwordController.text;

                        BlocProvider.of<LoginBloc>(context)
                            .add(LoginReqEvent(loginReqModel:LoginReqModel(username: username,password: password)));
                      },
                      child: const Text("Login"),
                    ),
                  ],
                ),
              );
            }
          else if( state is LoginLoadingState)
            {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          else if(state is LoginLoadedState){
            return Text(state.loginResModel.username!);
          }
          else if(state is LoginErrorState){
            return Text(state.errorMessage);
          }
          else {
            return Container();
          }
        }
      ),
    );
  }
}
