import 'package:cloud_firestore/cloud_firestore.dart';

abstract class TurAppStates{}
class TurAppInitialState extends TurAppStates{}
class TurAppBottomNaVChangeState extends TurAppStates{}
class TurAppGetUserLoadingState extends TurAppStates{}
class TurAppGetUserSuccessState extends TurAppStates{}
class TurAppGetUserErrorState extends TurAppStates{
  final String error;

  TurAppGetUserErrorState(this.error);
}
class TurAppGetTripLoadingState extends TurAppStates{}
class TurAppGetTripSuccessState extends TurAppStates{}
class TurAppGetTripErrorState extends TurAppStates{
  final String error;

  TurAppGetTripErrorState(this.error);
}
class TurAppGetHotelsLoadingState extends TurAppStates{}
class TurAppGetHotelsSuccessState extends TurAppStates{}
class TurAppGetHotelsErrorState extends TurAppStates{
  final String error;

  TurAppGetHotelsErrorState(this.error);
}
class TurAppGetRestaurantsLoadingState extends TurAppStates{}
class TurAppGetRestaurantsSuccessState extends TurAppStates{}
class TurAppGetRestaurantsErrorState extends TurAppStates{
  final String error;

  TurAppGetRestaurantsErrorState(this.error);
}
class TurAppGetActivitiesLoadingState extends TurAppStates{}
class TurAppGetActivitiesSuccessState extends TurAppStates{}
class TurAppGetActivitiesErrorState extends TurAppStates{
  final String error;

  TurAppGetActivitiesErrorState(this.error);
}
class TurAppGetForumsLoadingState extends TurAppStates{}
class TurAppGetForumsSuccessState extends TurAppStates{}
class TurAppGetForumsErrorState extends TurAppStates{
  final String error;

  TurAppGetForumsErrorState(this.error);
}
//home page
class TurAppGetDestinationSuccessState extends TurAppStates{}
class TurAppGetDestinationErrorState extends TurAppStates{
  final String error;

  TurAppGetDestinationErrorState(this.error);
}
class TurAppGetAdvertisementLoadingState extends TurAppStates{}
class TurAppGetAdvertisementSuccessState extends TurAppStates{}
class TurAppGetAdvertisementErrorState extends TurAppStates{
  final String error;

  TurAppGetAdvertisementErrorState(this.error);
}
class TurAppGetRecommendationSuccessState extends TurAppStates{}
class TurAppGetRecommendationErrorState extends TurAppStates{
  final String error;
  TurAppGetRecommendationErrorState(this.error);
}
class TurAppGetPlaceSuccessState extends TurAppStates{}
class TurAppGetPlaceErrorState extends TurAppStates{
  final String error;
  TurAppGetPlaceErrorState(this.error);
}
class TurAppFavoriteSuccessState extends TurAppStates{}
class TurAppFavoriteErrorState extends TurAppStates{
  final String error;
  TurAppFavoriteErrorState(this.error);
}
class TurAppGetFavoritesSuccessState extends TurAppStates{}
class TurAppGetFavoritesErrorState extends TurAppStates{
  final String error;
  TurAppGetFavoritesErrorState(this.error);
}
class TurAppSignOutSuccessState extends TurAppStates{}
class TurAppSignOutErrorState extends TurAppStates{
  final String error;
  TurAppSignOutErrorState(this.error);
}
class AppChangeAppModeState extends TurAppStates{}
class TurAppProfileImagePickerSuccessState extends TurAppStates{}
class TurAppProfileImagePickerErrorState extends TurAppStates{}
//user update
class TurAppUpUserUpdateSuccessState extends TurAppStates{}
class TurAppUpUserUpdateErrorState extends TurAppStates{}
class TurAppUserUpdateLoadingState extends TurAppStates{}
class TurAppUploadProfileImageErrorState extends TurAppStates{}