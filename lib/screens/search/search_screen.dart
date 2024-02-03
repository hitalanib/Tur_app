import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tur/layouts/cubit/cubit.dart';
import 'package:tur/layouts/cubit/states.dart';
import 'package:tur/models/location_model.dart';
import 'package:tur/screens/activities_screen.dart';
import 'package:tur/screens/explore_screen.dart';
import 'package:tur/screens/forums_screen.dart';
import 'package:tur/screens/hotel_screen.dart';
import 'package:tur/screens/restaurant_screen.dart';
import 'package:tur/screens/trip_screen.dart';
import 'package:tur/shared/style/colors.dart';

import '../../shared/widgets.dart';
import 'cubit/cubit.dart';
import 'cubit/state.dart';

class SearchScreen extends StatelessWidget {
  final String from;
  var formKey = GlobalKey<FormState>();
  var searchController = TextEditingController();

  SearchScreen({super.key, required this.from});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: BlocConsumer<SearchCubit, SearchStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            backgroundColor: backgroundColor,
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.pop(context);
                  if (from == 'hotels')
                  TurAppCubit.get(context).getHotels();
                  if (from == 'trips')
                    TurAppCubit.get(context).getTrips();
                  if (from == 'restaurants')
                    TurAppCubit.get(context).getRestaurants();
                  if (from == 'activities')
                    TurAppCubit.get(context).getActivities();
                  if (from == 'forums' || from == 'explore')
                    TurAppCubit.get(context).getForums();
                },
              ),
              title: defualtFormField(
                controller: searchController,
                type: TextInputType.text,
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'please enter text to search';
                  }
                  return null;
                },
                onChanged: (String text) {
                  if (formKey.currentState!.validate()) {
                    SearchCubit.get(context).search(text);
                  }
                },
                label: 'Search',
                prefixIcon: Icons.search,
              ),
            ),
            body: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10.0,
                    ),
                    if (state is SearchLoadingState)
                      const LinearProgressIndicator(
                        color: lightGreen,
                      ),
                    if (state is SearchSuccessState) Container(),
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) => buildSearchItem(
                            context,
                            SearchCubit.get(context).locations[index],
                            from),
                        separatorBuilder: (context, index) => myDivider(),
                        itemCount: SearchCubit.get(context).locations.length,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

Widget buildSearchItem(context, LocationModel locationModel, String from) {
  return BlocConsumer<TurAppCubit, TurAppStates>(
    listener: (context, state) {},
    builder: (context, state) {
      return InkWell(
        onTap: () {
          if (from == 'hotels') {
            TurAppCubit.get(context).getHotels(text: locationModel.name);
            navigatorTo(context, HotelScreen());
          }
          if (from == 'trips') {
            TurAppCubit.get(context).getTrips(text: locationModel.name);

            navigatorTo(context, TripScreen());
          }
          if (from == 'restaurants') {
            TurAppCubit.get(context).getRestaurants(text: locationModel.name);

            navigatorTo(context, RestaurantScreen());
          }
          if (from == 'activities') {
            TurAppCubit.get(context).getActivities(text: locationModel.name);

            navigatorTo(context, ActivitiesScreen());
          }
          if (from == 'forums') {
            TurAppCubit.get(context).getForums(text: locationModel.name);

            navigatorTo(context, ForumsScreen());
          }
          if (from == 'explore') {
            TurAppCubit.get(context).getForums(text: locationModel.name);

            navigatorTo(context, ExploreScreen());
          }
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: backgroundColor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  size: 40,
                ),
                SizedBox(
                  width: 30.w,
                ),
                Text(
                  '${locationModel.name}',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
