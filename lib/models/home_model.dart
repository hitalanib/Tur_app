class HomeModel{
  String? hId;
  String? coverImage;
  List<AdvertisementModel>? advertisements;
  List<DestinationModel>? destinations;
  List<PlaceModel>? places;
  List<RecommendationModel>? recommendations;
  HomeModel({
    this.hId,
    this.coverImage,
    this.advertisements,
    this.destinations,
    this.places,
    this.recommendations,
  });
  HomeModel.fromJson(Map<String, dynamic> json){
    hId = json['hId'];
    coverImage = json['coverImage'];
    if (json['advertisements'] != null) {
      advertisements = <AdvertisementModel>[];
      json['advertisements'].forEach((v) {
        advertisements!.add(new AdvertisementModel.fromJson(v));
      });
    }
    if (json['destinations'] != null) {
      destinations = <DestinationModel>[];
      json['destinations'].forEach((v) {
        destinations!.add(new DestinationModel.fromJson(v));
      });
    }
    if (json['places'] != null) {
      places = <PlaceModel>[];
      json['places'].forEach((v) {
        places!.add(new PlaceModel.fromJson(v));
      });
    }
    if (json['recommendations'] != null) {
      recommendations = <RecommendationModel>[];
      json['recommendations'].forEach((v) {
        recommendations!.add(new RecommendationModel.fromJson(v));
      });
    }
  }
  Map<String,dynamic> toMap(){
    return{
      'tId':hId,
      'cover_image':coverImage,
    };
  }
}
class DestinationModel{
  String? name;
  String? coverImage;
  DestinationModel({
    this.name,
    this.coverImage,
  });
  DestinationModel.fromJson(Map<String, dynamic> json){
    name = json['name'];
    coverImage = json['coverImage'];
  }
  Map<String,dynamic> toMap(){
    return{
      'name':name,
      'cover_image':coverImage,
    };
  }
}
class AdvertisementModel{
  String? name;
  String? tittle;
  String? coverImage;
  AdvertisementModel({
    this.name,
    this.tittle,
    this.coverImage,
  });
  AdvertisementModel.fromJson(Map<String, dynamic> json){
    name = json['name'];
    tittle= json['tittle'];
    coverImage = json['coverImage'];
  }
  Map<String,dynamic> toMap(){
    return{
      'name':name,
      'cover_image':coverImage,
    };
  }
}
class PlaceModel{
  String? name;
  String? coverImage;
  PlaceModel({
    this.name,
    this.coverImage,
  });
  PlaceModel.fromJson(Map<String, dynamic> json){
    name = json['name'];
    coverImage = json['coverImage'];
  }
  Map<String,dynamic> toMap(){
    return{
      'name':name,
      'cover_image':coverImage,
    };
  }
}
class RecommendationModel{
  String? rId;
  String? description;
  String? location;
  String? name;
  String? coverImage;
  RecommendationModel({
    this.name,
    this.coverImage,
    this.location,
    this.description,
    this.rId,
  });
  RecommendationModel.fromJson(Map<String, dynamic> json){
    name = json['name'];
    coverImage = json['coverImage'];
    location = json['location'];
    description = json['description'];
    rId = json['rId'];
  }
  Map<String,dynamic> toMap(){
    return{
      'name':name,
      'cover_image':coverImage,
    };
  }
}