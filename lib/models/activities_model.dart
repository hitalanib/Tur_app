class ActivitiesModel{
  String? aId;
  String? name;
  String? about;
  String? coverImage;
  String? description;
  String? location;
  String? address;
  String? price;
  List<String>? categories;
  List<String>? images;
  ActivitiesModel({
    this.aId,
    this.name,
    this.about,
    this.coverImage,
    this.description,
    this.location,
    this.address,
    this.categories,
    this.images,
    this.price,
  });
  ActivitiesModel.fromJson(Map<String, dynamic> json){
    aId = json['aId'];
    name = json['name'];
    about = json['about'];
    coverImage = json['coverImage'];
    description = json['description'];
    location = json['location'];
    price = json['price'];
    address = json['address'];
    categories = <String>[];
    json['categories'].forEach((v) {
      categories!.add(v);
    });
    images = <String>[];
    json['images'].forEach((v) {
      images!.add(v);
    });
  }
  Map<String,dynamic> toMap(){
    return{
      'tId':aId,
      'name':name,
      'about':about,
      'cover_image':coverImage,
      'description':description,
    };
  }
}