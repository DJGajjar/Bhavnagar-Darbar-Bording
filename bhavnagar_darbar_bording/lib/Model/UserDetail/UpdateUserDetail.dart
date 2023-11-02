import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:ffi';

class UpdateUserDetail {
  final String message;
  final String student_id;
  final String full_name;
  final String city;
  final String mobile_number;
  final String status;
  final String is_profile_completed;
  UpdateUserDetail({
    required this.message,
    required this.student_id,
    required this.full_name,
    required this.city,
    required this.mobile_number,
    required this.status,
    required this.is_profile_completed,
  });

  UpdateUserDetail copyWith({
    String? message,
    String? student_id,
    String? full_name,
    String? city,
    String? mobile_number,
    String? status,
    String? is_profile_completed,
  }) {
    return UpdateUserDetail(
      message: message ?? this.message,
      student_id: student_id ?? this.student_id,
      full_name: full_name ?? this.full_name,
      city: city ?? this.city,
      mobile_number: mobile_number ?? this.mobile_number,
      status: status ?? this.status,
      is_profile_completed: is_profile_completed ?? this.is_profile_completed,
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
    };
  }

  // factory UserDetail.fromMap(Map<String, dynamic> map) {
  factory UpdateUserDetail.fromJson(Map<String, dynamic> json) {
    return UpdateUserDetail(
      message: json['message'] ?? '',
      student_id: json['student_id'] ?? '',
      full_name: json['full_name'] ?? '',
      city: json['city'] ?? '',
      mobile_number: json['mobile_number'] ?? '',
      status: json['status'].toString() ?? '0',
      is_profile_completed: json['is_profile_completed'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  // factory UserDetail.fromJson(String source) =>
  //     UserDetail.fromJson(json.decode(source));

  @override
  String toString() {
    return 'UserDetail(message: $message, student_id:$student_id, full_name:$full_name, city:$city, mobile_number:$mobile_number, status: $status, is_profile_completed:$is_profile_completed)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UpdateUserDetail &&
        other.message == message &&
        other.student_id == student_id &&
        other.full_name == full_name &&
        other.city == city &&
        other.mobile_number == mobile_number &&
        other.status == status &&
        other.is_profile_completed == is_profile_completed;
  }

  @override
  int get hashCode {
    return message.hashCode ^
        student_id.hashCode ^
        full_name.hashCode ^
        city.hashCode ^
        mobile_number.hashCode ^
        status.hashCode ^
        is_profile_completed.hashCode.hashCode;
  }
}
