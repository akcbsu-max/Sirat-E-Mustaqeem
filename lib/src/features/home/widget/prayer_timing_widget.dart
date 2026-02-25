import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/util/bloc/time_format/time_format_bloc.dart';
import '../../../core/util/controller/timing_controller.dart';

class PrayerTimingWidget extends StatelessWidget {
  const PrayerTimingWidget(
      {super.key, required this.title, required this.time});
  final String title;
  final String time;
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: kCardPadding,
      // color: Colors.amber,
      child: Column(
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(
            height: 4.h,
          ),
          SvgPicture.asset(
            'assets/images/home_icon/svg/fajr.svg',
            width: 24.w,
            colorFilter: ColorFilter.mode(
              Theme.of(context).textTheme.bodyMedium!.color!,
              BlendMode.srcIn,
            ),
          ),
          SizedBox(
            height: 4.h,
          ),
          BlocBuilder<TimeFormatBloc, TimeFormatState>(
              builder: (context, timeFormatState) {
            return Text(
              timeFormatState.is24 ? time : convertTimeTo12HourFormat(time),
              style: Theme.of(context).textTheme.bodyLarge,
            );
          }),
        ],
      ),
    );
  }
}
