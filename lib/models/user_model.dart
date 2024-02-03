class UserModel{
  String? uId;
  String? name;
  String? email;
  String? phone;
  bool? isEmailVerified;
  late String image;
  UserModel({
    this.uId,
    this.email,
    this.name,
    this.phone,
    this.isEmailVerified,
    this.image = "",
  });
  UserModel.fromJson(Map<String, dynamic> json){
    uId = json['uId'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    isEmailVerified = json['isEmailVerified'];
    if(json['image'] == null){
      image = "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png";
    }
    else
    {image = json['image'];}

  }
  Map<String,dynamic> toMap(){
    return{
      'uId':uId,
      'name':name,
      'email':email,
      'phone':phone,
      'isEmailVerified':isEmailVerified,
      'image':image,
    };
  }
}
// class UserModel {
//   String? name;
//   String? userName;
//   String? password;
//   String? passwordConfirmation;
//   String? phone;
//   String? email;
//   String? address1;
//   String? address2;
//   String? address3;
//   int? cityId;
//   late String image;
//   UserModel(
//       {this.name,
//         this.userName,
//         this.password,
//         this.passwordConfirmation,
//         this.phone,
//         this.email,
//         this.address1,
//         this.address2,
//         this.address3,
//         this.cityId,
//         this.image = "",
//       });
//
//   UserModel.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     userName = json['user_name'];
//     password = json['password'];
//     passwordConfirmation = json['password_confirmation'];
//     phone = json['phone'];
//     email = json['email'];
//     address1 = json['address1'];
//     address2 = json['address2'];
//     address3 = json['address3'];
//     cityId = json['city_id'];
//     if(json['image'] == null){
//       image = "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png";
//     }
//     else
//     {image = json['image'];}
//
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = this.name;
//     data['user_name'] = this.userName;
//     data['password'] = this.password;
//     data['password_confirmation'] = this.passwordConfirmation;
//     data['phone'] = this.phone;
//     data['email'] = this.email;
//     data['address1'] = this.address1;
//     data['address2'] = this.address2;
//     data['address3'] = this.address3;
//     data['city_id'] = this.cityId;
//     return data;
//   }
// }
