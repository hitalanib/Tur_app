import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tur/layouts/cubit/cubit.dart';
import 'package:tur/layouts/home_layout.dart';
import 'package:tur/screens/on_boarding_screen.dart';
import 'package:tur/screens/signup_screen/signup_screen.dart';
import 'package:tur/shared/bloc_observer.dart';
import 'package:tur/shared/network/Api/dio_helper.dart';
import 'package:tur/shared/network/local/cache_helper.dart';
import 'package:tur/shared/style/colors.dart';
import 'package:tur/shared/widgets.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Bloc.observer = MyBlocObserver();
  Widget widget;
  await CashHelper.init();
  String uId = CashHelper.getData(key: 'uId') ?? 'null';
 bool onBoard = CashHelper?.getData(key: 'onBoarding') ?? false;
  print('i am here1');
  print(uId.toString());
  print('UID:$uId');

  if (onBoard) {
    if(uId != 'null')
      widget = HomeLayout();
     else
    widget = SignUpScreen();
  } else {
    widget = OnBoardingScreen();
  }
  widget = HomeLayout();
  runApp(MyApp(startWidget: widget,));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key, required this.startWidget,}) : super(key: key);
final Widget startWidget;
  @override
  State<MyApp> createState() => _MyAppState(startWidget);
}

class _MyAppState extends State<MyApp> {
  final Widget startWidget;

  _MyAppState(this.startWidget);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TurAppCubit()
        ..getHotels()
        ..getTrips()
        ..getRestaurants()
        ..getActivities()
        ..getForums()
        ..getAdvertisements()
        ..getDestinations()
        ..getPlaces()
        ..getRecommendations()
      ..getFavorites(),
      child: ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        designSize: const Size(400, 800),
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              backgroundColor: backgroundColor,
              appBarTheme: AppBarTheme(
                titleSpacing: 20.0,
                iconTheme: IconThemeData(
                  color: lightGrey,
                ),
                backgroundColor: backgroundColor,
                elevation: 0.0,
                titleTextStyle: TextStyle(
                  color: myBlack,
                  fontWeight: FontWeight.w500,
                  fontSize: 30.0.sp,
                  fontFamily: 'LatoBold',
                ),
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarIconBrightness: Brightness.dark,
                  statusBarColor: Colors.transparent,
                ),
              ),
              textTheme: TextTheme(
                bodyText1: TextStyle(
                  fontSize: 18.0.sp,
                  fontWeight: FontWeight.w500,
                  color: myBlack,
                ),
                headline6: TextStyle(
                    fontSize: 32.0.sp,
                    fontWeight: FontWeight.w900,
                    color: myBlack,
                    fontFamily: 'LatoRegular'),
                headline1: TextStyle(
                    fontSize: 24.0.sp,
                    fontWeight: FontWeight.bold,
                    color: myBlack,
                    fontFamily: 'LatoRegular'),
                headline2: TextStyle(
                    fontFamily: 'LatoBold',
                    height: 1.5,
                    fontSize: 30.0.sp,
                    color: lightBlue),
                subtitle2: TextStyle(
                    height: 0.8,
                    fontSize: 15.sp,
                    color: greyTittle,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'LatoRegular'),
                subtitle1: TextStyle(
                  height: 0.8,
                  fontSize: 18.sp,
                  color: myBlack,
                  fontFamily: 'LatoBold',
                ),
                bodyText2: TextStyle(
                  color: myBlack,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'LatoRegular',
                ),
              ),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                backgroundColor: backgroundColor,
              ),
            ),
            home: FutureBuilder(
              future: Future.delayed(Duration(seconds: 5)),
              builder: (ctx, timer) => timer.connectionState ==
                      ConnectionState.done
                  ?  startWidget//Screen to navigate to once the splashScreen is done.
                  : Scaffold(
                      body: Builder(builder: (context) {
                        return Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 100,
                              height: MediaQuery.of(context).size.height * 100,
                              child: imageWithGradient(
                                  image: 'assests/images/Welcome_screen.jpg',
                                  height: double.infinity,
                                  width: double.infinity),
                            ),
                            const Image(
                              image:
                                  AssetImage('assests/images/logo.png'),
                              height: 90.0,
                              width: 90.0,
                            ),
                          ],
                        );
                      }),
                    ),
            ),
          );
        },
      ),
    );
  }
}
