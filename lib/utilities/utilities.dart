import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// const Color primaryColor = Color(0xFF0A0D22);
const Color primaryColor = Color(0xFF85d9f7);
Color containerColor = Colors.indigo[900].withOpacity(0.2);
// const Color containerColor = Color(0x1f85d9f7);
const Color textColor = Color.fromRGBO(255, 255, 255, 0.6);
const Color textColorPrimary = Color.fromRGBO(192, 192, 192, 1);

const gradientColor1 = Color(0xFF3366FF);
const gradientColor2 = Color(0xFF00CCFF);

const linerGradientBackground = LinearGradient(
  colors: [
    gradientColor1,
    gradientColor2,
  ],
  begin: const FractionalOffset(0.0, 0.0),
  end: const FractionalOffset(3.0, 0.2),
  stops: [0.0, 1.0],
  tileMode: TileMode.clamp,
);

// const scaffoldGradientDecoration = BoxDecoration(
//   gradient: linerGradientBackground,
// );

const kTemperatureTextStyle = TextStyle(
  fontWeight: FontWeight.w900,
  fontSize: 42.0,
  letterSpacing: 2,
  // fontFamily: 'Jomhuria',
  fontFamily: 'Montserrat',
);

const kNormalTextStyle = TextStyle(
  fontSize: 20.0,
  letterSpacing: 1.2,
  color: textColorPrimary,
);
const kSubTextStyle = TextStyle(
  fontSize: 14.0,
  letterSpacing: 1.5,
  color: textColorPrimary,
);
const kSamllTextColor = TextStyle(
  fontSize: 13.0,
  letterSpacing: 1.5,
  color: textColorPrimary,
);
const kSubTitleTextStyle = TextStyle(
  fontSize: 16.0,
  letterSpacing: 1.5,
  color: textColorPrimary,
);

const kTitleIconTextStyle = TextStyle(
  fontSize: 40.0,
);
const kTitleTextStyle = TextStyle(
  fontSize: 16.0,
  letterSpacing: 1.2,
);

// padding for row gap bottom container
const EdgeInsetsGeometry rowGap =
    EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0);

/* CODE FROM Stack Oveflow */
Map readTimestamp(int timestamp) {
  var returnData;
  var now = DateTime.now();
  var format = DateFormat('HH:mm a');
  var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  var diff = now.difference(date);

  var time = '';
  if (diff.inSeconds <= 0 ||
      diff.inSeconds > 0 && diff.inMinutes == 0 ||
      diff.inMinutes > 0 && diff.inHours == 0 ||
      diff.inHours > 0 && diff.inDays == 0) {
    time = format.format(date);
  } else if (diff.inDays > 0 && diff.inDays < 7) {
    if (diff.inDays == 1) {
      time = diff.inDays.toString() + ' DAY AGO';
    } else {
      time = diff.inDays.toString() + ' DAYS AGO';
    }
  } else {
    if (diff.inDays == 7) {
      time = (diff.inDays / 7).floor().toString() + ' WEEK AGO';
    } else {
      time = (diff.inDays / 7).floor().toString() + ' WEEKS AGO';
    }
  }
  var timeFormat = DateFormat('hh:mm:a');
  var dateFormat = DateFormat('dd MMMM');
  returnData = {
    'time': '${timeFormat.format(date)}',
    'date_time': date,
    'date': dateFormat.format(date),
  };

  return returnData;
}

void readUNIXTime(int unixTime) {
  // var inMS = unixTime * 1000;
  var realDateTime = DateTime.fromMillisecondsSinceEpoch(unixTime * 1000);
  String date = DateFormat('dd MMMM').format(realDateTime);
  String timeConverted = DateFormat.jm().format(realDateTime);
  print('Date Time ----------> $timeConverted');
  print('Date date ----------> $date');
}
