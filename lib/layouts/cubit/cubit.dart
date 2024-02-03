import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tur/layouts/cubit/states.dart';
import 'package:tur/models/activities_model.dart';
import 'package:tur/models/home_model.dart';
import 'package:tur/models/hotel_model.dart';
import 'package:tur/models/trips_model.dart';
import 'package:tur/models/user_model.dart';
import 'package:tur/screens/account_screen.dart';
import 'package:tur/screens/explore_screen.dart';
import 'package:tur/screens/home_screen.dart';
import 'package:tur/screens/trip_screen.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import '../../models/forum_model.dart';
import '../../models/restaurants.dart';
import '../../screens/signin_screen/signin_screen.dart';
import '../../shared/constants.dart';
import '../../shared/network/local/cache_helper.dart';

class TurAppCubit extends Cubit<TurAppStates> {
  TurAppCubit() : super(TurAppInitialState());

  static TurAppCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget> bottomNavScreens = [
    HomeScreen(),
    ExploreScreen(),
    TripScreen(),
    //AccountScreen(),
  ];

  void changeBottomNav(index) {
    if (index == 0) {
      getHotels();
      getRestaurants();
      getActivities();
      getForums();
      getAdvertisements();
      getPlaces();
      getRecommendations();
      getDestinations();
    }
    if (index == 2) {
      getTrips();
      getForums();
    }
    if(index == 3) {

      CashHelper.init();
      uId = CashHelper?.getData(key: 'uId') ?? 'null';
      print('uId:$uId');
      getUserData();
      bool? isEdit = CashHelper.getData(key: 'isEdit');
      changeAppMode(
        fromShared: isEdit,
      );
    }
    currentIndex = index;
    emit(TurAppBottomNaVChangeState());
  }

  UserModel? userModel;

  void getUserData() {
    print('UID:$uId');
    emit(TurAppGetUserLoadingState());
    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      userModel = UserModel.fromJson(value.data()!);
      emit(TurAppGetUserSuccessState());
    }).catchError((onError) {
      print('iam here');
      print(onError.toString());
      emit(TurAppGetUserErrorState(onError.toString()));
    });
  }

  List<TripModel> trips = [];

  void getTrips({String ? text}) async {
    trips = [];
    emit(TurAppGetTripLoadingState());
    if (text != null) {
     await FirebaseFirestore.instance.collection('trips').where('location', isEqualTo: text).get().then((value) {
        value.docs.forEach((element) {
          print(element.data());
          trips.add(TripModel.fromJson(element.data()));
        });
        emit(TurAppGetTripSuccessState());
      }).catchError((onError) {
        print(onError.toString());
        emit(TurAppGetUserErrorState(onError.toString()));
      });
    }
    else {
     await FirebaseFirestore.instance.collection('trips').get().then((value) {
        value.docs.forEach((element) {
          print(element.data());
          trips.add(TripModel.fromJson(element.data()));
        });
        emit(TurAppGetTripSuccessState());
      }).catchError((onError) {
        print(onError.toString());
        emit(TurAppGetUserErrorState(onError.toString()));
      });
    }

  }

  List<HotelModel> hotels = [];

  void getHotels({String ? text}) {
    hotels = [];
    emit(TurAppGetHotelsLoadingState());
    if (text != null) {
      FirebaseFirestore.instance.collection('hotels').where('location', isEqualTo: text).get().then((value) {
        value.docs.forEach((element) {
          print('hotel data');
          print(element.data());
          hotels.add(HotelModel.fromJson(element.data()));
        });
        emit(TurAppGetHotelsSuccessState());
      }).catchError((onError) {
        print(onError.toString());
        emit(TurAppGetHotelsErrorState(onError.toString()));
      });
    }
    else {
      FirebaseFirestore.instance.collection('hotels').get().then((value) {
        value.docs.forEach((element) {
          print('hotel data');
          print(element.data());
          hotels.add(HotelModel.fromJson(element.data()));
        });
        emit(TurAppGetHotelsSuccessState());
      }).catchError((onError) {
        print(onError.toString());
        emit(TurAppGetHotelsErrorState(onError.toString()));
      });
    }
  }

  List<RestaurantModel> restaurants = [];

  void getRestaurants({String ? text}) {
    restaurants = [];
    emit(TurAppGetRestaurantsLoadingState());
    if (text != null) {
      FirebaseFirestore.instance.collection('restaurants').where('location', isEqualTo: text).get().then((value) {
        value.docs.forEach((element) {
          print(element.data());
          restaurants.add(RestaurantModel.fromJson(element.data()));
        });
        emit(TurAppGetRestaurantsSuccessState());
      }).catchError((onError) {
        print(onError.toString());
        emit(TurAppGetRestaurantsErrorState(onError.toString()));
      });
    }
    else {
      FirebaseFirestore.instance.collection('restaurants').get().then((value) {
        value.docs.forEach((element) {
          print(element.data());
          restaurants.add(RestaurantModel.fromJson(element.data()));
        });
        emit(TurAppGetRestaurantsSuccessState());
      }).catchError((onError) {
        print(onError.toString());
        emit(TurAppGetRestaurantsErrorState(onError.toString()));
      });
    }

  }

  List<ActivitiesModel> activities = [];

  void getActivities({String? text}) {
    activities = [];
    emit(TurAppGetActivitiesLoadingState());
    if (text != null) {
      FirebaseFirestore.instance.collection('activities').where('location', isEqualTo: text).get().then((value) {
        value.docs.forEach((element) {
          print(element.data());
          activities.add(ActivitiesModel.fromJson(element.data()));
        });
        emit(TurAppGetActivitiesSuccessState());
      }).catchError((onError) {
        print(onError.toString());
        emit(TurAppGetActivitiesErrorState(onError.toString()));
      });
    }
    else {
      FirebaseFirestore.instance.collection('activities').get().then((value) {
        value.docs.forEach((element) {
          print(element.data());
          activities.add(ActivitiesModel.fromJson(element.data()));
        });
        emit(TurAppGetActivitiesSuccessState());
      }).catchError((onError) {
        print(onError.toString());
        emit(TurAppGetActivitiesErrorState(onError.toString()));
      });
    }

  }

  List<ForumModel> forums = [];

  void getForums({String ? text}) {
    forums = [];
    emit(TurAppGetForumsLoadingState());
    if (text != null) {
      FirebaseFirestore.instance.collection('forums').where('location', isEqualTo: text).get().then((value) {
        value.docs.forEach((element) {
          print(element.data());
          forums.add(ForumModel.fromJson(element.data()));
        });
        emit(TurAppGetForumsSuccessState());
      }).catchError((onError) {
        print(onError.toString());
        emit(TurAppGetForumsErrorState(onError.toString()));
      });
    }
    else {
      FirebaseFirestore.instance.collection('forums').get().then((value) {
        value.docs.forEach((element) {
          print(element.data());
          forums.add(ForumModel.fromJson(element.data()));
        });
        emit(TurAppGetForumsSuccessState());
      }).catchError((onError) {
        print(onError.toString());
        emit(TurAppGetForumsErrorState(onError.toString()));
      });
    }

  }


  List<AdvertisementModel> advertisements = [];

  void getAdvertisements() {
    advertisements = [];
    emit(TurAppGetAdvertisementLoadingState());
    FirebaseFirestore.instance.collection('advertisements').get().then((value) {
      value.docs.forEach((element) {
        print('advertisement My here:${element.data()}');
        advertisements.add(AdvertisementModel.fromJson(element.data()));
      });
      emit(TurAppGetAdvertisementSuccessState());
    }).catchError((onError) {
      print(onError.toString());
      emit(TurAppGetAdvertisementErrorState(onError.toString()));
    });
  }

  List<RecommendationModel> recommendations = [];

  void getRecommendations() {
    recommendations = [];
    FirebaseFirestore.instance
        .collection('recommendations')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        print(element.data());
        recommendations.add(RecommendationModel.fromJson(element.data()));
      });
      emit(TurAppGetRecommendationSuccessState());
    }).catchError((onError) {
      print(onError.toString());
      emit(TurAppGetRecommendationErrorState(onError.toString()));
    });
  }

  List<DestinationModel> destinations = [];

  void getDestinations() {
    destinations = [];
    FirebaseFirestore.instance.collection('destinations').get().then((value) {
      value.docs.forEach((element) {
        print(element.data());
        destinations.add(DestinationModel.fromJson(element.data()));
      });
      emit(TurAppGetDestinationSuccessState());
    }).catchError((onError) {
      print(onError.toString());
      emit(TurAppGetDestinationErrorState(onError.toString()));
    });
  }

  List<PlaceModel> places = [];

  void getPlaces() {
    places = [];
    FirebaseFirestore.instance.collection('places').get().then((value) {
      value.docs.forEach((element) {
        print(element.data());
        places.add(PlaceModel.fromJson(element.data()));
      });
      emit(TurAppGetPlaceSuccessState());
    }).catchError((onError) {
      print(onError.toString());
      emit(TurAppGetPlaceErrorState(onError.toString()));
    });
  }
  void toggleFavorite(TripModel tripModel)  {
     FirebaseFirestore.instance.collection('trips').doc(tripModel.tId).update({'isFavorite': !tripModel.isFavorite!}).then((value) {
       getTrips();
       getFavorites();
       emit(TurAppFavoriteSuccessState());
     }).catchError((onError) {
       emit(TurAppFavoriteErrorState(onError.toString()));
     });
  }
  List<TripModel> favorites=[];
  void getFavorites(){
    favorites=[];
    FirebaseFirestore.instance.collection('trips').where('isFavorite', isEqualTo: true).get().then((value) {
      value.docs.forEach((element) {
        print(element.data());
        favorites.add(TripModel.fromJson(element.data()));
      });
      emit(TurAppGetFavoritesSuccessState());
    }).catchError((onError) {
      print(onError.toString());
      emit(TurAppGetFavoritesErrorState(onError.toString()));
    });
  }

  // void signOut(){
  //   FirebaseAuth.instance.signOut().then((value) {
  //     emit(TurAppSignOutSuccessState());
  //   }).catchError((onError) {
  //     emit(TurAppSignOutErrorState(onError.toString()));
  //   });
  // }
  void signOut(String? userId,context) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = await auth.currentUser;

    if (user != null && user.uid == userId) {
      await auth.signOut().then((value) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => SignInScreen()),
        );
            emit(TurAppSignOutSuccessState());
          }).catchError((onError) {
            emit(TurAppSignOutErrorState(onError.toString()));
          });
    }
  }
  bool isEdit =false;
  void changeAppMode({bool? fromShared}){
    if(fromShared != null){
      isEdit =fromShared;
      emit(AppChangeAppModeState());
    }
    else{
      isEdit= !isEdit;
      CashHelper.putBoolean(key: 'isEdit', value: isEdit).then((value) {
        emit(AppChangeAppModeState());
      });
    }

  }
  File? profileImage;
  var picker = ImagePicker();

  Future<void> onProfileImageButtonPressed() async {
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      emit(TurAppProfileImagePickerSuccessState());
    } else {
      emit(TurAppProfileImagePickerErrorState());
      print('no image selected');
    }
  }
  String profileImageUrl = '';
  void uploadProfileImage({
    required String name,
    required String phone,
  }) {
    emit(TurAppUserUpdateLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(profileImage!.path).pathSegments.last}')
        .putFile(profileImage!)
        .then((value) {
      print('iam here');
      value.ref.getDownloadURL().then((value) {
        profileImageUrl = value;
        updateUser(name: name, phone: phone, image: value);
        print(value);
      }).catchError((onError) {
        emit(TurAppUploadProfileImageErrorState());
      });
    }).catchError((onError) {
      emit(TurAppUploadProfileImageErrorState());
    });
  }
  void updateUser(
      {required String name,
        required String phone,
        String? image}) {
    // UserModel model = UserModel(
    //   name: name,
    //   phone: phone,
    //   isEmailVerified: false,
    //   email: userModel!.email,
    //   uId: userModel!.uId,
    //   image: image ?? userModel!.image,
    // );
    // FirebaseFirestore.instance
    //     .collection('users')
    //     .doc(userModel!.uId)
    //     .update(model.toMap())
    //     .then((value) {
    //       print('iam updated');
    //   getUserData();
    //   emit(TurAppUpUserUpdateSuccessState());
    // }).catchError((onError) {
    //   emit(TurAppUpUserUpdateErrorState());
    // });
  }

}
