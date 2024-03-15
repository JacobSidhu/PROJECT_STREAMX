/// terms_conditions.dart
///
/// This dart file contains the design for the term and conditions screen.
/// The design allow user to read terms and conditions with the usage of
/// the application. It file has only one StatelessWidget class.

/// Importing important packages and utilities required for the design.
import 'package:flutter/material.dart'; // Material Design package.
import 'package:animate_do/animate_do.dart';
import 'package:streamx/utils/theme.dart'; // importing animation.

/// This 'Policy' class extends StatelessWidget that encapsulates the UI design of the
/// Terms and conditions page.
class Policies extends StatelessWidget {
  const Policies({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: policiesPageAppBar(context: context),
        body: bodyContent(context: context));
  }

  /// The function 'policiesScreenAppBar' is responsible for to render
  /// app bar that can be used to display top bar in the screen.
  /// Returns: [AppBar] of type Widget. Parameters: [Context] to pop out the
  /// current context.
  AppBar policiesPageAppBar({required BuildContext context}) {
    const String kAppBarTitle = "Terms and Conditons";
    // Returing AppBar Widget.
    return AppBar(
      elevation: 0,
      backgroundColor: Theme.of(context).colorScheme.background,
      // Displaying Title of the AppBar.
      title: Text(kAppBarTitle,
          // Styling Text.
          style: AppTheme.textTheme.titleLarge),
      centerTitle: true, // centering title String.
      leading: IconButton(
          // On press popping the context to get back to the previous screen.
          onPressed: () => Navigator.of(context).pop(),
          // Assinging Arrow Back navigation button.
          icon: Icon(Icons.arrow_back)),
    );
  } // policiesPageAppBar() close.

  /// This function contains the body UI of the Screen within the Scaffold widget.
  /// It Contains a container and text to display within it. Returns [SlideInUp] that contains
  /// Container which contains the documentation. Parameters: [Context] to access theme of context
  /// within the function.
  SlideInUp bodyContent({required BuildContext context}) {
    // List of Constant values and measurements used for this UI design.
    const Duration kAnimationDuration = Durations.extralong2;
    // Document Container margin.
    const EdgeInsets kContainerMargin = EdgeInsets.fromLTRB(10, 10, 10, 0);
    // Border properties.
    const BorderRadiusGeometry kContainerBorderShape = BorderRadius.only(
        topLeft: Radius.circular(40), topRight: Radius.circular(40));
    // Const padding to the document text.
    const EdgeInsets kContainerPadding = EdgeInsets.all(20);
    // const document color.
    const Color kContainerColor = Colors.black;
    // Sample terms and conditions policies.
    const String kDocument =
        "By accessing Stream X application, you agree to our Terms and Privacy Policy. Our platform offers movie and TV show recommendations based on your preferences, and you agree to use it lawfully. Account creation may be required for certain features, and you are by your own responsible for maintaining your account's confidentiality. Any content you share on our platform may be used by us for the analysis to provide better experience. Our content and materials are protected by intellectual property laws. We're not liable for third-party links or the uninterrupted function of our services. You indemnify us for any claims arising from your use of our services. We reserve the right to modify these Terms, and disputes will be resolved under the laws of lancashire. For inquiries, contact us at jacobsidhu.study@gmail.com.";
    // Returing content within the animation effect.
    return SlideInUp(
        // Setting animation duration.
        duration: kAnimationDuration,
        // Container Containing terms and conditions string within it.
        // Margin to the Container.
        child: Expanded(
            child: Container(
                // Configuring the properties of the Container.
                margin: kContainerMargin,
                padding: kContainerPadding,
                // Container child Alignment.
                alignment: Alignment.topCenter,
                // Decorating Container.
                decoration: BoxDecoration(
                    // Container background Color.
                    color: kContainerColor,
                    // Setting container border properties.
                    borderRadius: kContainerBorderShape),
                // Encapsulating Document string within animation string.
                child: SlideInUp(
                  // Adding scroll to the String by putting it in SingleChildScrollView.
                  child: SingleChildScrollView(
                    // Displaying document.
                    child: Text(kDocument,
                        textAlign: TextAlign.left, // Setting TextAlign.
                        // Styling text.
                        style: AppTheme.textTheme.bodyMedium),
                  ),
                ))));
  }
}
