/// theatre.dart
///
/// File 'theatre.dart' contains the UI interface for the application for display
/// currently playing movies in the theatres, This file serves as the UI page to be used
/// inside HomeScreen Pageview. It has only one Class named as 'TheatrePage' that
/// extends with the StatelessWidget.

/// Importing essential packages and uitilities needed for the implementation of this design.
import 'package:flutter/material.dart'; // Material design package.
import 'package:streamx/utils/theme.dart'; // Importing essential utilities.

class TheatrePage extends StatelessWidget {
  const TheatrePage({super.key});
  @override // overridinf abstract build method.
  // Defining implementation of the build method.
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(),
    );
  }

  /// Function render the headline and time line of the movies in the Theatre.
  /// This function using the api to fetch time period for the movies in the theatre.
  /// Returns: [Container] that contains the headline and timeline.
  /// Parameters: [context] to style textLabels based on context theme.
  Container pageHeading({required BuildContext context}) {
    // constant padding to the heading container child.
    const EdgeInsets kPadding = EdgeInsets.all(10.0);
    const String kHeadline = "Currently In Theatres";
    // Returing Container containing Text() widget.
    return Container(
      // Adding padding to the container child.
      padding: kPadding,
      // Structuring Headline String and Timeline in column layout.
      child: Column(children: [
        // Displaying Heddline.
        Text(kHeadline,
            // Styling Headline String.
            style:
                AppTheme.textTheme(context: context).textTheme.headlineLarge),
        Text(kHeadline,
            // Styling timeline String.
            style: AppTheme.textTheme(context: context).textTheme.bodyMedium)
      ]),
    );
  }
}
