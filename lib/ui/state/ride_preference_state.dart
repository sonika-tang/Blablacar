import 'package:flutter/widgets.dart';

import '../../data/repositories/ride_preference/ride_preference_repository.dart';
import '../../model/ride_pref/ride_pref.dart';

// This global state owns two things:
//   1. The currently selected ride preference (what the user is searching for)
//   2. The history of past preferences (shown on the home screen)
//
// It replaces the old RidePrefsService which was a static class with no reactivity.
class RidePreferenceState extends ChangeNotifier {
  final RidePreferenceRepository repository;

  RidePreference? _currentPreference;
  List<RidePreference> _history = [];

  static const int maxAllowedSeats = 8;

  RidePreferenceState({required this.repository}) {
    init();
  }

  RidePreference? get currentPreference => _currentPreference;
  List<RidePreference> get history => List.unmodifiable(_history);

  void init() {
    _history = List.from(repository.fetchHistory());

    // Pre-select the most recent preference if history exists
    if (_history.isNotEmpty) {
      _currentPreference = _history.last;
    }
  }

  void selectPreference(RidePreference preference) {
    // Do nothing if the user picked the exact same preference again
    if (preference == _currentPreference) return;

    _currentPreference = preference;
    _history.add(preference);
    repository.savePreference(preference);

    notifyListeners();
  }
}
