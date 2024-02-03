import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tur/layouts/cubit/cubit.dart';
import 'package:tur/layouts/cubit/states.dart';
import 'package:tur/models/trips_model.dart';
import 'package:tur/screens/details_screen.dart';
import 'package:tur/screens/trip_details_screen.dart';

import '../shared/appbar.dart';
import '../shared/style/colors.dart';
import '../shared/widgets.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TurAppCubit, TurAppStates>(
  listener: (context, state) {},
  builder: (context, state) {
    var favorites= TurAppCubit.get(context).favorites;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: myAppBar(
        tittle: 'Favorites',
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_outlined),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: ListView.builder(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) => buildFavoritesItem(context,index,favorites[index]),
          itemCount: favorites.length,
        ),
      ),
    );
  },
);
    ;
  }
}

Widget buildFavoritesItem(context,int index,TripModel tripModel) {
  return GestureDetector(
    onTap: (){
      navigatorTo(context, DetailsScreen(context,index, tripModel,content: tripDetailsContent(context,tripModel), from: 'trip'),);
    },
    child: Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 25),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.15,
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
            color: Colors.white,
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Stack(
            children: [
              Positioned(
                left: 15,
                top: 16,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      width: 80.w,
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: Image.network(
                        '${tripModel.coverImage}',
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                    SizedBox(
                      width: 10.0.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${tripModel.name}',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 20.w,
                              height: 20.h,
                              child: Icon(
                                Icons.location_on_outlined,
                                size: 20,
                                color: lightGrey,
                              ),
                            ),
                            Text(
                              '${tripModel.location}',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                top: 16,
                right: 15,
                child: Container(
                  width: 35.w,
                  height: 35.h,
                  child: FloatingActionButton(
                    isExtended: true,
                    backgroundColor: tripModel.isFavorite! ?lightRed : lightGrey,
                    onPressed: ()=> TurAppCubit.get(context).toggleFavorite(tripModel),
                    child: SizedBox(
                      height: 18.h,
                        width: 18.w,
                        child: Icon(Icons.favorite,size: 18,)),
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
