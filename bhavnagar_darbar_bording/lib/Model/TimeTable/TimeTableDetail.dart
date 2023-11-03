import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:ffi';
import 'package:json_annotation/json_annotation.dart';
part 'TimeTableModelList.dart';

class TimeTableDetail {
  String? message;

  String? schedule_date;

  String? schedule_day;

  @JsonKey(fromJson: _fromJsonSchedule)
  List<Map<String, dynamic>>? schedule;

  Map<String, dynamic>? rawData;

  TimeTableDetail({
    this.schedule_date,
    this.schedule_day,
    this.schedule,
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

  factory TimeTableDetail.fromJson(Map<String, dynamic> json) =>
      _$TimeTableFromJson({
        ...json,
        "rawData": json,
      });
}
