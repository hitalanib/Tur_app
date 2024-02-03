import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tur/layouts/cubit/cubit.dart';
import 'package:tur/layouts/cubit/states.dart';
import 'package:tur/shared/appbar.dart';
import 'package:tur/shared/style/colors.dart';
import 'package:tur/shared/widgets.dart';

class ProfileScreen extends StatelessWidget {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TurAppCubit, TurAppStates>(
  listener: (context, state) {
  },
  builder: (context, state) {
    var isEdit= TurAppCubit.get(context).isEdit;
    var cubit = TurAppCubit.get(context).userModel;
    var profileImage=TurAppCubit.get(context).profileImage;
    nameController.text= cubit!.name!;
    phoneController.text = cubit.phone!;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: myAppBar(tittle: 'PROFILE',action: TextButton(
        onPressed: () {
          TurAppCubit.get(context).changeAppMode();
          (isEdit==true ) ?TurAppCubit.get(context).updateUser(name: nameController.text, phone: phoneController.text,): null;
          (isEdit==true && state is AppChangeAppModeState && TurAppCubit.get(context).profileImage != null) ?TurAppCubit.get(context).uploadProfileImage(name: nameController.text, phone: phoneController.text,): null;
        },
        child: (isEdit) ?Text(
          'Save',
          style: Theme.of(context).textTheme.subtitle1!.copyWith(fontSize: 15,),
        ):Text(
          'Edit',
          style: Theme.of(context).textTheme.subtitle1!.copyWith(fontSize: 15,),
        ),
      ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_outlined),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body:
      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child:
          Column(
            children: [
              if(state is TurAppUserUpdateLoadingState)
                LinearProgressIndicator(color: lightGreen,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 20.h,),
                  isEdit ? circleAvatar(context,profileImage: profileImage,isEdit: true,) :circleAvatar(context,profileImage: profileImage) ,
                  SizedBox(height: 100.h,),
                  isEdit ? defualtFormField(controller: nameController, type: TextInputType.text, validate: (String){}, label: 'UserName',readOnly: false,): defualtFormField(controller: nameController, type: TextInputType.text, validate: (String){}, label: 'UserName',readOnly: true,),
                  SizedBox(height: 20.h,),
                  isEdit ?defualtFormField(controller: phoneController, type: TextInputType.text, validate: (String){}, label: 'Phone',readOnly: false,):defualtFormField(controller: phoneController, type: TextInputType.text, validate: (String){}, label: 'Phone',readOnly: true,),
                ]
              ),
            ],
          ),
        ),
      ),
    );
  },
);
  }
}
