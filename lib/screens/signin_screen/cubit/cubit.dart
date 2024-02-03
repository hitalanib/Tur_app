import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tur/screens/signin_screen/cubit/states.dart';
import 'package:tur/shared/network/Api/endPoints.dart';

import '../../../shared/network/Api/dio_helper.dart';

class SignInCubit extends Cubit<SignInStates>{
  SignInCubit() : super(SignInInitialState());
  static SignInCubit get(context) => BlocProvider.of(context);
  void userLogin({
    required String userName,
    required String password,
  }){
    emit(SignInLoadingState());

    // DioHelper.postData(url: LOGIN, data: {
    //   'user_name':userName,
    //   'password':password,
    // }).then((value) {
    //   print(value?.data);
    //   emit(SignInSuccessState());
    // }).catchError((error) {
    //   print('iam error');
    //   print(error.toString());
    //   emit(SignInErrorState(error.toString()));
    // });
    emit(SignInLoadingState());
    FirebaseAuth.instance.signInWithEmailAndPassword(email: userName, password: password).then((value) {
      print(value.user?.email);
      print(value.user?.uid);
      emit(SignInSuccessState(value.user!.uid));
    }).catchError((onError){
      emit(SignInErrorState(onError.toString()));
    });

  }
  IconData suffix= Icons.visibility_outlined;
  bool isPassword=true;
  void changePasswordVisibility(){
    isPassword =!isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(SignInChangePasswordVisibilityState());
  }

}