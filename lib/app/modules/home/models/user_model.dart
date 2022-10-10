import 'dart:convert';

class UserModel {
  String? uid;
  String? email;
  String? username;
  String? fullName;
  String? bio;
  UserModel({
    this.uid,
    this.email,
    this.username,
    this.fullName,
    this.bio,
  });


  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    if(uid != null){
      result.addAll({'uid': uid});
    }
    if(email != null){
      result.addAll({'email': email});
    }
    if(username != null){
      result.addAll({'username': username});
    }
    if(fullName != null){
      result.addAll({'fullName': fullName});
    }
    if(bio != null){
      result.addAll({'bio': bio});
    }
  
    return result;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      username: map['username'],
      fullName: map['fullName'],
      bio: map['bio'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));
}
