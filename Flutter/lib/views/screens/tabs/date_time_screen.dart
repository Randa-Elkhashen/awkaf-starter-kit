import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/views/style/app_style.dart';
import 'package:flutter_app/views/widgets/date_and_time/material_date_and_time_picker.dart';
import 'package:flutter_app/views/widgets/date_and_time/material_date_picker.dart';
import 'package:flutter_app/views/widgets/date_and_time/material_time_picker.dart';
import 'package:flutter_app/views/widgets/titles/app_sub_title.dart';
import 'package:flutter_app/views/widgets/titles/app_title.dart';
class DateTimeScreen extends StatelessWidget {
  const DateTimeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16 * AppStyle.scaleFactor),
      children: [
        AppSubTitle("Material Picker"),
        SizedBox(height: 8 * AppStyle.scaleFactor,),
        MaterialDateAndTimePicker(
          onPick: (dateTime){},
        ),
        SizedBox(height: 8 * AppStyle.scaleFactor,),
        Row(
          children: [
            Expanded(
              child: MaterialDatePicker(
                onPick: (dateTime){},
              ),
            ),
            SizedBox(width: 8 * AppStyle.scaleFactor,),
            Expanded(
              child: MaterialTimePicker(
                onPick: (time){},
              ),
            ),
          ],
        ),
        SizedBox(height: 8 * AppStyle.scaleFactor,),
        AppSubTitle("IOS Picker"),
        SizedBox(height: 8 * AppStyle.scaleFactor,),
        SizedBox(
          height: 140 * AppStyle.scaleFactor,
          child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.dateAndTime,
              onDateTimeChanged: (dateTime) {}
          ),
        ),
        SizedBox(height: 8 * AppStyle.scaleFactor,),
        SizedBox(
          height: 140 * AppStyle.scaleFactor,
          child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (dateTime) {}
          ),
        ),
        SizedBox(height: 8 * AppStyle.scaleFactor,),
        SizedBox(
          height: 140 * AppStyle.scaleFactor,
          child: CupertinoTimerPicker(
              mode: CupertinoTimerPickerMode.hms,
              onTimerDurationChanged: (value) {}
          ),
        ),

      ],
    );
  }
}
