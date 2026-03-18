import 'package:blabla/data/dummy_data.dart';
import 'package:blabla/data/repositories/ride/ride_repository.dart';
import 'package:blabla/model/ride/ride.dart';
import 'package:blabla/model/ride_pref/ride_pref.dart';

class RideRepositoryMock implements RideRepository {
  @override
  List<Ride> fetchRides() {
    return fakeRides;
  }

  // The repository owns the filtering logic
  // The ViewModel just calls this and passes the result to the UI
  @override
  List<Ride> fetchRidesFor(RidePreference preference) {
    return fakeRides.where((ride) {
      final matchesDeparture = ride.departureLocation == preference.departure;
      final matchesArrival = ride.arrivalLocation == preference.arrival;
      final hasEnoughSeats = ride.availableSeats >= preference.requestedSeats;
      return matchesDeparture && matchesArrival && hasEnoughSeats;
    }).toList();
  }
}
