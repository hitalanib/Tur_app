import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tur/models/trips_model.dart';
import 'package:tur/shared/style/colors.dart';

import '../shared/recommendation_card.dart';

Widget detailDetails(context,{required  Widget descriptionsContent}) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           descriptionsContent,
            // Text(
            //   'Things to Do',
            //   style: Theme.of(context).textTheme.subtitle1?.copyWith(
            //         fontSize: 28,
            //       ),
            // ),
            // SizedBox(
            //   height: 10.h,
            // ),
            // SizedBox(
            //   height: 300.h,
            //   child: ListView.builder(
            //     scrollDirection: Axis.horizontal,
            //     shrinkWrap: true,
            //     physics: BouncingScrollPhysics(),
            //     itemBuilder: (context, index) =>
            //         buildItemRecommendation(context: context,description: false,),
            //     itemCount: 10,
            //   ),
            // ),
            // SizedBox(
            //   height: 60.h,
            // ),
            // Text(
            //   'Places To Stay',
            //   style: Theme.of(context).textTheme.subtitle1?.copyWith(
            //         fontSize: 28,
            //       ),
            // ),
            // SizedBox(
            //   height: 10.h,
            // ),
            // SizedBox(
            //   height: 300.h,
            //   child: ListView.builder(
            //     scrollDirection: Axis.horizontal,
            //     shrinkWrap: true,
            //     physics: BouncingScrollPhysics(),
            //     itemBuilder: (context, index) =>
            //         buildItemRecommendation(context: context,description: false),
            //     itemCount: 10,
            //   ),
            // ),
            // SizedBox(
            //   height: 60.h,
            // ),
            // Text(
            //   'Places To Eat',
            //   style: Theme.of(context).textTheme.subtitle1?.copyWith(
            //         fontSize: 28,
            //       ),
            // ),
            // SizedBox(
            //   height: 10.h,
            // ),
            // SizedBox(
            //   height: 300.h,
            //   child: ListView.builder(
            //     scrollDirection: Axis.horizontal,
            //     shrinkWrap: true,
            //     physics: BouncingScrollPhysics(),
            //     itemBuilder: (context, index) =>
            //         buildItemRecommendation(context: context,description: false,),
            //     itemCount: 10,
            //   ),
            // ),
          ],
        ),
      ),
    ],
  );
}
Widget tripDetailsContent(context,TripModel tripModel){
  return Stack(
    children: [
      Positioned(
        top: 50,
        right: 30,
        child: Column(
          children: [
            Container(child: Icon(Icons.camera,color: lightBlue,size: 100,),),
            SizedBox(
              height: 10.h,
            ),
            Text(
              '${tripModel.price}',
              style: Theme.of(context)
                  .textTheme
                  .bodyText2
                  ?.copyWith(color: lightGreen,fontSize: 32.sp),
            ),
          ],
        ),
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              '${tripModel.name}',
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: Theme.of(context)
                  .textTheme
                  .headline1
                  ?.copyWith(fontSize: 30, height: 1.2),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            'Duration',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            '${tripModel.duration}',
            style: Theme.of(context).textTheme.bodyText2!.copyWith(color: blackTittle,),
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            'Departure',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            '${tripModel.departure}',
            style: Theme.of(context).textTheme.bodyText2!.copyWith(color: blackTittle,),
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            'About',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            '${tripModel.about}',
            style: Theme.of(context).textTheme.bodyText2?.copyWith(
              fontSize: 16,
              height: 1.8,
              color: blackTittle
            ),
          ),
          SizedBox(
            height: 60.h,
          ),
        ],
      ),
    ],
  );
}