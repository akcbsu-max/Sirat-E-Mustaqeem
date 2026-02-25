import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sirat_e_mustaqeem/src/core/util/bloc/location/location_bloc.dart';

class AddressWidget extends StatelessWidget {
  const AddressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationBloc, LocationState>(
      builder: (context, state) {
        if (state is LocationSuccess) {
          return Text(
            '${state.placemark?.name} ${state.placemark?.locality} ${state.placemark?.country}',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 18.sp,
                ),
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}
