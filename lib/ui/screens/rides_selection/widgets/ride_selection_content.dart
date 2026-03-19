import 'package:blabla/ui/screens/rides_selection/view_model/ride_selection_model.dart';
import 'package:blabla/ui/screens/rides_selection/widgets/ride_preference_modal.dart';
import 'package:flutter/material.dart';

import '../../../../model/ride/ride.dart';
import '../../../../model/ride_pref/ride_pref.dart';
import '../../../../utils/animations_util.dart';
import '../../../theme/theme.dart';
import 'rides_selection_header.dart';
import 'rides_selection_tile.dart';

// Pure StatelessWidget — no setState anywhere.
// The ViewModel notifies this widget when preference changes.
class RidesSelectionContent extends StatelessWidget {
  final RidesSelectionViewModel vm;

  const RidesSelectionContent({super.key, required this.vm});

  void _onBackTap(BuildContext context) {
    Navigator.pop(context);
  }

  void _onRideSelected(Ride ride) {
    // TODO: navigate to ride detail
  }

  void _onFilterPressed() {
    // TODO: open filter sheet
  }

  void _onPreferencePressed(BuildContext context) async {
    final newPreference = await Navigator.of(context).push<RidePreference>(
      AnimationUtils.createRightToLeftRoute(
        RidePreferenceModal(initialPreference: vm.currentPreference),
      ),
    );

    if (newPreference != null) {
      vm.updatePreference(newPreference);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: BlaSpacings.m,
          right: BlaSpacings.m,
          top: BlaSpacings.s,
        ),
        child: Column(
          children: [
            RideSelectionHeader(
              ridePreference: vm.currentPreference,
              onBackPressed: () => _onBackTap(context),
              onFilterPressed: _onFilterPressed,
              onPreferencePressed: () => _onPreferencePressed(context),
            ),

            SizedBox(height: 100),

            Expanded(
              child: ListView.builder(
                itemCount: vm.matchingRide.length,
                itemBuilder: (ctx, index) => RideSelectionTile(
                  ride: vm.matchingRide[index],
                  onPressed: () => _onRideSelected(vm.matchingRide[index]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
