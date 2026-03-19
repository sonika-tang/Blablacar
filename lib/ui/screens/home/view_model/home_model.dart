import 'package:blabla/ui/state/ride_preference_state.dart';
import 'package:flutter/widgets.dart';

import '../../../../model/ride_pref/ride_pref.dart';

// The HomeViewModel is the brain of the home screen.
// It listens to RidePreferenceState and tells the view when to rebuild.
class HomeViewModel extends ChangeNotifier {
  final RidePreferenceState preferenceState;

  HomeViewModel({required this.preferenceState}) {
    preferenceState.addListener(_onPreferenceStateChanged);
  }

  void _onPreferenceStateChanged() {
    notifyListeners();
  }

  // Getters exposed to HomeContent
  RidePreference? get currentPreference => preferenceState.currentPreference;

  // Most recent first — the home screen shows history reversed
  List<RidePreference> get preferenceHistory => preferenceState.history.reversed.toList();

  // Actions exposed to HomeContent
  void selectPreference(RidePreference preference) {
    preferenceState.selectPreference(preference);
  }

  @override
  void dispose() {
    preferenceState.removeListener(_onPreferenceStateChanged);
    super.dispose();
  }
}
