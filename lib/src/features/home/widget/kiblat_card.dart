import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/util/bloc/prayer_timing_bloc/timing_bloc.dart';
import 'prayer_timing_widget.dart';

class KiblatCard extends StatelessWidget {
  const KiblatCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12.w,
        vertical: 12.h,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? Theme.of(context).cardColor
            : Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(10.r),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.grey.withValues(alpha: 0.2),
        //     spreadRadius: 0,
        //     blurRadius: 16,
        //     offset: Offset(0, 8),
        //   ),
        // ],
      ),
      child: BlocBuilder<TimingBloc, TimingState>(
        builder: (context, state) {
          if (state is TimingLoaded) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PrayerTimingWidget(
                  title: 'Fajr',
                  time: state.timing.data.timings.fajr,
                ),
                PrayerTimingWidget(
                  title: 'Sunrise',
                  time: state.timing.data.timings.sunrise,
                ),
                PrayerTimingWidget(
                  title: 'Dhuhr',
                  time: state.timing.data.timings.dhuhr,
                ),
                PrayerTimingWidget(
                  title: 'Asr',
                  time: state.timing.data.timings.asr,
                ),
                PrayerTimingWidget(
                  title: 'Maghrib',
                  time: state.timing.data.timings.maghrib,
                ),
                PrayerTimingWidget(
                  title: 'Isha',
                  time: state.timing.data.timings.isha,
                ),
              ],
            );
          }
          return SizedBox();

          // return AnimatedSwitcher(
          //   duration: kAnimationDuration,
          //   reverseDuration: Duration.zero,
          //   switchInCurve: kAnimationCurve,
          //   child: state is! TimingLoaded
          //       ? Container()
          //       : BlocProvider.value(
          //           value: TimerBloc(controller!.time),
          //           child: CountDownTimer(controller),
          //         ),
          // );
        },
      ),
    );
  }
}
