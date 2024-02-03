import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tur/layouts/home_layout.dart';
import 'package:tur/screens/explore_detail_screen.dart';
import 'package:tur/screens/signin_screen/signin_screen.dart';
import 'package:tur/screens/signup_screen/cubit/cubit.dart';
import 'package:tur/screens/signup_screen/cubit/states.dart';
import 'package:tur/shared/network/local/cache_helper.dart';
import 'package:tur/shared/style/colors.dart';
import 'package:tur/shared/widgets.dart';

class SignUpScreen extends StatelessWidget {
  var nameController = TextEditingController();
  var userNameController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var emailController = TextEditingController();
  var phoneNumberController = TextEditingController();
  var addressNumberController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool checkBoxValue = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SignUpCubit(),
      child: BlocConsumer<SignUpCubit, SignUpStates>(
        listener: (context, state) {
          if (state is SignUpCreateUserSuccessState) {
            CashHelper.saveData(key: 'uId', value: state.uId).then((value) {
              navigateAndFinish(context, SignInScreen());
            });
          }
        },
        builder: (context, state) {
          return Form(
            key: formKey,
            child: Scaffold(
              body: Container(
                child: signinContainer(
                  context,
                  buttonTextFunction: () {
                    navigatorTo(context, SignInScreen());
                  },
                  bottomTittle: 'already have an account?',
                  buttonTittle: 'Login',
                  function: () {
                    if (formKey.currentState!.validate()) {
                      SignUpCubit.get(context).userRegister(
                        name: nameController.text,
                        email: emailController.text,
                        password: passwordController.text,
                        phone: phoneNumberController.text,
                        confirmPassword: confirmPasswordController.text,
                        address: addressNumberController.text, userName: userNameController.text,

                      );
                    }
                  },
                  width: MediaQuery.of(context).size.width * 0.8,
                  //height: 500.0.h,
                  tittle: 'Sign Up',
                  myColumn: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      defualtFormField(
                        controller: nameController,
                        type: TextInputType.name,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'please enter your name';
                          }
                          return null;
                        },
                        label: 'Name',
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      defualtFormField(
                        controller: userNameController,
                        type: TextInputType.text,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'Username must not be empty';
                          }
                          return null;
                        },
                        label: 'Username',
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      defualtFormField(
                        controller: emailController,
                        type: TextInputType.emailAddress,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'email must not be empty';
                          } else if (!value.contains('@')) {
                            return 'Please enter a valid email';
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
                        height: 15.h,
                      ),
                      defualtFormField(
                        controller: confirmPasswordController,
                        type: TextInputType.visiblePassword,
                        validate: (value) {
                          if (value!.isEmpty ||
                              value.toString() != passwordController.text) {
                            return 'Password does not match';
                          }
                          return null;
                        },
                        label: 'ConfirmPassword',
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      defualtFormField(
                        controller: phoneNumberController,
                        type: TextInputType.phone,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'please enter your phone number';
                          }
                          return null;
                        },
                        label: 'Phone Number',
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      defualtFormField(
                        controller: addressNumberController,
                        type: TextInputType.text,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'please enter your address';
                          }
                          return null;
                        },
                        label: 'Address',
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      // Flex(
                      //   direction: Axis.horizontal,
                      //   children: [
                      //     Flexible(
                      //       flex: 1,
                      //       child: Container(
                      //         decoration: BoxDecoration(
                      //             shape: BoxShape.circle, color: Colors.blue),
                      //         child: checkBoxValue
                      //             ? Icon(
                      //                 Icons.check,
                      //                 size: 15.0,
                      //                 color: Colors.white,
                      //               )
                      //             : Icon(
                      //                 Icons.check_box_outline_blank,
                      //                 size: 15.0,
                      //                 color: Colors.blue,
                      //               ),
                      //       ),
                      //     ),
                      //     SizedBox(
                      //       width: 10.w,
                      //     ),
                      //     Flexible(
                      //       flex: 1,
                      //       child: Text(
                      //         'I agree the',
                      //         style: Theme.of(context)
                      //             .textTheme
                      //             .subtitle1!
                      //             .copyWith(fontSize: 10),
                      //       ),
                      //     ),
                      //     Flexible(
                      //       flex: 2,
                      //       child: InkWell(
                      //         onTap: () {},
                      //         child: Text(
                      //           'Terms & Conditions',
                      //           style: Theme.of(context)
                      //               .textTheme
                      //               .headline2
                      //               ?.copyWith(fontSize: 10),
                      //           textAlign: TextAlign.end,
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      const SizedBox(
                        height: 50,
                      ),
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
