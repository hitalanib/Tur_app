import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tur/models/location_model.dart';
import 'package:tur/screens/search/cubit/state.dart';


class SearchCubit extends Cubit<SearchStates>{
  SearchCubit() : super(SearchInitialState());

  static SearchCubit get(context) => BlocProvider.of(context);

  List<LocationModel> locations = [];
  void search(String text){
    locations = [];
    emit(SearchLoadingState());
    FirebaseFirestore.instance.collection('locations').where('name', isEqualTo: text).get().then((value) {
      value.docs.forEach((element) {
        print(element.data());
        locations.add(LocationModel.fromJson(element.data()));
      });
      emit(SearchSuccessState());
    }).catchError((onError) {
      print(onError.toString());
      emit(SearchErrorState(onError.toString()));
    });
  }


}