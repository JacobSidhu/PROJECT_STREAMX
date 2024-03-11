/// Importing essesntial packages for the application

import 'package:flutter/material.dart'; // Importing material package.
import 'package:provider/provider.dart';
import 'package:streamx/pages/homeScreen/home_screen.dart';
import 'package:streamx/utils/theme.dart'; // Importing utilities required for this file.

// Invoking the Main root class.
void main() async {
  /// This Methods ensures the widget initial bindings.
  WidgetsFlutterBinding.ensureInitialized();
  // Creating ThemeProvider instance.
  ThemeProvider themeProvider = ThemeProvider();
  // Applying user prefered theme.
  await themeProvider.applyUserTheme();

  /// This 'initializeApp()' of class Firebase ensures the initialization of the
  /// firebase platform based configurations and services for the application
  /// before running the application.
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  /// Running the application with changeNotifier.
  runApp(ChangeNotifierProvider(
      create: (context) => themeProvider, child: const StreamX()));
}

/// Class [StreamX] is defined to present the main home screen of the app
/// this is the root class of the application that returns the [MaterialApp()]
/// widget that acts as the wrapper for the application.
class StreamX extends StatelessWidget {
  // Creating class constructor.
  const StreamX({super.key});
  final Duration _themeAnimationDuration = Durations.extralong1;
  // Theme Change Animation Duration.
  @override
  // uilding context using build funtion.
  Widget build(BuildContext context) {
    // Returning MaterialApp class.
    return MaterialApp(
        // Invoking RegistrationPage() after successful authentication.
        home: HomeScreen(),
        themeAnimationDuration: _themeAnimationDuration,
        // Setting up dymanic theme for the application.
        theme: Provider.of<ThemeProvider>(context).themeData);
  }
}
