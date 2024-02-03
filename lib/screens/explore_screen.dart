import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tur/layouts/cubit/cubit.dart';
import 'package:tur/layouts/cubit/states.dart';
import 'package:tur/models/forum_model.dart';
import 'package:tur/screens/details_screen.dart';
import 'package:tur/screens/explore_detail_screen.dart';
import 'package:tur/screens/search/search_screen.dart';
import 'package:tur/shared/appbar.dart';
import 'package:tur/shared/style/colors.dart';
import 'package:tur/shared/widgets.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TurAppCubit, TurAppStates>(
  listener: (context, state) {},
  builder: (context, state) {
    var forums=TurAppCubit.get(context).forums;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: myAppBar(tittle:'EXPLOERE',action:  SizedBox(
        width: 40.w,
        height: 40.h,
        child:IconButton(
          onPressed: () {
            navigatorTo(context, SearchScreen(from: 'explore'));
          },
          icon: Icon(
            Icons.search,
            color: lightGrey,
            size: 40,
          ),
        ),
      ),
      ),
      body:SingleChildScrollView(
        child: ListView.builder(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) =>  buildItem(context,index,forums[index]),
          itemCount: forums.length,
        ),
      ),
    );
  },
);
  }
}
Widget buildItem(context,int index,ForumModel forumModel) {
  return InkWell(
    onTap: (){
      navigatorTo(context, DetailsScreen(context, index,forumModel,content: exploreDetailsContent(context,forumModel), from: 'explore'));
    },
    child: Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 20,bottom: 5,right: 20,left: 20),
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
            alignment: Alignment.bottomLeft,
            children: [
              networkImageWithGradient(image: '${forumModel.coverImage}',height: 200.0.h,),
              Padding(
                padding: const EdgeInsets.only(left: 10.0 ,bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${forumModel.name}',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '${forumModel.location}',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
Widget exploreDetailsContent(context,ForumModel forumModel){
  return Stack(
    children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${forumModel.name}',
            style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 28.sp),
          ),
          SizedBox(
            height: 20.h,
          ),
          ratingBar(forumModel.rate),
          SizedBox(
            height: 20.h,
          ),
          Text(
            'History',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            '${forumModel.about}',
            style: Theme.of(context).textTheme.bodyText2?.copyWith(
              fontSize: 16.sp,
              height: 1.8,
              color: blackTittle,
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