import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tur/screens/signup_screen/cubit/states.dart';

import '../../../models/user_model.dart';
import '../../../shared/network/Api/dio_helper.dart';
import '../../../shared/network/Api/endPoints.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(SignUpInitialState());

  static SignUpCubit get(context) => BlocProvider.of(context);

  void userRegister({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String confirmPassword,
    required String address,
    required String userName,
  }) {
    emit(SignUpLoadingState());
    // UserModel userModel = UserModel(
    //   email: email,
    //   password: password,
    //   name: name,
    //   phone: phone,
    //   cityId: 1,
    //   passwordConfirmation: confirmPassword,
    //   address1: address,
    //   address2: address,
    //   address3: address,
    //   userName: userName,
    // );
    // // DioHelper.postData(url: REGISTER, data: userModel.toJson()).then((value) {
    //   print(value?.data);
    //   emit(SignUpSuccessState());
    // }).catchError((error) {
    //   print('iam error');
    //   print(error.toString());
    //   emit(SignUpErrorState(error.toString()));
    // });
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print(value.user?.email);
      print(value.user?.uid);
      userCreate(name: name, email: email, uId: value.user!.uid, phone: phone);
    }).catchError((onError) {
      print('iam error');
      print(onError.toString());
      emit(SignUpErrorState(onError.toString()));
    });
  }

  void userCreate({
    required String name,
    required String email,
    required String uId,
    required String phone,
  }) {
    UserModel model = UserModel(
      uId: uId,
      email: email,
      name: name,
      phone: phone,
      isEmailVerified: false,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toMap())
        .then((value) {
      emit(SignUpCreateUserSuccessState(uId));
    }).catchError((onError) {
      emit(SignUpCreateUserErrorState(onError.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ChangePasswordVisibilityState());
  }
}
