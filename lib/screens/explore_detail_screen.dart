import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:tur/shared/appbar.dart';
import 'package:tur/shared/style/colors.dart';
import 'package:tur/shared/waveclipper.dart';
import 'package:tur/shared/widgets.dart';

class ExploreDetailsScreen extends StatelessWidget {
  const ExploreDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: myAppBar(tittle: '',
        leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back,color: lightGrey,size: 40,),
      ),
      action:  Icon(
        Icons.search,
        color: lightGrey,
        size: 40,
      ),
      ),
      body: Column(
        children: [
          curveImageWithList(image: 'assests/images/hotel.jpg', tittle: 'Top 10 Favourite Destination In Paris'),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Places To Stay',
              style: TextStyle(
                fontSize: 30,
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          buildGridExplore(context),
        ],
      ),
    );
  }
}

Widget buildGridExplore(context) {
  return Expanded(
    child: Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Center(
            child: GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 20.0,
              crossAxisSpacing: 20.0,
              childAspectRatio: 1 / 1.14,
              children: [
                buildGridItem(context),
                buildGridItem(context),
                buildGridItem(context),
                buildGridItem(context),
                buildGridItem(context),
                buildGridItem(context),
                buildGridItem(context),
                buildGridItem(context),
                buildGridItem(context),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

Widget buildGridItem(context) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15.0),
      color: Colors.white,
    ),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            child: Image.asset(
              'assests/images/hotel.jpg',
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
          ),
          child: Row(
            children: [
              const Text(
                'Day 1, 2, 3',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: lightGrey,
                  fontSize: 14.0,
                ),
              ),
              Spacer(),
              const Text(
                '34%',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: lightGrey,
                  fontSize: 14.0,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

