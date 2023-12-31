import 'package:flutter/material.dart';

void consoleLog(String val) {
  for (var i = 0; i < val.length; i += 1024) {
    debugPrint(val.substring(i, i + 1024 < val.length ? i + 1024 : val.length));
  }
}

Color kAccentColor = Colors.deepPurple;
Color kSuccessColor = Colors.green;
Color kErrorColor = Colors.red;


const kDefaultPadding = 20.0;

const kSizedBox = SizedBox(height: kDefaultPadding);
const kWidthSizedBox = SizedBox(width: kDefaultPadding);

const kHalfSizedBox = SizedBox(height: kDefaultPadding / 2);