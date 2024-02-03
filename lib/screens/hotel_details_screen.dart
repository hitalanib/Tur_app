import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tur/models/hotel_model.dart';
import 'package:tur/shared/style/colors.dart';

import '../shared/widgets.dart';

Widget HotelDetails(context,HotelModel hotelModel) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${hotelModel.name}',
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
                ratingBar(hotelModel.rate!),
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
                  '${hotelModel.location}',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            // Text(
            //   '${hotelModel.price}',
            //   style: Theme.of(context)
            //       .textTheme
            //       .bodyText2
            //       ?.copyWith(color: lightGreen,fontSize: 24.sp),
            // ),
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
                buildTagBackground(context ,tittle: hotelModel.features!,),
                SizedBox(height: 10.h,),
                Text(
                  '${hotelModel.about}',
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
              'Available Languages',
              style: Theme.of(context).textTheme.subtitle1!.copyWith(fontSize: 24.sp,),
            ),
            SizedBox(
              height: 10.h,
            ),
            buildTagBackground(context, tittle: hotelModel.languages!),
            SizedBox(
              height: 20.h,
            ),
            Text(
              'Amenities',
              style: Theme.of(context).textTheme.subtitle1!.copyWith(fontSize:24.sp ),
            ),
            SizedBox(
              height: 10.h,
            ),
            buildTagBackground(context, tittle: hotelModel.amenities!),
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
              '${hotelModel.address}',
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
            // Text(
            //   'The Area',
            //   style:
            //   Theme.of(context).textTheme.subtitle1?.copyWith(fontSize: 24.sp),
            // ),
            // SizedBox(
            //   height: 10.h,
            // ),
            // Text(
            //   'How to get there',
            //   style: Theme.of(context)
            //       .textTheme
            //       .bodyText2!.copyWith(color: blackTittle),
            // ),
            // SizedBox(
            //   height: 20.h,
            // ),
          ],
        ),
        // SizedBox(
        //   height: 300.h,
        //   child: Image.asset('assests/images/map.jpg',fit: BoxFit.cover,width: double.infinity,),
        // ),
        // SizedBox(
        //   height: 20.h,
        // ),
      ],
    ),
  );
}
Widget buildTagBackground(context, {required List<String> tittle}){
  return  SizedBox(
    height: 35.0.h,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.transparent,
            border: Border.all(color: myBlack),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                tittle[index],
                style: Theme.of(context)
                    .textTheme
                    .subtitle2!
                    .copyWith(color: myBlack),
              ),
            ),
          ),
        ),
      ),
      itemCount: tittle.length,
    ),
  );
}