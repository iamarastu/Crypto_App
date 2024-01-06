import 'package:crypto_app/core/Shared/Widgets/Button/PFButton.dart';
import 'package:crypto_app/core/Shared/Widgets/Textfield/PFTextField.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 150),
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
              hint: "Name", 
              controller: name, 
              onChanged: (){}, 
              validator: (){}, 
              inputAction: TextInputAction.next),

              const SizedBox(height: 10,),
              PFTextField(
              hint: "Phone", 
              controller: phone, 
              onChanged: (){}, 
              validator: (){}, 
              inputAction: TextInputAction.next),
              const SizedBox(height: 10,),
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
              const SizedBox(height: 10,),
              PFTextField(
              hint: "Confirm Password", 
              controller: confirmPassword, 
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
                      },
                      isProcessing:false,
                      //     (state.runtimeType == LoginRequestProcessingState &&
                      //         state.runtimeType != LoginRequestErrorState),
                      title: "Register",
                      icon: null,
                      isSecondary: false,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already have a account?",
                        style: TextStyle(color: Colors.white),),
                        TextButton(
                          onPressed: () {},
                          child: TextButton(
                              onPressed: () {
                                // loginBloc.add(LoginNavigateToRegisterEvent());
                              },
                              child: const Text(
                                "Sign In",
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
  }
}