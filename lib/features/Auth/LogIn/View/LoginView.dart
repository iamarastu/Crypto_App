import 'package:crypto_app/core/Shared/Widgets/Button/PFButton.dart';
import 'package:crypto_app/core/Shared/Widgets/Textfield/PFTextField.dart';
import 'package:crypto_app/features/Auth/LogIn/Bloc/login_bloc.dart';
import 'package:crypto_app/features/Auth/LogIn/Model/LoginRequestModel.dart';
import 'package:crypto_app/features/Auth/Register/View/RegisterView.dart';
import 'package:crypto_app/features/Tabs/View/TabsView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final LoginBloc loginBloc = LoginBloc();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      bloc : loginBloc,
      listenWhen: (previous, current) => current is LoginActionState,
      buildWhen: (previous, current) => current is! LoginActionState,
      listener: (context, state) async {
        if (state is LoginNavigateToRegisterActionState) {
         Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterView()),);
        } else if (state is LoginNavigateToForgetPasswordActionState) {
          Navigator.pushNamed(context, '/forgetPassword');
        } else if (state is LoginNavigateToTabsActionState) {
          Navigator.pushReplacementNamed(context, '/tabs');
        }
      },
      builder: (context, state){
        return Scaffold(
      body: SingleChildScrollView(
        child: Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 300),
          child: Container(
            alignment: Alignment.center,
            child:  Column(
              children: [
                const Padding(padding: EdgeInsets.only(right: 15),
                child:  Text(
              "CRYPT APP",
              style: TextStyle(
                color: Colors.white,
                fontSize: 48,
                
                shadows: [
                  Shadow(
                    color: Colors.grey, // Choose the color of the shadow
                    blurRadius:
                        2.0, // Adjust the blur radius for the shadow effect
                    offset: Offset(4.0,
                        4.0), // Set the horizontal and vertical offset for the shadow
                  ),
                ],
              ),
            ),
                )
            ,const SizedBox(height: 50,),
            PFTextField(
              hint: "Email", 
              controller: email, 
              onChanged: (){}, 
              validator: (){}, 
              inputAction: TextInputAction.next),

              const SizedBox(height: 10,),
              PFTextField(
              hint: "Password", 
              controller: password, 
              onChanged: (){}, 
              validator: (){}, 
              inputAction: TextInputAction.next),

              Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        children: [
                          TextButton(
                              onPressed: () {
                                // loginBloc
                                //     .add(LoginNavigateToForgetPasswordEvent());
                              },
                              child: const Text(
                                "Forget Password",
                                style: TextStyle(color: Color(0xff96CFFF)),
                              )),
                        ],
                      ),
                    ),
                    PFButton(
                      onPressed: () {
                        // loginBloc.add(LoginRequestedEvent(
                        //     loginRequest: LoginRequest(
                        //         email: email.text, password: password.text)));
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const TabsView()),);
                      },
                      isProcessing:false,
                      //     (state.runtimeType == LoginRequestProcessingState &&
                      //         state.runtimeType != LoginRequestErrorState),
                      title: "Login",
                      icon: null,
                      isSecondary: false,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have a account?",
                        style: TextStyle(color: Colors.white),),
                        TextButton(
                          onPressed: () {},
                          child: TextButton(
                              onPressed: () {
                                loginBloc.add(LoginNavigateToRegisterEvent());
                              },
                              child: const Text(
                                "Sign Up",
                                style: TextStyle(color: Color(0xff96CFFF)),
                              )),
                        ),
                      ],
                    )
              ],
            )
          ),
          
        )),
      ),
    );

      },
    );
    
  }
}
