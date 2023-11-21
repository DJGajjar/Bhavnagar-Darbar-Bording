import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:ffi';
import 'package:json_annotation/json_annotation.dart';
part 'Paper_MaterialsModelList.dart';

class Paper_MaterialsDetail {
  String? message;

  @JsonKey(fromJson: _fromJsonSchedule)
  List<Map<String, dynamic>>? papers;

  String? id;

  String? subject_name;

  String? description;

  String? file_url;

  String? created_on;

  // List<PaperList?>? papers;
  // List<ProductCategory?>? papers;

  Map<String, dynamic>? rawData;

  Paper_MaterialsDetail({
    this.id,
    this.subject_name,
    this.description,
    this.file_url,
    this.created_on,
    this.rawData,
  });

  static List<Map<String, dynamic>> _fromJsonSchedule(dynamic data) {
    if (data is! List) return [];
    List<Map<String, dynamic>> value = [];
    for (int i = 0; i < data.length; i++) {
      if (data[i] is Map) {
        value.add(data[i]);
      }
    }
    return value;
  }

  factory Paper_MaterialsDetail.fromPaperJson(Map<String, dynamic> json) =>
      _$PaperMaterialsFromJson({
        ...json,
        "rawData": json,
      });

  factory Paper_MaterialsDetail.fromJson(Map<String, dynamic> json) =>
      _$PaperMaterialsFromJson({
        ...json,
        "rawData": json,
      });
}

// @JsonSerializable(createToJson: false)
// class PaperList {
//
//   String? id;
//
//   String? subject_name;
//
//   String? description;
//
//   String? file_url;
//
//   String? created_on;
//
//   Map<String, dynamic>? rawData;
//
//   PaperList({
//     this.id,
//     this.subject_name,
//     this.description,
//     this.file_url,
//     this.created_on,
//   });
//
//   static String _fromJson(dynamic value) {
//     if (value == '') return '0';
//     if (value is String) return value;
//     if (value is int || value is double) return value.toString();
//     return '0';
//   }
//
//   static List<Map<String, dynamic>> _fromJsonImage(dynamic data) {
//     if (data is! List) return [];
//     List<Map<String, dynamic>> value = [];
//     for (int i = 0; i < data.length; i++) {
//       if (data[i] is Map) {
//         value.add(data[i]);
//       }
//     }
//     return value;
//   }
//
//   static Map _fromAcfFields(dynamic data) {
//     if (data is! Map) return {};
//
//     return data;
//   }
//
//   static List<int>? _toListInt(dynamic data) {
//     if (data is List<dynamic>?) {
//       return data?.map((e) => e as int).toList();
//     }
//     return null;
//   }
// }
