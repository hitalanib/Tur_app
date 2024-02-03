class TripModel{
  String? tId;
  String? name;
  String? about;
  String? agency;
  String? coverImage;
  String? date;
  String? departure;
  String? description;
  String? duration;
  String? price;
  String? logo;
  String? location;
  bool? isFavorite;
  List<String>? images;
  TripModel({
    this.tId,
    this.name,
    this.about,
    this.agency,
    this.coverImage,
    this.date,
    this.departure,
    this.description,
    this.duration,
    this.price,
    this.logo,
    this.images,
    this.location,
    this.isFavorite,
  });
  TripModel.fromJson(Map<String, dynamic> json){
    tId = json['tId'];
    name = json['name'];
    about = json['about'];
    agency = json['agency'];
    coverImage = json['coverImage'];
    date = json['date'];
    departure = json['departure'];
    description = json['description'];
    duration = json['duration'];
    price = json['price'];
    logo = json['logo'];
    location = json['location'];
    images = <String>[];
    isFavorite= json['isFavorite'] ?? false;

    json['images'].forEach((v) {
      images!.add(v);
    });
  }
  Map<String,dynamic> toMap(){
    return{
      'tId':tId,
      'name':name,
      'about':about,
      'agency':agency,
      'coverImage':coverImage,
      'date':date,
      'departure':departure,
      'description':description,
      'duration':duration,
      'price':price,
      'isFavorite': isFavorite,
    };
  }
}