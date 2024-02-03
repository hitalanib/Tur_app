import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tur/layouts/home_layout.dart';
import 'package:tur/screens/signin_screen/cubit/cubit.dart';
import 'package:tur/screens/signin_screen/cubit/states.dart';
import 'package:tur/screens/signup_screen/signup_screen.dart';
import 'package:tur/shared/widgets.dart';

import '../../shared/network/local/cache_helper.dart'; // import this

class SignInScreen extends StatelessWidget {
  var userNameController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SignInCubit(),
      child: BlocConsumer<SignInCubit,SignInStates>(
        listener: (BuildContext context, Object? state) {
          if (state is SignInErrorState) {
            showToast(text: state.error, state: ToastStates.error);
          }
          if (state is SignInSuccessState) {
            navigateAndFinish(context, HomeLayout());
            CashHelper.saveData(key: 'uId', value: state.uId).then((value) {

            });
          }
        },
        builder: (BuildContext context, state) {
          return Form(
            key: formKey,
            child: Scaffold(
              body: Container(
                child: signinContainer(
                  context,
                  buttonTextFunction: () {
                    navigatorTo(context, SignUpScreen());
                  },
                  bottomTittle: 'Don\'t have an account?',
                  buttonTittle: 'Sign up',
                  function: () {
                    if(formKey.currentState!.validate()){
                      SignInCubit.get(context).userLogin(userName: userNameController.text, password: passwordController.text,);
                    }
                  },
                  width: MediaQuery.of(context).size.width * 0.8,
                 // height: 310.0.h,
                  tittle: 'Sign In',
                  myColumn: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      defualtFormField(
                        controller: userNameController,
                        type: TextInputType.text,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'email must not be empty';
                          }
                          return null;
                        },
                        label: 'Email',
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      defualtFormField(
                        controller: passwordController,
                        type: TextInputType.visiblePassword,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'password must not be empty';
                          }
                          return null;
                        },
                        label: 'Password',
                      ),
                      SizedBox(
                        height: 70.h,
                      ),
                      // InkWell(
                      //   onTap: () {},
                      //   child: Text(
                      //     'Forget password?',
                      //     style:
                      //         Theme.of(context).textTheme.headline2!.copyWith(
                      //               fontSize: 12,
                      //             ),
                      //     textAlign: TextAlign.end,
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
