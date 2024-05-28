import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'color_constant.dart';


/*
w100 - thin
w200 - extraLight
w300 - light
w400 - regular
w500 - medium
w600 - semiBold
w700 - bold
w800 - extraBold
w900 - black
 */

class TextStyleConstant {
  static TextStyle semiBold30({Color? color}) {
    return TextStyle(
      fontSize: Get.width * 0.072,
      color: color ?? ColorConstant.black,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle semiBold36({Color? color}) {
    return TextStyle(
      fontSize: Get.width * 0.087,
      color: color ?? ColorConstant.black,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle semiBold16({Color? color}) {
    return TextStyle(
      fontSize: Get.width * 0.038,
      color: color ?? ColorConstant.black,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle semiBold24({Color? color}) {
    return TextStyle(
      fontSize: Get.width * 0.058,
      color: color ?? ColorConstant.black,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle medium18({Color? color}) {
    return TextStyle(
      fontSize: Get.width * 0.043,
      color: color ?? ColorConstant.black,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle medium16({Color? color}) {
    return TextStyle(
      fontSize: Get.width * 0.038,
      color: color ?? ColorConstant.black,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle regular16({Color? color}) {
    return TextStyle(
      fontSize: Get.width * 0.038,
      color: color ?? ColorConstant.black,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle medium14({Color? color}) {
    return TextStyle(
      fontSize: Get.width * 0.034,
      color: color ?? ColorConstant.black,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle semiBold18({Color? color}) {
    return TextStyle(
      fontSize: Get.width * 0.043,
      color: color ?? ColorConstant.black,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle semiBold22({Color? color}) {
    return TextStyle(
      fontSize: Get.width * 0.053,
      color: color ?? ColorConstant.black,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle medium22({Color? color}) {
    return TextStyle(
      fontSize: Get.width * 0.053,
      color: color ?? ColorConstant.black,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle semiBold26({Color? color}) {
    return TextStyle(
      fontSize: Get.width * 0.063,
      color: color ?? ColorConstant.black,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle bold26({Color? color}) {
    return TextStyle(
      fontSize: Get.width * 0.063,
      color: color ?? ColorConstant.black,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle bold30({Color? color}) {
    return TextStyle(
      fontSize: Get.width * 0.072,
      color: color ?? ColorConstant.black,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle semiBold14({Color? color}) {
    return TextStyle(
      fontSize: Get.width * 0.034,
      color: color ?? ColorConstant.black,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle medium12({Color? color}) {
    return TextStyle(
      fontSize: Get.width * 0.029,
      color: color ?? ColorConstant.black,
      fontWeight: FontWeight.w500,
    );
  }
}
