import 'package:blabla/data/dummy_data.dart';
import 'package:blabla/data/repositories/ride_preference/ride_preference_repository.dart';
import 'package:blabla/model/ride_pref/ride_pref.dart';

class RidePreferenceRepositoryMock implements RidePreferenceRepository {
  // Seeded with some fake history so the home screen
  final List<RidePreference> _history = List.from(fakeRidePrefs);

  @override
  List<RidePreference> fetchHistory() {
    return List.unmodifiable(_history);
  }

  @override
  void savePreference(RidePreference preference) {
    _history.add(preference);
  }
}
