import 'dart:convert';

class UserModel{
  String title,description;
  int?id;


  UserModel({required this.title,required this.description,this.id
  });


  Map<String,dynamic>toMap(){
    return {
      "title":title,
      "description":description,
      "id":id,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        title: map['title']??"",
      description: map['description']??"",
      id: map['id']??0,
    );
    }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

}