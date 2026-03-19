import 'package:blabla/ui/state/ride_preference_state.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'data/repositories/location/location_repository.dart';
import 'data/repositories/location/location_repository_mock.dart';
import 'data/repositories/ride/ride_repository.dart';
import 'data/repositories/ride/ride_repository_mock.dart';
import 'data/repositories/ride_preference/ride_preference_repository_mock.dart';
import 'ui/screens/home/home_screen.dart';
import 'ui/theme/theme.dart';

void main() {
  final preferenceRepository = RidePreferenceRepositoryMock();

  runApp(
    MultiProvider(
      providers: [
        Provider<LocationRepository>(create: (_) => LocationRepositoryMock()),
        Provider<RideRepository>(create: (_) => RideRepositoryMock()),
        ChangeNotifierProvider<RidePreferenceState>(
          create: (_) => RidePreferenceState(repository: preferenceRepository),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: blaTheme,
        home: Scaffold(body: HomeScreen()),
      ),
    ),
  );
}
