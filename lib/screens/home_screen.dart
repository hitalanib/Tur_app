import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tur/layouts/cubit/cubit.dart';
import 'package:tur/layouts/cubit/states.dart';
import 'package:tur/models/home_model.dart';
import 'package:tur/models/trips_model.dart';
import 'package:tur/screens/activities_screen.dart';
import 'package:tur/screens/forums_screen.dart';
import 'package:tur/screens/hotel_screen.dart';
import 'package:tur/screens/restaurant_screen.dart';
import 'package:tur/screens/trip_details_screen.dart';
import 'package:tur/shared/style/colors.dart';
import 'package:tur/shared/widgets.dart';

import '../shared/recommendation_card.dart';
import 'details_screen.dart';
import 'forum_details.dart';

List<String> tageName = ['Hotels', 'Restaurants', 'Things to Do', 'Explore'];

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TurAppCubit, TurAppStates>(
  listener: (context, state) {},
  builder: (context, state) {
    var advertisements=TurAppCubit.get(context).advertisements;
    var recommendations=TurAppCubit.get(context).recommendations;
    var destinations= TurAppCubit.get(context).destinations;
    var trips= TurAppCubit.get(context).trips;
    print('home recommendationes ${recommendations}');
    print('home advertisement${advertisements}');
    return ConditionalBuilder(
        condition: advertisements.length >0 ,
        builder: (BuildContext context) => Scaffold(
          extendBodyBehindAppBar: true,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 500.h,
                  child: buildTagsTopPage(context),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                    top: 20.0,
                  ),
                  child: Text(
                    'Popular Destinations ',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    '${destinations.length} tours Avialable ',
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                    top: 25.0,
                    bottom: 45,
                  ),
                  child: SizedBox(
                    height: 140.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) =>
                          buildItemPopularDestination(context,TurAppCubit.get(context).destinations[index]),
                      itemCount: TurAppCubit.get(context).destinations.length,
                    ),
                  ),
                ),
                //buildAdvertismentPhoto(context,advertisements[advertisements.length -2]),
                buildAdvertismentPhoto(context,trips.length -2,trips[trips.length -2],),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                  ),
                  child: Text(
                    'Discover New Places',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                    top: 10.0,
                  ),
                  child: SizedBox(
                    height: ScreenUtil().setHeight(250),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) => buildItemSuggest(context,TurAppCubit.get(context).places[index]),
                      itemCount: TurAppCubit.get(context).places.length,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
             //  buildAdvertismentPhoto(context,advertisements[advertisements.length -1]),
                buildAdvertismentPhoto(context,trips.length -1,trips[trips.length -1],),
                SizedBox(
                  height: 30.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                  ),
                  child: Text(
                    'Our Recommendations',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                    top: 10.0,
                  ),
                  child: SizedBox(
                    height: ScreenUtil().setHeight(380),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) =>
                          buildItemRecommendation(context: context,model: TurAppCubit.get(context).recommendations[index]),
                      itemCount: TurAppCubit.get(context).recommendations.length,
                    ),
                  ),
                ),
                SizedBox(height: 80.h,),
              ],
            ),
          ),
        ),
        fallback: (BuildContext context) => Center(child: CircularProgressIndicator(color: lightGreen,)),
    );
  },
);
  }
}

Widget buildAdvertismentPhoto(context,index,TripModel advertisementModel) {
  return Container(
    height: 500.h,
    child: Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Image.network(
          '${advertisementModel.coverImage}',
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        ),
        Positioned(
          top: 300,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SizedBox(
              width: 360.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${advertisementModel.name} Trip',
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                  Text(
                    '${advertisementModel.description}',
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: Colors.white,
                        ),
                  ),

                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 35,
          left: 20,
          child:
          SizedBox(
          height: 50.h,
          child: defualtButton(
              function: () {
                navigatorTo(context, DetailsScreen(context,index, advertisementModel,content: tripDetailsContent(context,advertisementModel), from: 'trip'),);
              },
              text: 'See More',
              context: context,
              isUpperCase: false,
              withIcon: false),
        ),
        ),
      ],
    ),
  );
}

Widget buildItemPopularDestination(context,DestinationModel destinationModel) {
  return GestureDetector(
    onTap: (){
      TurAppCubit.get(context).getForums(text: destinationModel.name);
      navigatorTo(context, ForumsScreen());
    },
    child: Padding(
      padding: const EdgeInsets.only(
        right: 30,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: lightGrey.withOpacity(.2),
              offset: const Offset(4.0, 4.0),
              blurRadius: 5,
              spreadRadius: 1,
            ),
            BoxShadow(
              color: lightGrey.withOpacity(.2),
              offset: const Offset(-4.0, -4.0),
              blurRadius: 5,
              spreadRadius: 1,
            ),
          ],
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            networkImageWithGradient(
              image: '${destinationModel.coverImage}',
              height: double.infinity,
              width: 125.w,
            ),
            Container(
              width: 125.w,
              height: 40.h,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    '${destinationModel.name}',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(fontSize: 14,),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget buildItemSuggest(context,PlaceModel placeModel) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: lightGrey.withOpacity(.2),
            offset: const Offset(4.0, 4.0),
            blurRadius: 5,
            spreadRadius: 1,
          ),
          BoxShadow(
            color: lightGrey.withOpacity(.2),
            offset: const Offset(-4.0, -4.0),
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Stack(
        alignment: Alignment.bottomLeft,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        children: [
          networkImageWithGradient(
            image: '${placeModel.coverImage}',
            height: ScreenUtil().setHeight(300),
            width: ScreenUtil().setWidth(130),
          ),
          Container(
            width: ScreenUtil().setWidth(130),
            height: ScreenUtil().setHeight(40),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '${placeModel.name}',
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget buildMiddleItem(context) {
  return Stack(
    alignment: Alignment.bottomCenter,
    children: [
      Container(
        width: double.infinity,
        height: 350.h,
        child: Image.asset(
          'assests/images/nasma.jpg',
          fit: BoxFit.cover,
        ),
      ),
      Container(
        width: double.infinity,
        height: 80.h,
        color: backgroundColor,
      ),
      SizedBox(
        height: 185.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) => buildMiddleCardItem(context),
          itemCount: 20,
        ),
      ),
    ],
  );
}

Widget buildMiddleCardItem(context) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: lightGrey.withOpacity(.2),
            offset: const Offset(4.0, 4.0),
            blurRadius: 5,
            spreadRadius: 1,
          ),
          BoxShadow(
            color: lightGrey.withOpacity(.2),
            offset: const Offset(-4.0, -4.0),
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
      ),
      width: 310.w,
      height: 140.h,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13.0, vertical: 20),
        child: Stack(
          children: [
            Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        child: Text(
                      'Holidays',
                      style: Theme.of(context).textTheme.subtitle1,
                    )),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'say yes to iconic snow catamount, Hillsdale, New York!',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Book your package holiday now',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: lightGrey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                Positioned(
                  bottom: 10,
                  right: 5,
                  child: SizedBox(
                    height: 50.w,
                    child: FloatingActionButton(
                      backgroundColor: const Color(0xFF7DDDF0),
                      onPressed: () {},
                      child: const Icon(
                        Icons.arrow_forward,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

Widget buildDefualtButtonList(context, String tittle, index,{bool isTittle = false}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: defualtButton(
      function: () {
        if(index == 0)
        navigatorTo(context, HotelScreen());
        if(index == 1)
          navigatorTo(context, RestaurantScreen());
        if(index ==2)
          navigatorTo(context, ActivitiesScreen());
        if(index == 3)
          navigatorTo(context, ForumsScreen());
      },
      text: tittle,
      context: context,
    ),
  );
}

Widget buildTagsTopPage(context) {
  return Stack(
    children: [
      imageWithGradient(
        image: 'assests/images/Welcome_screen.jpg',
        height: double.infinity,
        width: double.infinity,
      ),
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
              top: 20.0,
            ),
            child: Text(
              'Explore',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 0.0,
            ),
            child: SizedBox(
              height: 60.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) =>
                    buildDefualtButtonList(context, tageName[index],index),
                itemCount: 4,
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
