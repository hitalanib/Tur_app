import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tur/layouts/cubit/cubit.dart';
import 'package:tur/layouts/cubit/states.dart';
import 'package:tur/screens/favorites_screen.dart';
import 'package:tur/screens/profile/profile_screen.dart';
import 'package:tur/screens/signin_screen/signin_screen.dart';
import 'package:tur/shared/widgets.dart';

import '../shared/style/colors.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TurAppCubit, TurAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var profileImage = TurAppCubit.get(context).profileImage;
        var cubit = TurAppCubit.get(context).userModel;

        return Scaffold(
          backgroundColor: backgroundColor,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          'Account',
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(fontSize: 36.sp),
                        ),
                      ),
                      CircleAvatar(
                        radius: 45,
                        backgroundColor:
                        Theme.of(context).scaffoldBackgroundColor,
                        child: CircleAvatar(
                          radius: 42,
                          backgroundImage: profileImage == null ? NetworkImage('${cubit!.image}') : FileImage(profileImage)as ImageProvider,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  pickRow(
                    context,
                    text: 'Profile',
                    icon: Icons.person_outlined,
                    function: () {
                      navigatorTo(context, ProfileScreen());
                    },
                  ),
                  myDivider(),
                  pickRow(
                    context,
                    text: 'Favorites',
                    icon: Icons.favorite_border_outlined,
                    function: () {
                      navigatorTo(context, FavoritesScreen());
                    },
                  ),
                  myDivider(),
                  SizedBox(
                    height: 30.h,
                  ),
                  signOutButton(
                      context: context,
                      function: () {
                       // TurAppCubit.get(context).signOut(cubit!.uId,context);
                      },
                      text: 'Sign Out'),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

Widget pickRow(
  context, {
  required IconData icon,
  required String text,
  required Function()? function,
}) {
  return InkWell(
    onTap: function,
    child: Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 20.0,
      ),
      child: Row(
        children: [
          SizedBox(
            width: 30.w,
            height: 30.h,
            child: Icon(
              icon,
              size: 30,
            ),
          ),
          SizedBox(
            width: 20.w,
          ),
          Expanded(
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    fontSize: 20.sp,
                  ),
            ),
          ),
          Spacer(),
          Icon(Icons.arrow_forward_ios),
        ],
      ),
    ),
  );
}

Widget signOutButton({
  context,
  double width = double.infinity,
  bool isUpperCase = true,
  required Function()? function,
  required String text,
}) =>
    Container(
      width: width,
      height: 65.0.h,
      child: OutlinedButton(
        onPressed: function,
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyText2,
        ),
        style: OutlinedButton.styleFrom(
          backgroundColor: backgroundColor,
          primary: lightGrey,
          side: BorderSide(width: 2.w, color: myBlack),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
      ),
    );
