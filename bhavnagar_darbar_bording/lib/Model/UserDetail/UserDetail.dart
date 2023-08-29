import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:ffi';

// List<User> userFromJson(String str) =>
//     List<User>.from(json.decode(str).map((x) => User.fromJson(x)));
// String userToJson(List<User> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

/*class User {
  User({
    required this.isverify,
    required this.isuserdetails,
    required this.username,
    required this.city,
    required this.mobilenumber,
    required this.user_id,
  });
  bool isverify;
  bool isuserdetails;
  String username;
  String city;
  String mobilenumber;
  int user_id;

  factory User.fromJson(Map<String, dynamic> json) => User(
      isverify: json["isverify"],
      isuserdetails: json["isuserdetails"],
      username: json["username"],
      city: json["city"],
      mobilenumber: json["mobilenumber"],
      user_id: json["user_id"]);
  Map<String, dynamic> toJson() => {
        "isverify": isverify,
        "isuserdetails": isuserdetails,
        "username": username,
        "city": city,
        "mobilenumber": mobilenumber,
        "user_id": user_id
      };
}*/

class UserDetail {
  final String message;
  final bool isverify;
  final bool isuserdetails;
  final String username;
  final String city;
  final String mobilenumber;
  final String user_id;
  UserDetail({
    required this.message,
    required this.isverify,
    required this.isuserdetails,
    required this.username,
    required this.city,
    required this.mobilenumber,
    required this.user_id,
  });

  UserDetail copyWith({
    String? message,
    bool? isverify,
    bool? isuserdetails,
    String? username,
    String? city,
    String? mobilenumber,
    String? user_id,
  }) {
    return UserDetail(
      message: message ?? this.message,
      isverify: isverify ?? this.isverify,
      isuserdetails: isuserdetails ?? this.isuserdetails,
      username: username ?? this.username,
      city: city ?? this.city,
      mobilenumber: mobilenumber ?? this.mobilenumber,
      user_id: user_id ?? this.user_id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'isverify': isverify,
      'isuserdetails': isuserdetails,
      'username': username,
      'city': city,
      'mobilenumber': mobilenumber,
      'user_id': user_id,
    };
  }

  // factory UserDetail.fromMap(Map<String, dynamic> map) {
  factory UserDetail.fromJson(Map<String, dynamic> json) {
    return UserDetail(
      message: json['message'] ?? '',
      isverify: json['isverify'] ?? false,
      isuserdetails: json['isuserdetails'] ?? false,
      username: json['username'] ?? '',
      city: json['city'] ?? '',
      mobilenumber: json['mobilenumber'] ?? '',
      user_id: json['user_id'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  // factory UserDetail.fromJson(String source) =>
  //     UserDetail.fromJson(json.decode(source));

  @override
  String toString() {
    return 'UserDetail(message: $message, isverify:$isverify, isuserdetails:$isuserdetails, username:$username, city:$city, mobilenumber:$mobilenumber, user_id: $user_id)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UserDetail &&
        other.message == message &&
        other.isverify == isverify &&
        other.isuserdetails == isuserdetails &&
        other.username == username &&
        other.city == city &&
        other.mobilenumber == mobilenumber &&
        other.user_id == user_id;
  }

  @override
  int get hashCode {
    return message.hashCode ^
        isverify.hashCode ^
        isuserdetails.hashCode ^
        username.hashCode ^
        city.hashCode ^
        mobilenumber.hashCode ^
        user_id.hashCode;
  }
}
