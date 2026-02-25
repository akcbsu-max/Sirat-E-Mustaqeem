import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:geocoding/geocoding.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../../error/failures.dart';
import '../../model/geocoding.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends HydratedBloc<LocationEvent, LocationState> {
  LocationBloc()
      : super(LocationInitial(
            34,
            123,
            LocalFailure(
              error: 0,
              message: 'initializing',
            ),
            null)) {
    on<LocationEvent>((event, emit) async {
      if (event is InitLocation) {
        emit(LocationLoading(state.latitude, state.longitude));
        // final result = await getCurrentPosition();
        var placemark =
            await getAddressFromLatLng(state.latitude, state.longitude);
        // result.fold(
        //     (l) => emit(LocationFailed(state.latitude, state.longitude, l)),
        //     (r) async {
        //   log('Message: ${r.latitude}, ${r.longitude}');
        //   final address = await getAddress(r.latitude, r.longitude);
        //   address.fold(
        //     (l) => log('Message Error: ${l.message}'),
        //     (r) {
        //       log('Message:::: ${r.results?[0].formattedAddress}');
        //     },
        //   );
        emit(LocationSuccess(state.latitude, state.longitude, null,
            placemark: placemark));
        // });
      }
    });
  }

  @override
  LocationState? fromJson(Map<String, dynamic> json) {
    try {
      LocalFailure? failure;
      if ((json['error'] as int?) != null) {
        failure = LocalFailure(
          error: json['error'] as int,
          message: json['message'].toString(),
          extraInfo: json['extraInfo']?.toString(),
        );
        return LocationFailed(
          json['latitude'] as double,
          json['longitude'] as double,
          failure,
        );
      } else {
        return LocationSuccess(
          json['latitude'] as double,
          json['longitude'] as double,
          json['geometry'] != null ? Geometry.fromJson(json['geometry']) : null,
        );
      }
    } catch (e) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(LocationState state) {
    try {
      return {
        'latitude': state.latitude,
        'longitude': state.longitude,
        'geometry': state.geometry?.toJson(),
        'error': state.failure?.error,
        'message': state.failure?.message,
        'extraInfo': state.failure?.extraInfo,
      };
    } catch (e) {
      return null;
    }
  }
}

Future<Placemark?> getAddressFromLatLng(double lat, double lng) async {
  try {
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, lng);

    if (placemarks.isNotEmpty) {
      return placemarks[0];
    }
  } catch (e) {
    log(e.toString());
  }
  return null;
}
