import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tur/layouts/cubit/cubit.dart';
import 'package:tur/layouts/cubit/states.dart';
import 'package:tur/models/activities_model.dart';
import 'package:tur/models/restaurants.dart';
import 'package:tur/screens/details_screen.dart';
import 'package:tur/screens/restaurant_details_screen.dart';
import 'package:tur/screens/search/search_screen.dart';
import 'package:tur/shared/style/colors.dart';
import 'package:tur/shared/widgets.dart';

import '../shared/appbar.dart';
import 'activity_details.dart';

class ActivitiesScreen extends StatelessWidget {
  const ActivitiesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TurAppCubit, TurAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var activities=TurAppCubit.get(context).activities;
        return SafeArea(
          child: Scaffold(
            backgroundColor: backgroundColor,
            appBar: myAppBar(tittle: 'Things To Do',action: IconButton(
              onPressed: () {
                navigatorTo(context, SearchScreen(from: 'activities'));
              },
              icon: Icon(
                Icons.search,
                color: lightGrey,
                size: 40,
              ),
            ),
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios_outlined),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            body:SingleChildScrollView(
              child: ListView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) =>  buildItem(context,index,activities[index]),
                itemCount: activities.length,
              ),
            ),
          ),
        );
      },
    );
  }
}

Widget buildItem(context,int index,ActivitiesModel activitiesModel) {
  return GestureDetector(
    onTap: (){
      navigatorTo(context, DetailsScreen(context,index,activitiesModel, content: activityDetails(context,activitiesModel), from: 'activity',));
    },
    child: Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 20,bottom: 20),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: lightGreen.withOpacity(.1),
                offset: const Offset(4.0, 4.0),
                blurRadius: 20,
                spreadRadius: 3.5,
              ),
              BoxShadow(
                color: lightGreen.withOpacity(.1),
                offset: const Offset(-4.0,-4.0),
                blurRadius: 20,
                spreadRadius: 3.5,
              ),
            ],
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Stack(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            children: [
              Container(
                width: MediaQuery.of(context).size.width  *0.9,
                height:450.h,
                child: Image.network('${activitiesModel.coverImage}',fit: BoxFit.cover,),
              ),
              Positioned(
                top: 60,
                child: Container(
                  width: MediaQuery.of(context).size.width *0.9,
                  color: Colors.black.withAlpha(50),
                ),
              ),
              Positioned(
                top: 260,
                child: Container(
                  width: MediaQuery.of(context).size.width   *0.9 ,
                  height: MediaQuery.of(context).size.height  *0.8,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${activitiesModel.name}',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        SizedBox(height: 10.h,),
                        Text(
                          '${activitiesModel.description}',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: Theme.of(context).textTheme.bodyText2?.copyWith(color: blackTittle),
                        ),
                        SizedBox(height: 15.h,),
                        Row(
                          children: [
                            Text(
                              '${activitiesModel.price}',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: Theme.of(context).textTheme.bodyText2!.copyWith(color: lightGreen),
                            ),
                            Spacer(),
                            SizedBox(
                              width: 20.w,
                              height: 20.h,
                              child: Icon(Icons.location_on_outlined,size: 20,),),
                            Text(
                              '${activitiesModel.location}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 230,
                right: 20,
                child: SizedBox(
                  width: 60.w,
                  height: 60.h,
                  child: FloatingActionButton(
                    backgroundColor: lightRed,
                    onPressed: (){},
                    child: Icon(Icons.favorite),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
