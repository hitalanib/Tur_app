import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:tur/layouts/cubit/cubit.dart';
import 'dart:math' as math;
import 'package:tur/shared/style/colors.dart';
import 'package:tur/shared/waveclipper.dart';

Widget defualtFormField({
  required TextEditingController controller,
  required TextInputType type,
  required String? Function(String?)? validate,
  required String label,
  IconData? prefixIcon,
  Function(String)? onSubmit,
  Function(String)? onChanged,
  IconData? suffixIcon,
  bool isPassword = false,
  Function()? suffixPressed,
  Function()? onTap,
  bool readOnly = false,
}) =>
    TextFormField(
      style: TextStyle(
        fontSize: 18.sp,
        color: myBlack,
      ),
      textAlign: TextAlign.start,
      cursorHeight: 20.h,
      controller: controller,
      keyboardType: type,
      onTap: onTap,
      readOnly: readOnly,
      obscureText: isPassword,
      onFieldSubmitted: onSubmit,
      onChanged: onChanged,
      validator: validate,
      cursorColor: const Color(0xFFB7B7B8),
      decoration: InputDecoration(
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFB7B7B8),
          ),
        ),
        labelStyle: TextStyle(
          color: Color(0xFFB7B7B8),
          fontSize: 14.sp,
        ),
        alignLabelWithHint: true,
        labelText: label,
        floatingLabelAlignment: FloatingLabelAlignment.start,
        floatingLabelStyle: const TextStyle(fontSize: 16),
        prefixIcon: Icon(
          prefixIcon,
        ),
        suffixIcon: suffixIcon != null
            ? IconButton(
                onPressed: suffixPressed,
                icon: Icon(
                  suffixIcon,
                ),
              )
            : null,
      ),
    );
Widget defaultTextButton({
  context,
  required Function()? function,
  required String text,
  required bool activeColor,
}) =>
    TextButton(
      onPressed: function,
      child: Text(
        text.toUpperCase(),
        style: activeColor
            ? Theme.of(context).textTheme.subtitle2?.copyWith(color: lightBlue)
            : Theme.of(context).textTheme.subtitle2,
      ),
    );
Widget defualtTextButton(
  context, {
  required Function()? function,
  required String text,
}) =>
    TextButton(
      onPressed: function,
      child: Text(
        text,
        style: Theme.of(context).textTheme.subtitle1!.copyWith(
              fontSize: 15,
            ),
      ),
    );
Widget signinContainer(
  context, {
  required Widget myColumn,
  required String tittle,
  required String bottomTittle,
  required String buttonTittle,
  required dynamic width,
      double? height,
  required Function()? function,
  required Function()? buttonTextFunction,
  bool isSignUp = true,
}) =>
    Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              lightGreen,
              lightBlue,
              lightBlue,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: 20.h,
                  ),
                  Center(
                    child: Image(
                      image: AssetImage('assests/images/logo.png'),
                      height: 90.0.h,
                      width: 90.0.w,
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationX(math.pi),
                    child: Container(
                      width: width,
                     // height: height,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadiusDirectional.circular(50.0),
                      ),
                      child: Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.rotationX(math.pi),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 60.0,
                            vertical: 20,
                          ),
                          child: Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    tittle,
                                    style:
                                        Theme.of(context).textTheme.headline1,
                                  ),
                                  myColumn,
                                ],
                              ),
                              SizedBox(
                                width: 50.w,
                                height: 50.h,
                                child: FloatingActionButton(
                                  backgroundColor: const Color(0xFF7DDDF0),
                                  onPressed: function,
                                  child: const Icon(
                                    Icons.arrow_forward,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        bottomTittle,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                        ),
                      ),
                      TextButton(
                        onPressed: buttonTextFunction,
                        child: Text(
                          buttonTittle,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
    (route) => false);
void navigatorTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );
Widget circleAvatar(context, {required var profileImage, bool isEdit = true}) {
  return Stack(
    alignment: Alignment.center,
    children: [
      ClipOval(
        child: Opacity(
          opacity: 0.1,
          child: Container(
            color: lightGrey,
            height: 190.h,
            width: 190.w,
          ),
        ),
      ),
      ClipOval(
        child: Container(
          color: Colors.white,
          width: 180.w,
          height: 180.h,
        ),
      ),
      ClipOval(
        child: Container(
          height: 170.h,
          width: 170.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(4),
              topLeft: Radius.circular(4),
            ),
            image: DecorationImage(
              image: profileImage == null
                  ? NetworkImage(
                      'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',
                    )
                  : FileImage(profileImage) as ImageProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      isEdit ?   Positioned(
        bottom: 15,
        right: 15,
        child: ClipOval(
          child: Container(
            color: lightBlue,
            child: IconButton(
              onPressed: () {
                print('i am pressed');
                TurAppCubit.get(context).onProfileImageButtonPressed();
              },
              color: Colors.white,
              icon: Icon(Icons.camera_alt),
            ),
            width: 40.w,
            height: 40.h,
          ),
        ),
      ):Container(),
    ],
  );
}

Widget textFormFieldOnly({
  required String tittle,
  required String inputText,
}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        tittle,
        style: TextStyle(
          color: lightGrey,
        ),
      ),
      SizedBox(
        height: 5,
      ),
      Text(
        inputText,
        style: TextStyle(
          color: Colors.black,
          fontSize: 24,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Container(
        color: lightGrey.withOpacity(.4),
        width: double.infinity,
        height: 2,
      ),
    ],
  );
}

Widget imageWithGradient({
  required String image,
  required double height,
  double width = double.infinity,
}) {
  return Stack(
    children: [
      Container(
        width: width,
        height: height,
        child: Image.asset(
          image,
          fit: BoxFit.cover,
        ),
      ),
      Container(
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          gradient: LinearGradient(
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter,
            colors: [
              lightGreen.withOpacity(0.1),
              lightGrey.withOpacity(0.2),
              lightGreen.withOpacity(0.3),
              lightGreen.withOpacity(0.4),
              lightGreen.withOpacity(0.5),
            ],
          ),
        ),
      ),
    ],
  );
}

Widget networkImageWithGradient({
  required String image,
  required double height,
  double width = double.infinity,
}) {
  return Stack(
    children: [
      Container(
        width: width,
        height: height,
        child: Image.network(
          image,
          fit: BoxFit.cover,
        ),
      ),
      Container(
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          gradient: LinearGradient(
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter,
            colors: [
              lightGreen.withOpacity(0.1),
              lightGrey.withOpacity(0.2),
              lightGreen.withOpacity(0.3),
              lightGreen.withOpacity(0.4),
              lightGreen.withOpacity(0.5),
            ],
          ),
        ),
      ),
    ],
  );
}

Widget defualtButton({
  context,
  Color color = backgroundColor,
  bool isUpperCase = true,
  bool withIcon = true,
  required Function()? function,
  required String text,
}) =>
    Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: lightGrey.withOpacity(.1),
            offset: const Offset(4.0, 4.0),
            blurRadius: 5,
            spreadRadius: 1,
          ),
          BoxShadow(
            color: lightGrey.withOpacity(.1),
            offset: const Offset(-4.0, -4.0),
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
        child: MaterialButton(
          onPressed: function,
          child: Row(
            children: [
              withIcon
                  ? SizedBox(
                      width: 18.w,
                      height: 18.h,
                      child: Icon(
                        Icons.menu,
                        size: 18,
                      ))
                  : Container(),
              withIcon
                  ? SizedBox(
                      width: 10.w,
                    )
                  : Container(),
              Text(
                isUpperCase ? text.toUpperCase() : text,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(fontSize: 16.sp),
              ),
            ],
          ),
        ),
      ),
    );
Widget curveImageWithList(
    {context,
    required String image,
    String? tittle,
    bool tittleAppear = false,
    List<String>? images}) {
  return Stack(
    alignment: Alignment.bottomCenter,
    children: [
      ClipPath(
        clipper: CurvesClipper(),
        child: networkImageWithGradient(
          image: image,
          height: 310.h,
        ),
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          tittleAppear
              ? Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Center(
                    child: SizedBox(
                      width: 300.w,
                      child: Text(
                        tittle!,
                        style: Theme.of(context)
                            .textTheme
                            .headline2
                            ?.copyWith(color: backgroundColor),
                      ),
                    ),
                  ),
                )
              : Container(),
          SizedBox(
            height: 170.h,
            child: buildSnapList(context, images!),
          ),
        ],
      ),
    ],
  );
}

Widget buildSnapList(context, List<String> images) {
  print('iam here 2');
  print(images);
  return ScrollSnapList(
    itemSize: 170,
    onItemFocus: (int) {},
    itemCount: images.length,
    dynamicItemSize: true,
    itemBuilder: (BuildContext context, int index) =>
        buildSnapListItem(context, images[index]),
  );
}

Widget buildSnapListItem(context, image) {
  print('iam here 3');
  print(image);
  return Container(
    width: 170.w,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.0),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: lightGreen.withOpacity(.2),
          offset: const Offset(4.0, 4.0),
          blurRadius: 20,
          spreadRadius: 3.5,
        ),
        BoxShadow(
          color: lightGreen.withOpacity(.2),
          offset: const Offset(-4.0, -4.0),
          blurRadius: 20,
          spreadRadius: 3.5,
        ),
      ],
    ),
    child: Image.network(
      image,
      width: double.infinity,
      fit: BoxFit.cover,
    ),
    clipBehavior: Clip.antiAliasWithSaveLayer,
  );
}

Widget myDivider() {
  return Container(
    color: lightGrey,
    width: double.infinity,
    height: 1,
  );
}

Widget ratingBar(rate) {
  return RatingBarIndicator(
    rating: double.parse(rate),
    itemBuilder: (context, index) => Icon(
      Icons.star,
      color: lightGreen,
    ),
    itemCount: 5,
    itemSize: 25.0,
    direction: Axis.horizontal,
  );
}

void showToast({required String text, required ToastStates state}) =>
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: chooseToastColor(state),
      textColor: chooseToastColor(state),
      fontSize: 16.0,
    );

enum ToastStates { success, error, warning }

Color chooseToastColor(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.success:
      color = Colors.green;
      break;
    case ToastStates.error:
      color = Colors.red;
      break;
    case ToastStates.warning:
      color = Colors.yellow;
  }
  return color;
}
