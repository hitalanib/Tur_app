import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tur/layouts/cubit/cubit.dart';
import 'package:tur/layouts/cubit/states.dart';
import 'package:tur/models/trips_model.dart';
import 'package:tur/screens/details_screen.dart';
import 'package:tur/screens/search/search_screen.dart';
import 'package:tur/screens/trip_details_screen.dart';
import 'package:tur/shared/appbar.dart';
import 'package:tur/shared/widgets.dart';

import '../shared/style/colors.dart';

class TripScreen extends StatelessWidget {
  const TripScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TurAppCubit, TurAppStates>(
  listener: (context, state) {
  },
  builder: (context, state) {
    var trips=TurAppCubit.get(context).trips;
    return ConditionalBuilder(
      builder: (context) {
        return Scaffold(
          backgroundColor: backgroundColor,
          appBar: myAppBar(tittle: 'TRIPS',
            action: IconButton(
              onPressed: () {
                navigatorTo(context, SearchScreen(from: 'trips'));
              },
              icon: Icon(
                Icons.search,
                color: lightGrey,
                size: 40,
              ),
            ),
          ),
          body:SingleChildScrollView(
            child: ListView.builder(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) =>  buildItem(context,index,trips[index]),
              itemCount: trips.length,
            ),
          ),
        );
      }, condition: trips.length >0 ,
      fallback: (BuildContext context) => Center(child: CircularProgressIndicator(color: lightGreen,)) ,
    );
  },
);
  }
}

Widget buildItem(context,index,TripModel tripModel) {
  return GestureDetector(
    onTap: (){
      navigatorTo(context, DetailsScreen(context,index, tripModel,content: tripDetailsContent(context,tripModel), from: 'trip'),);
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
                height: 480.h,
                  child: Image(image: NetworkImage('${tripModel.coverImage}',),fit: BoxFit.cover),
              ),
              Positioned(
                top: 60,
                child: Container(
                  width: MediaQuery.of(context).size.width *0.9,
                  color: Colors.black.withAlpha(50),
                ),
              ),
              Positioned(
                top: 280,
                child: Container(
                  width: MediaQuery.of(context).size.width   *0.9 ,
                  height: MediaQuery.of(context).size.width  *0.8,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Text(
                                '${tripModel.name}',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style:  Theme.of(context).textTheme.headline1?.copyWith(fontSize: 32,height: 1.2),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                '${tripModel.agency}',
                                style: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 15,),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          '${tripModel.description}',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          style: Theme.of(context).textTheme.bodyText2?.copyWith(color: lightGrey),
                        ),
                        SizedBox(height: 20.h,),
                        Row(
                          children: [
                            Text(
                              '${tripModel.price}',
                              style: Theme.of(context).textTheme.bodyText2!.copyWith(color: lightGreen),
                            ),
                            Spacer(),
                            Text(
                              '${tripModel.date}',
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
                top: 250,
                right: 20,
                child: FloatingActionButton(
                  backgroundColor: tripModel.isFavorite! ?lightRed : lightGrey,
                  onPressed: () => TurAppCubit.get(context).toggleFavorite(tripModel),
                  child: Icon(Icons.favorite),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
