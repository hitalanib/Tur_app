import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tur/layouts/cubit/cubit.dart';
import 'package:tur/layouts/cubit/states.dart';
import 'package:tur/shared/style/colors.dart';


class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TurAppCubit, TurAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = TurAppCubit.get(context);
        return Scaffold(
          extendBody: true,
          body: cubit.bottomNavScreens[cubit.currentIndex],
          bottomNavigationBar: CurvedNavigationBar(
            items: [
              SizedBox(
                width: 35.w,
                height: 35.h,
                child: const Icon(
                  Icons.home,
                  color: Colors.white,
                  size: 35,
                ),
              ),
              SizedBox(
                width: 35.w,
                  height: 35.h,
                  child: const Icon(
                Icons.travel_explore_outlined,
                color: Colors.white,
                size: 35,
              ),
              ),
              SizedBox(
                width: 35.w,
                height: 35.h,
                child: const Icon(
                  Icons.image_search_outlined,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              // SizedBox(
              //   width: 35.w,
              //   height: 35.h,
              //   child: const Icon(
              //     Icons.person_outlined,
              //     color: Colors.white,
              //     size: 30,
              //   ),
              // ),
            ],
            onTap: (index) {
              cubit.changeBottomNav(index);
            },
            backgroundColor: Colors.transparent,
            color: lightGreen,
            animationDuration: Duration(milliseconds: 300),
          ),
        );
      },
    );
  }
}
