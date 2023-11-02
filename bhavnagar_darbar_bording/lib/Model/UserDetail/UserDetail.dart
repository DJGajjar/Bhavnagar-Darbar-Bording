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
  final String student_id;
  final String full_name;
  final String city;
  final String mobile_number;
  final String status;
  final String is_profile_completed;
  final String token;
  UserDetail({
    required this.message,
    required this.student_id,
    required this.full_name,
    required this.city,
    required this.mobile_number,
    required this.status,
    required this.is_profile_completed,
    required this.token,
  });

  UserDetail copyWith({
    String? message,
    String? student_id,
    String? full_name,
    String? city,
    String? mobile_number,
    String? status,
    String? is_profile_completed,
    String? token,
  }) {
    return UserDetail(
      message: message ?? this.message,
      student_id: student_id ?? this.student_id,
      full_name: full_name ?? this.full_name,
      city: city ?? this.city,
      mobile_number: mobile_number ?? this.mobile_number,
      status: status ?? this.status,
      is_profile_completed: is_profile_completed ?? this.is_profile_completed,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'student_id': student_id,
      'full_name': full_name,
      'city': city,
      'mobile_number': mobile_number,
      'status': status,
      'is_profile_completed': is_profile_completed,
      'token': token,
    };
  }

  // factory UserDetail.fromMap(Map<String, dynamic> map) {
  factory UserDetail.fromJson(Map<String, dynamic> json) {
    return UserDetail(
      message: json['message'] ?? '',
      student_id: json['student_id'] ?? '',
      full_name: json['full_name'] ?? '',
      city: json['city'] ?? '',
      mobile_number: json['mobile_number'] ?? '',
      status: json['status'].toString() ?? '0',
      is_profile_completed: json['is_profile_completed'] ?? '',
      token: json['token'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  // factory UserDetail.fromJson(String source) =>
  //     UserDetail.fromJson(json.decode(source));

  @override
  String toString() {
    return 'UserDetail(message: $message, student_id:$student_id, full_name:$full_name, city:$city, mobile_number:$mobile_number, status: $status, is_profile_completed:$is_profile_completed, token:$token)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UserDetail &&
        other.message == message &&
        other.student_id == student_id &&
        other.full_name == full_name &&
        other.city == city &&
        other.mobile_number == mobile_number &&
        other.status == status &&
        other.is_profile_completed == is_profile_completed &&
        other.token == token;
  }

  @override
  int get hashCode {
    return message.hashCode ^
        student_id.hashCode ^
        full_name.hashCode ^
        city.hashCode ^
        mobile_number.hashCode ^
        status.hashCode ^
        is_profile_completed.hashCode.hashCode ^
        token.hashCode;
  }
}
