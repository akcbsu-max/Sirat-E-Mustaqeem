import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/util/constants.dart';

class SiratCard extends StatelessWidget {
  const SiratCard({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: kPagePadding,
      padding: kCardPadding,
      decoration: BoxDecoration(
        // color: Theme.of(context).brightness == Brightness.dark
        //     ? Theme.of(context).cardColor
        //     : Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: child,
    );
  }
}
