class HotelModel{
  String? hId;
  String? name;
  String? about;
  String? coverImage;
  String? description;
  String? price;
  String? rate;
  String? location;
  String? address;
  List<String>? amenities;
  List<String>? features;
  List<String>? languages;
  List<String>? images;
  HotelModel({
    this.hId,
    this.name,
    this.about,
    this.coverImage,
    this.description,
    this.price,
    this.rate,
    this.location,
    this.address,
    this.amenities,
    this.features,
    this.languages,
    this.images,
  });
  HotelModel.fromJson(Map<String, dynamic> json){
    hId = json['hId'];
    name = json['name'];
    about = json['about'];
    coverImage = json['coverImage'];
    description = json['description'];
    price = json['price'];
    rate = json['rate'];
    location = json['location'];
    address = json['address'];
    amenities = <String>[];
    json['amenities'].forEach((v) {
      amenities!.add(v);
    });
    features = <String>[];
    json['features'].forEach((v) {
      features!.add(v);
    });
    languages = <String>[];
    json['languages'].forEach((v) {
      languages!.add(v);
    });
    images = <String>[];
    json['images'].forEach((v) {
      images!.add(v);
    });
  }
  Map<String,dynamic> toMap(){
    return{
      'tId':hId,
      'name':name,
      'about':about,
      'cover_image':coverImage,
      'description':description,
      'price':price,
    };
  }
}