import 'package:blabla/model/ride/locations.dart';

import '../data/dummy_data.dart';
import '../model/ride/ride.dart';

////
///   This service handles:
///   - The list of available rides
///
class RidesService {
  static List<Ride> allRides = fakeRides;

  static List<Ride> _filterByDeparture(Location departure) {
    return allRides
        .where((ride) => ride.departureLocation == departure)
        .toList();
  }

  static List<Ride> _filterBySeatRequested(int seatRequested) {
    return allRides
        .where((ride) => ride.availableSeats >= seatRequested)
        .toList();
  }

  static List<Ride> filterBy({Location? departure, int? seatRequested}) {
    return allRides.where((ride) {
      if (departure != null && ride.departureLocation != departure) {
        return false;
      }
      if (seatRequested != null && ride.availableSeats < seatRequested) {
        return false;
      }

      return true;
    }).toList();
  }
}
