import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tur/models/activities_model.dart';
import 'package:tur/models/restaurants.dart';
import 'package:tur/shared/style/colors.dart';
import '../shared/widgets.dart';
import 'hotel_details_screen.dart';

Widget activityDetails(context,ActivitiesModel activitiesModel) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${activitiesModel.name}',
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: Theme.of(context)
                  .textTheme
                  .headline1
                  ?.copyWith(fontSize: 25.sp, height: 1.2),
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${activitiesModel.price}',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      ?.copyWith(color: lightGreen),
                ),
                SizedBox(
                  width: 10.w,
                ),
                SizedBox(
                  height: 20.h,
                  width: 20.w,
                  child: Icon(
                    Icons.location_on_outlined,
                    size: 20,
                  ),
                ),
                Text(
                  '${activitiesModel.location}',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ],
            ),

            SizedBox(
              height: 20.h,
            ),
            Text(
              'About',
              style:
              Theme.of(context).textTheme.subtitle1?.copyWith(fontSize: 24.sp),
            ),
            SizedBox(
              height: 10.h,
            ),
            Column(
              children: [
                buildTagBackground(context ,tittle: activitiesModel.categories!,),
                SizedBox(height: 10.h,),
                Text(
                  '${activitiesModel.about}',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 7,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      ?.copyWith(color: blackTittle),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              'Address',
              style:
              Theme.of(context).textTheme.subtitle1?.copyWith(fontSize: 24.sp),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              '${activitiesModel.address}',
              overflow: TextOverflow.ellipsis,
              maxLines: 5,
              style: Theme.of(context)
                  .textTheme
                  .bodyText2
                  ?.copyWith(color: blackTittle),
            ),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ],
    ),
  );
}