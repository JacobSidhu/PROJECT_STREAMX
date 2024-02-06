/// registration_page.dart
///
/// This dart file encapsulates the design and functionality required to implement an
/// account registration interface within the application. Allows the user to
/// signUp and SignIn using this interface for the application . File contains different
/// classes and methods to made up this registration interface.

/// Importing essential packages
import 'package:flutter/material.dart'; // The core Flutter material library, which includes a variety of widgets aligned with Material Design guidelines.
import 'package:animate_do/animate_do.dart'; // This package provides utilities for adding animations to Flutter widgets.
import 'package:streamx/utils/const_colors.dart';

/// Importing project-specific utilities.
import 'package:streamx/utils/const_methods.dart'; // Constant values.
import 'package:streamx/utils/const_values.dart'; // Constant classes and methods.

/// This class defined to conceal all components required for
/// each page within the interface design.
class FormComponents {
  /// Constant strings used for each page design.
  /// TextField hinttext strings
  static const String kHintTextUsername =
      'Username'; // Username textField hinttext.
  static const String kHintTextPassword =
      'Password'; // Password textField hinttext.
  static const String kHintTextConfirmPassword =
      "Confirm Password"; // Confirm password textField hinttext.
  static const String kHintTextNewPassword =
      "New password"; // New password textField hinttext.
  static const String kHintTextEmail =
      "Example@gmail.com"; // Email textField hinttext.
  static const String kHintTextVerificationCode =
      "Verification code"; // Verification code textfield hinttext.
  /// Prompt strings
  static const String kSignUpPromptText =
      "New to StreamX?"; // Prompt text for SignUp.
  static const String kAlreadyHaveAccountPromptText =
      "Already have an account?"; // Prompt Text for SignIn.
  static const String kNewToScreamXPromptText =
      "New to StreamX?"; // Prompt Text for SignUp.
  static const String kPasswordResetPromptText =
      "Forget Password?"; // Prompt text for reseting password.
  static const String kCodeResendPromptText =
      "Havent't received code?"; // Prompt text for resending verification code.
  static const String kOrText = 'Or'; // 'or' text used in the dividing line.
  /// Constant button's label text strings.
  static const String kLoginFButtonLabel = 'LOGIN'; // Login button label.
  static const String kJoinFButtonLabel = 'JOIN'; // Join button label.
  static const String kCreateFButtonLabel = 'RESET'; // Reset button label.
  static const String kCodeRequestFButtonLabel =
      'REQUEST'; // Code Request button label.
  static const String kCreateButtonText =
      'CREATE'; // Account Create button label.
  static const String kVerifyFButtonLabel =
      'VERIFY'; // Code verifiying button Label.
  static const String kDoneFButtonLabel = 'Done'; // Done Button Label.
  static const String kResetTButtonText =
      'Reset'; // Reset TextButton Placeholder.
  static const String kResendTButtonText =
      'Resend'; // Resend TextButton Placeholder.
  static const String kSignUpTButtonText =
      'SignUp'; // SignUp TextButton Placeholder.
  static const String kLoginTButtonText =
      'Login'; // Login TextButton Placeholder.
  static const String kSkipButtonText = 'Skip >'; // Skip button placeholder.

  /// Colors Used to build Each form.
  static const Color kInstructionTextColor =
      Colors.white60; // Color for the instructional text within the form.
  static const Color kPromptTButtonColor =
      Colors.blue; // Prompt Textbutton text color.

  /// Submit or Proceed button configurational attributes.
  static const double kSubmitButtonContainerWidth =
      double.infinity; // Button container width.
  static const EdgeInsets kSubmitButtonContainerPadding =
      EdgeInsets.symmetric(horizontal: 60); // Button Container vertical margin.
  static const EdgeInsets kSubmitButtonContainerMargin = EdgeInsets.symmetric(
      horizontal: 20); // Button Container horizontal Margin.

  // Welcome form buttons, logo and slogan confugurational properties.
  static const double kButtonsContainerWidth =
      double.infinity; // Skip textbutton container Width.
  static const Alignment kSkipButtonAlignment =
      Alignment.centerRight; // Skip Button container alignment.
  static const double kSkipButtonSize = 20; // Interface skip button text size.
  static const Duration kSkipButtonDuration =
      Duration(seconds: 1); // Skip Button Slide Down Animation Duration.
  static const EdgeInsets kSkipButtonContainerPadding =
      EdgeInsets.all(10.0); // Skip button container padding.
  static const EdgeInsets kLoginButtonContainerPadding =
      EdgeInsets.symmetric(horizontal: 10); // Login button containers padding.
  static const EdgeInsets kJoinButtonContainerPadding =
      EdgeInsets.symmetric(horizontal: 10); // Login button containers padding.
  static const double kSkipButtonContainerWidth = double.infinity;
  static const Duration kDoneButtonAnimationDelay = Duration(milliseconds: 600);

  /// headingText():
  /// This function of type Widget defined to display
  /// customized heading text on each form/page. Function returns the container
  /// encapsulating custom text widget.
  ///
  /// Parameters:
  /// formHeading-(Widget): Requires heading text.
  static Widget headingText({
    required String formHeading, // Required heading text in the parameter.
  }) {
    /// Constant default values for heading text container.
    const double kContainerPadding = 10;
    const Alignment kContainerAlignment = Alignment.center;
    const double kContainerWidth = double.infinity;

    /// Constant default text widget properties.
    const Color kTextColor = Colors.white;
    const TextAlign kHeadingAlignment = TextAlign.center;
    // Returning container containing text widget.
    return Container(
      width: kContainerWidth, // Width of the text container.
      padding: EdgeInsets.all(
          kContainerPadding), // Padding to the content of the container.
      alignment: kContainerAlignment, // Aligning Container child.
      child: Text(
        textAlign: kHeadingAlignment, // Aligning the text.
        formHeading, // Text string passed in the HeadingText().
        /// Styling Text.
        style: TextStyle(
          color: kTextColor, // Assigning const color.
          fontFamily:
              Fonts.kInterFont, // Setting const fonts from custom Fonts class.
          fontWeight: FontWeight.bold, // Text Font weight.
        ),
      ),
    );
  }

  /// This methods prompts the string and a text button horzintally,
  /// for specific action. It returns customized row widget inside the container widget
  /// to display string and button in a row.
  ///
  /// Parameters:
  /// childern-(List<Widget>): Contains the elements of the row.
  static Widget prompt(
      // Required named list of <Widget>childern.
      {required List<Widget> childern}) {
    /// Properties of the row container.
    const EdgeInsets kMargin = EdgeInsets.symmetric(horizontal: 5);
    const MainAxisAlignment kMainAlignment = MainAxisAlignment.center;
    // Returing container encapsulating Row widget.
    return Container(
        margin: kMargin, // Setting container margin.
        child: Row(
            mainAxisAlignment: kMainAlignment, // Aligning row content.
            children: childern // List of widget passed.
            ));
  }

  /// This function is a container defined to add fixed vertical margin
  /// to the child.
  static Widget verticalMargin(
      // Required Child Widget.
      {required Widget child}) {
    // Constant properties for the widget container.
    const EdgeInsets kMargin =
        EdgeInsets.symmetric(vertical: 10); // Container vertical margin.
    const Alignment kAlignment = Alignment.center; // Container child alignment.
    // Returing customized container.
    return Container(
      alignment: kAlignment,
      margin: kMargin,
      child: child,
    );
  }

  /// Function 'backButton' defined to create back navigation button inside the pages.
  /// this returns the icon button encapsulated inside the customized container.
  ///
  /// Parameters:
  /// onPressed-(Function): Required action on pressing icon button.
  static Widget backButton({required Function() onPressed}) {
    /// Constant configurations for the icon button container.
    const Alignment kContainerAlignment =
        Alignment.topLeft; // Container's child Alignment.
    const double kContainerWidth = double.infinity;
    const double kContainerMarginTop = 10;
    const double kContainerMarginBottom = 0;
    // Icon BackArrow for Icon Button.
    const IconData kArrowBackIcon = Icons.arrow_back_ios_new_rounded;
    // IconButton Container FadeIn Animation Duration.
    const Duration kButtonDelay = Duration(milliseconds: 500);
    // Returning customized container with fadeIn animation which contains IconButton.
    return FadeIn(
      delay: kButtonDelay, // FadeIn Animation delay.
      child: Container(
          margin: EdgeInsets.only(
              top: kContainerMarginTop,
              bottom:
                  kContainerMarginBottom), // Setting Top and Bottom margin to the form container.
          width: kContainerWidth, // Constant width.
          alignment: kContainerAlignment, // Form content alignment.
          child: IconButton(
              onPressed: () {
                onPressed(); // Invoking function passed on pressing icon button.
              },
              // Icon Selection and styling.
              icon: Icon(
                kArrowBackIcon, // IconData.
                color: PrimaryColor.kOnPrimary, // Icon Color
              ))),
    );
  }

  /// This function defined to contain the form and all its components. Function
  /// returns the customized column widget.
  ///
  /// Paramters:
  /// body-List<Widget>: is a required parameter that contains the list
  /// of widgets required in the form body.
  static Widget formContainer(
      // List of required and optional named parametrs.
      {
    required List<Widget> body, // Content of the form or page.
    Widget? topNavBar, // Nullable top naviagtion bar widget.
  }) {
    // Constant properties of the form container.
    const MainAxisAlignment kContentAlignment =
        MainAxisAlignment.end; // Container content alignment.
    const EdgeInsets kContainerMargin =
        EdgeInsets.all(20); // Margin of the form container.
    // Returning Column Widget with SlideInLeft Animation
    return SlideInLeft(
      child: Column(
        children: [
          topNavBar ??
              Container(), // Setting empty container in case of no top navigation.
          Expanded(
            child: Container(
              // Configuring container's properties
              margin: kContainerMargin, // Container margin.
              alignment: Alignment.bottomCenter, // Container child alignment.
              child: SingleChildScrollView(
                // Changing keyboard behavior
                keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior
                    .onDrag, // Hiding Keyborad on drog.
                physics:
                    BouncingScrollPhysics(), // Invoking function creates bounce effect to the list.
                child: Column(
                  // Column containing body of the form.
                  mainAxisAlignment:
                      kContentAlignment, // Body content alignment.
                  children: body, // List of Widgets
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Displays the welcome page, the main initial screen for the account registration
/// interface. This screen includes buttons for signing in, signing up, skipping, and
/// showcases the application logo.
///
/// Parameters:
/// - [signInButtonOnPressed]: The function to be executed when pressing
///   the sign-in button.
/// - [signUpButtonOnPressed]: The function to be executed when pressing
///   the sign-up button.
/// - [skipButtonOnPressed]: The function to be executed when pressing
///   the skip button.
Widget welcome(
    // List of named required parameters.
    {required Function() loginButtonPressed,
    required Function() joinButtonPressed,
    required Function() skipButtonPressed}) {
  // Properties of the Welcome page.
  const String kSloganText = 'Where Every Frame Tells a Story.'; // Logo Slogan.
  // Returing the page content in column widget.
  return SizedBox(
    child: Column(children: [
      // Wrapping skip button container in slideInDown animation.
      SlideInDown(
        duration: FormComponents
            .kSkipButtonDuration, // Setting skip button animation duration.
        // Skip button container.
        child: Container(
          // Width of skip button container.
          width: FormComponents.kSkipButtonContainerWidth,
          // Adding padding to the skip button container.
          padding: FormComponents.kSkipButtonContainerPadding,
          // Aligning skip button container's child.
          alignment: FormComponents.kSkipButtonAlignment,
          // Creating skip textButton.
          child: TextButton(
              // Invoking function passed on pressing skip button.
              onPressed: skipButtonPressed(),
              // Access skip button text string from FormComponents class.
              child: Text(FormComponents.kSkipButtonText,
                  // Styling TextButton Text.
                  style: TextStyle(
                      // Specifying size of the button text.
                      fontSize: FormComponents.kSkipButtonSize,
                      // Assigning fontFamily for 'skip' textButton.
                      fontFamily: Fonts.kInterFont,
                      // Setting color of the textButton.
                      color: SecondaryColors.kSkipButtonColor))),
        ),
      ),
      // Expanding to the rest of the space in Column.
      Expanded(
          child: Column(
        // Setting Main Axis Alignment for the column content.
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // List of column childern.
          SlideInUp(
              // Invoking logo() function that contains logo with slideUp animation.
              child: Custom.logo()),
          // Displaying slogan of the application logo.
          SlideInUp(
              // Invkoing Customzied container with fixed vertical margin.
              child: Custom.verticalMargin(
                  // Calling Custom text widget to display application slogan text.
                  child: Custom.text(kSloganText, // Passing slogan string.
                      // Custom styling the slogan string.
                      // Setting text fonts from Fonts class.
                      fontFamily: Fonts.kInterFont,
                      // Setting Color for the slogan text.
                      fontColor: SecondaryColors.kSlogantextColor))),
          // Creating 'Join' and 'Login' button in a horizontal row container.
          // Wrapping sized Row with SlideUp animation.
          SlideInUp(
            // Defining the size of the row.
            child: SizedBox(
              // Setting Both buttons Containers Width.
              width: FormComponents.kButtonsContainerWidth,
              // Encapsulating 'Join' and 'Login' filled buttons into row.
              child: Row(
                children: [
                  // Expanding 'Join' and 'Login' buttons inside the row.
                  Expanded(
                      // Invoking customized outlinedButton to create 'Join' button.
                      child: Buttons.outlinedButton(
                          // Adding text to the button.
                          text: FormComponents.kJoinFButtonLabel,
                          // Setting padding to the 'Join' button container.
                          containerPadding:
                              FormComponents.kJoinButtonContainerPadding,
                          // Invoking funtion/action on pressing join button.
                          onButtonPressed: joinButtonPressed())),
                  // Creating  another 'Login' Button in the same row widget.
                  Expanded(
                    // Calling filledButton function from the Customized Buttons class.
                    child: Buttons.filledButton(
                      // Labelling 'login' text.
                      text: FormComponents.kLoginFButtonLabel,
                      // Setting 'login' button container padding.
                      containerPadding:
                          FormComponents.kLoginButtonContainerPadding,
                      // Invoking action on pressing 'login' button.
                      onButtonPressed: loginButtonPressed(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ))
    ]),
  );
}

/// This function creates the UI interface for the user to allow them to login with
/// their credentials i.e username/email and password. This page also contains a prompt to
/// signUp and to reset forgotten password.
///
/// Parameters:
/// - [backButtonOnPressed]: The function to be executed when pressing
///   the back button.
/// - [signUpButtonOnPressed]: The function to be executed when pressing
///   the sign-up button.
/// - [loginButtonOnPressed]: The function to be executed when pressing
///   the login button.
/// - [resetButtonOnPressed]: The function to be executed when pressing
///   the reset button.
Widget loginForm({
  required Function() backButtonOnPressed,
  required Function() signUpButtonOnPressed,
  required Function() loginButtonOnPressed,
  required Function() resetButtonOnPressed,
}) {
  const String kLoginHeading = "Enter Login Details";
  // Returing customized form container.
  return FormComponents.formContainer(
      // Creating navigation bar.
      topNavBar: FormComponents.backButton(onPressed: backButtonOnPressed()),
      body: [
        // Displaying page/form heading.
        SlideInDown(
            child: FormComponents.headingText(formHeading: kLoginHeading)),
        // Building different TextFields.
        SlideInLeft(
          // Encapsulating textfeild into customized container.
          child: FormComponents.verticalMargin(
              // Creating a textfeild to get username input.
              child: Custom.textfieldBuilder(
                  hintText: FormComponents.kHintTextUsername)),
        ),
        // Creating a textfeild to get password input.
        SlideInRight(
            // Encapsulating textfeild into customized container.
            child: FormComponents.verticalMargin(
                // Invoking customzied textfield.
                child: Custom.textfieldBuilder(
                    // Passing hinttext for password
                    hintText: FormComponents
                        .kHintTextPassword //                   )),
                    ))),
        // Creating a Horizontal prompt line for signing up with slideUp Animation.
        SlideInUp(
          child: FormComponents.prompt(childern: [
            // Displaying Prompt Text String.
            Custom.text(FormComponents.kNewToScreamXPromptText),
            // Adding Space between.
            Spacer(),
            // Creating a text button for signUp.
            Buttons.textButton(
                // Invoking function/action on pressing signUp button.
                onPressed: signUpButtonOnPressed(),
                // Adding text to the text button with SignUP text.
                text: Custom.text(FormComponents.kSignUpTButtonText,
                    // Prompt SignUp button color.
                    fontColor: SecondaryColors.kSkipButtonColor))
          ]),
        ),
        // Creating a filled button Labelled 'LOGIN'.
        SlideInUp(
          // Configuring properties of the filled button container.
          child: Buttons.filledButton(
              // Configuring Filled button.
              containerWidth: FormComponents.kSubmitButtonContainerWidth,
              margin: FormComponents.kSubmitButtonContainerMargin,
              containerPadding: FormComponents.kSubmitButtonContainerPadding,
              //Invoking function when Filledbutton is pressed
              onButtonPressed: loginButtonOnPressed(),
              //Labelling filledButton with text
              text: FormComponents.kLoginFButtonLabel),
        ),
        //creating a horizontal line for password reset
        SlideInUp(
            child: FormComponents.prompt(childern: [
          // Displaying password forget prompt string.
          Custom.text(FormComponents.kPasswordResetPromptText),
          Buttons.textButton(
              // Invoking function when Textbutton is pressed.
              onPressed: resetButtonOnPressed(),
              // Labelling and styling TextButton text
              text: Custom.text(FormComponents.kResetTButtonText,
                  // Prompt 'reset' button color.
                  fontColor: FormComponents.kPromptTButtonColor))
        ]))
      ]);
}
