part of 'TimeTableDetail.dart';

TimeTableDetail _$TimeTableFromJson(Map<String, dynamic> json) =>
    TimeTableDetail(
      schedule_date: json['schedule_date'] as String?,
      schedule_day: json['schedule_day'] as String?,
      schedule: TimeTableDetail._fromJsonSchedule(json['schedule']),
      rawData: json['rawData'] as Map<String, dynamic>?,
    );
