import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tur/layouts/cubit/cubit.dart';
import 'package:tur/layouts/cubit/states.dart';
import 'package:tur/screens/activity_details.dart';
import 'package:tur/screens/hotel_details_screen.dart';
import 'package:tur/screens/restaurant_details_screen.dart';
import 'package:tur/screens/trip_details_screen.dart';
import 'package:tur/shared/appbar.dart';
import 'package:tur/shared/style/colors.dart';

import '../shared/widgets.dart';
import 'forum_details.dart';

Widget DetailsScreen(context,int index,var model,{required Widget content,required String from}) {
  return BlocConsumer<TurAppCubit, TurAppStates>(
    listener: (context, state) {},
    builder: (context, state) {
      // var tripsModel = TurAppCubit.get(context).trips[index];
      // var hotelsModel = TurAppCubit.get(context).hotels[index];
      // var restaurantModel = TurAppCubit.get(context).restaurants[index];
      // var activityModel =TurAppCubit.get(context).activities[index];
      // var forumModel =TurAppCubit.get(context).forums[index];
      return SafeArea(
        child: Scaffold(
          backgroundColor: backgroundColor,
          appBar: myAppBar(
            tittle: '',
            // action:
            //  if(from == 'trips')
            //   IconButton(icon: model.isFavorite! ?Icon(Icons.favorite_border):Icon(Icons.favorite,color: lightRed,), onPressed: () { TurAppCubit.get(context).toggleFavorite(model);},),
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_outlined),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                if(from == 'trip')
                curveImageWithList(
                    image: '${model.coverImage}', context: context,images: model.images),
                if(from == 'trip')
                  detailDetails(context, descriptionsContent: content,),
                if(from == 'hotel')
                  curveImageWithList(
                      image: '${model.coverImage}', context: context,images: model.images),
                if(from == 'hotel')
                  HotelDetails(context, model),
                if(from == 'restaurant')
                  curveImageWithList(
                      image: '${model.coverImage}', context: context,images: model.images),
                if(from == 'restaurant')
                  restaurantDetails(context, model),
                if(from == 'activity')
                  curveImageWithList(
                      image: '${model.coverImage}', context: context,images: model.images),
                if(from == 'activity')
                  activityDetails(context, model),
                if(from == 'forum')
                  curveImageWithList(
                      image: '${model.coverImage}', context: context,images: model.images),
                if(from == 'forum')
                  forumDetails(context, model),
                if(from == 'explore')
                  curveImageWithList(
                      image: '${model.coverImage}', context: context,images: model.images),
                if(from == 'explore')
                  detailDetails(context, descriptionsContent: content,),
              ],
            ),
          ),
        ),
      );
    },
  );
}

