class ForumModel{
  String? fId;
  String? name;
  String? about;
  String? coverImage;
  String? description;
  String? location;
  String? address;
  String? rate;
  List<String>? categories;
  List<String>? images;
  ForumModel({
    this.fId,
    this.name,
    this.about,
    this.coverImage,
    this.description,
    this.location,
    this.address,
    this.categories,
    this.images,
    this.rate,
  });
  ForumModel.fromJson(Map<String, dynamic> json){
    fId = json['fId'];
    name = json['name'];
    about = json['about'];
    coverImage = json['coverImage'];
    description = json['description'];
    location = json['location'];
    rate = json['rate'];
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
      'tId':fId,
      'name':name,
      'about':about,
      'cover_image':coverImage,
      'description':description,
    };
  }
}