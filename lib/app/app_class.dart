import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppClass {
  static final AppClass _singleton = AppClass._internal();

  factory AppClass() {
    return _singleton;
  }

  AppClass._internal();

  static const Duration navigationDuration = Duration(
    milliseconds: 600,
  );
  RxBool isShowLoading = false.obs;

  void showLoading(bool value) {
    isShowLoading.value = value;
  }
}
