import 'package:flutter/material.dart';

const baseAPI =
    'http://ec2-65-2-13-251.ap-south-1.compute.amazonaws.com/bhavnagardarbarboarding/api_v1';

class BaseURL {
  static String get login => baseAPI + '/auth/login';
  static String get updateProfile => baseAPI + '/auth/update_profile';
  static String get scheduleList => baseAPI + '/schedule/list';
}
