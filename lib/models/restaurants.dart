class RestaurantModel{
  String? rId;
  String? name;
  String? about;
  String? coverImage;
  String? description;
  String? rate;
  String? location;
  String? address;
  List<String>? categories;
  List<String>? images;
  RestaurantModel({
    this.rId,
    this.name,
    this.about,
    this.coverImage,
    this.description,
    this.rate,
    this.location,
    this.address,
    this.categories,
    this.images,
  });
  RestaurantModel.fromJson(Map<String, dynamic> json){
    rId = json['rId'];
    name = json['name'];
    about = json['about'];
    coverImage = json['coverImage'];
    description = json['description'];
    rate = json['rate'];
    location = json['location'];
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
      'tId':rId,
      'name':name,
      'about':about,
      'cover_image':coverImage,
      'description':description,
    };
  }
}