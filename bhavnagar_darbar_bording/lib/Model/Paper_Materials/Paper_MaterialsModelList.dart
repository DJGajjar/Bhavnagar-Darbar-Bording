part of 'Paper_MaterialsDetail.dart';

Paper_MaterialsDetail _$PaperMaterialsFromJson(Map<String, dynamic> json) =>
    Paper_MaterialsDetail(
      id: json['id'] as String?,
      subject_name: json['subject_name'] as String?,
      description: json['description'] as String?,
      file_url: json['file_url'] as String?,
      created_on: json['created_on'] as String?,
      rawData: json['rawData'] as Map<String, dynamic>?,
    );
