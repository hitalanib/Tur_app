import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tur/models/home_model.dart';

import 'style/colors.dart';

Widget buildItemRecommendation({context,bool description=true,var model,}){
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: lightGrey.withOpacity(.1),
              offset: const Offset(4.0, 4.0),
              blurRadius: 5,
              spreadRadius: 1,
            ),
            BoxShadow(
              color: lightGrey.withOpacity(.1),
              offset: const Offset(-4.0,-4.0),
              blurRadius: 5,
              spreadRadius: 1,
            ),
          ],
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Stack(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          children: [
            Container(
              width: ScreenUtil().setWidth(310),
              height: ScreenUtil().setHeight(500),
              color: Colors.white,
            ),
            Positioned(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                width:  ScreenUtil().setWidth(310),
                height:  ScreenUtil().setHeight(170),
                child: Image.network('${model!.coverImage}',fit: BoxFit.cover,),
              ),
            ),
            Positioned(
              top: 180,
              child: Container(
                width: ScreenUtil().setWidth(330) ,
                height: ScreenUtil().setHeight(300),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(top: 15.0,left: 20.0,right: 20.0,),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${model!.name}',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(fontSize: 24,),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '${model.location}',
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                      SizedBox(height: 10),
                    description ?Column(
                      children: [
                        Container(color: lightGrey.withOpacity(.2),width: double.infinity,height: 1,),
                        SizedBox(height: 10),
                        Text(
                          '${model!.description}',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 4,
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ],
                    ):Container(),
                    ],
                  ),
                ),
              ),
            ),
          description?  Positioned(
              top: 150,
              right: 30,
              child: SizedBox(
                width: 60.w,
                height: 60.h,
                child: FloatingActionButton(
                  backgroundColor: lightRed,
                  onPressed: (){},
                  child: Icon(Icons.favorite),
                ),
              ),
            ):Container(),
          ],
        ),
      ),
    ),
  );
}
