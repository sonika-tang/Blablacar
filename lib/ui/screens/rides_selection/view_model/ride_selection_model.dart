// The ViewModel answers the question:
// "Who computes the matching rides?"
//
// The repository knows HOW to filter
// The ViewModel decides WHEN to filter and exposes the result to the view

import 'package:blabla/data/repositories/ride/ride_repository.dart';
import 'package:blabla/model/ride/ride.dart';
import 'package:blabla/model/ride_pref/ride_pref.dart';
import 'package:blabla/ui/state/ride_preference_state.dart';
import 'package:flutter/material.dart';

class RidesSelectionViewModel extends ChangeNotifier {
  final RideRepository _rideRepository;
  final RidePreferenceState _preferenceState;

  RidesSelectionViewModel({
    required RideRepository rideRepository,
    required RidePreferenceState preferenceState,
  }) : _rideRepository = rideRepository,
       _preferenceState = preferenceState {
    _preferenceState.addListener(_onPreferenceChanged);
  }

  void _onPreferenceChanged() {
    notifyListeners();
  }

  // Getter expose to RideSelectionCotent
  // Not null here — rides selection screen is only reachable after a preference is set
  RidePreference get currentPreference => _preferenceState.currentPreference!;

  List<Ride> get matchingRide {
    return _rideRepository.fetchRidesFor(currentPreference);
  }

  // Action
  void updatePreference(RidePreference ridePreference) {
    _preferenceState.selectPreference(ridePreference);
  }

  @override
  void dispose() {
    _preferenceState.removeListener(_onPreferenceChanged);
    super.dispose();
  }
}
