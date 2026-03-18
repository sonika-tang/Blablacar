import 'package:blabla/model/ride_pref/ride_pref.dart';

abstract class RidePreferenceRepository {
  // Returns the previously saved ride preferences (history)
  List<RidePreference> fetchHistory();

  // Persists a new preference to the history
  void savePreference(RidePreference preference);
}
