import 'package:blabla/data/repositories/ride/ride_repository.dart';
import 'package:blabla/ui/screens/rides_selection/view_model/ride_selection_model.dart';
import 'package:blabla/ui/screens/rides_selection/widgets/ride_selection_content.dart';
import 'package:blabla/ui/state/ride_preference_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RidesSelectionScreen extends StatelessWidget {
  const RidesSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = RidesSelectionViewModel(
      rideRepository: context.read<RideRepository>(),
      preferenceState: context.read<RidePreferenceState>(),
    );

    return ListenableBuilder(
      listenable: vm,
      builder: (context, _) => RidesSelectionContent(vm: vm),
    );
  }
}
