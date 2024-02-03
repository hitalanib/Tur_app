class LocationModel {
  String? lId;
  String? name;

  LocationModel({
    this.lId,
    this.name,

  });

  LocationModel.fromJson(Map<String, dynamic> json){
    lId = json['uId'];
    name = json['name'];
  }
}