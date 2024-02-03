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
  static const String kPasswordResetPromptText =
      "Forget Password?"; // Prompt text for reseting password.
  static const String kCodeResendPromptText =
      "Havent't received code?"; // Prompt text for resending verification code.
  static const String kOrText = 'Or'; // 'or' text used in the dividing line.
  /// Constant button's label text strings.
  static const String kLoginFButtonLabel = 'LOGIN'; // Login button label.
  static const String kResetFButtonLabel = 'RESET'; // Reset button label.
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
  static Widget container(
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

//These methods defined to create:
Widget welcome(
    {required Function() signInButtonPressed,
    required Function() signUpButtonPressed,
    required Function() skipButtonPressed}) {
  const String kSloganText = 'Where Every Frame Tells a Story.';
  const String kSkipButtonText = 'Skip >';
  const String kLoginButtonLabel = "LOGIN";
  const String kJoinButtonLabel = "JOIN";
  const Color kSkipBtnColor = Colors.white38;
  const Color kSlogantextColor = Colors.white54;
  const double kButtonsContainerWidth = double.infinity;
  const Alignment kSkipBtnAlignment = Alignment.centerRight;
  const double kSkipBtnSize = 20;
  const Duration kSkipButtonDuration = Duration(seconds: 1);
  const EdgeInsets kSkipbtnPadding = EdgeInsets.all(10.0);
  const EdgeInsets kButtonsContainerPadding =
      EdgeInsets.symmetric(horizontal: 10);
  const double kSkipBtnCntnrWidth = double.infinity;
  EdgeInsets.symmetric(vertical: 10, horizontal: 5);
  return SizedBox(
    child: Column(children: [
      SlideInDown(
        duration: kSkipButtonDuration,
        child: Container(
          width: kSkipBtnCntnrWidth,
          padding: kSkipbtnPadding,
          alignment: kSkipBtnAlignment,
          child: TextButton(
              onPressed: () {
                skipButtonPressed();
              },
              child: Text(kSkipButtonText,
                  style: TextStyle(
                      fontSize: kSkipBtnSize,
                      fontFamily: '',
                      color: kSkipBtnColor))),
        ),
      ),
      Expanded(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SlideInUp(child: Custom.logo()),
          SlideInUp(
              child: Custom.verticalMargin(
                  child: Custom.text(kSloganText,
                      fontFamily: Fonts.kInterFont,
                      fontColor: kSlogantextColor))),
          SlideInUp(
            child: SizedBox(
              width: kButtonsContainerWidth,
              child: Row(
                children: [
                  Expanded(
                    child: Buttons.outlinedButton(
                      text: kJoinButtonLabel,
                      containerPadding: kButtonsContainerPadding,
                      onButtonPressed: () {
                        signUpButtonPressed();
                      },
                    ),
                  ),
                  Expanded(
                    child: Buttons.filledButton(
                      text: kLoginButtonLabel,
                      containerPadding: kButtonsContainerPadding,
                      onButtonPressed: () {
                        signInButtonPressed();
                      },
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

//login form To log into the application after Authentication
Widget loginForm({
  required Function() backButtonOnPress,
  required Function() signUpButtonPressed,
  required Function() loginButtonPressed,
  required Function() resetButtonPressed,
}) {
  const String kLoginHeading = 'Enter Login Details';
  return FormComponents.container(
    topNavBar: FormComponents.backButton(onPressed: () {
      backButtonOnPress();
    }),
    body: [
      SlideInDown(
          child: FormComponents.headingText(formHeading: kLoginHeading)),
      // Building different textField
      SlideInLeft(
        child: FormComponents.verticalMargin(
            // Username textfield
            child: Custom.textfieldBuilder(
                hintText: FormComponents.kHintTextUsername)),
      ),
      SlideInRight(
        child: FormComponents.verticalMargin(
            // Password textField
            child: Custom.textfieldBuilder(
                hintText: FormComponents.kHintTextPassword)),
      ),
      SlideInUp(
        child: FormComponents.prompt(childern: [
          Custom.text(FormComponents.kSignUpPromptText),
          Spacer(),
          Buttons.textButton(
              onPressed: () {
                signUpButtonPressed();
              },
              text: Custom.text(FormComponents.kSignUpTButtonText,
                  fontColor: FormComponents.kPromptTButtonColor))
        ]),
      ),
      //Creating a filled button named 'LOGIN'
      SlideInUp(
        child: Buttons.filledButton(
            //Setting contant margin
            containerWidth: FormComponents.kSubmitButtonContainerWidth,
            margin: FormComponents.kSubmitButtonContainerMargin,
            containerPadding: FormComponents.kSubmitButtonContainerPadding,
            //Invoking function when Filledbutton is pressed
            onButtonPressed: () {
              loginButtonPressed();
            },
            //Labelling filledButton with text
            text: FormComponents.kLoginFButtonLabel),
      ),
      //creating a horizontal line for password reset
      SlideInUp(
        child: FormComponents.prompt(childern: [
          Custom.text(FormComponents.kPasswordResetPromptText),
          Buttons.textButton(
              //Invoking function when Textbutton is pressed
              onPressed: () {
                resetButtonPressed();
              },
              //Labelling TextButton
              text: Custom.text(FormComponents.kResetTButtonText,
                  fontColor: FormComponents.kPromptTButtonColor))
        ]),
      ),
    ],
  );
}

//SignUp Form to create a new account with the Application
Widget signUpForm({
  required Function() backButtonOnPress,
  required Function() signUpButtonOnPress,
  required Function() loginButtonOnPress,
}) {
  //Constant value used in the form
  const String kFormHeading = 'Create New Account'; //Form heading Text
  return FormComponents.container(
      topNavBar: FormComponents.backButton(onPressed: () {
        backButtonOnPress();
      }),
      body: [
        SlideInDown(
            child: FormComponents.headingText(
                formHeading: kFormHeading)), //Heading text Of the form
        //Building different TextFields
        SlideInLeft(
          child: FormComponents.verticalMargin(
              //Username textfield
              child: Custom.textfieldBuilder(
                  hintText: FormComponents.kHintTextUsername)),
        ),
        SlideInRight(
          child: FormComponents.verticalMargin(
              //Email textField
              child: Custom.textfieldBuilder(
                  hintText: FormComponents.kHintTextEmail)),
        ),
        SlideInLeft(
          child: FormComponents.verticalMargin(
              //Password textField
              child: Custom.textfieldBuilder(
                  hintText: FormComponents.kHintTextPassword)),
        ),
        //Creating a filled button name 'Create'
        SlideInUp(
          child: Buttons.filledButton(
              //Setting contant margin
              containerWidth: FormComponents.kSubmitButtonContainerWidth,
              margin: FormComponents.kSubmitButtonContainerMargin,
              containerPadding: FormComponents.kSubmitButtonContainerPadding,
              //Invoking function when Filledbutton is pressed
              onButtonPressed: () {
                signUpButtonOnPress();
              },
              //Labelling filledButton with text
              text: FormComponents.kCreateButtonText),
        ),
        //creating a horizonal
        SlideInUp(
          child: FormComponents.prompt(childern: [
            Custom.text(FormComponents.kAlreadyHaveAccountPromptText),
            Buttons.textButton(
                //Invoking function when Textbutton is pressed
                onPressed: () {
                  loginButtonOnPress();
                },
                //Labelling TextButton
                text: Custom.text(FormComponents.kLoginTButtonText,
                    fontColor: FormComponents.kPromptTButtonColor))
          ]),
        ),
      ]);
}

//User Validation form to identify user by sending Verfication code on Email address
Widget codeRequestForm(
    {required Function() backButtonOnPress,
    required Function() resetButtonOnPress}) {
  //Constant value used in the form
  const String kFormHeading = 'Reset Password';
  const String kInstructionText =
      "Please enter username or email address to get validation code to reset password";
  return FormComponents.container(
      topNavBar: FormComponents.backButton(onPressed: () {
        backButtonOnPress();
      }),
      body: [
        //Setting Heading of the form
        SlideInDown(
            child: FormComponents.headingText(formHeading: kFormHeading)),
        //Building different TextFields
        SlideInLeft(
          child: FormComponents.verticalMargin(
              //Username
              child: Custom.textfieldBuilder(
                  hintText: FormComponents.kHintTextUsername)),
        ),
        FadeIn(
          child: FormComponents.verticalMargin(
              child: //Adding a Divider between two textField
                  FormComponents.prompt(childern: [
            //Adding a divder line '------or------'
            Expanded(child: Custom.divider()),
            Custom.text(FormComponents.kOrText),
            Expanded(child: Custom.divider()),
          ])),
        ),
        SlideInRight(
          child: FormComponents.verticalMargin(
              //Email
              child: Custom.textfieldBuilder(
                  hintText: FormComponents.kHintTextEmail)),
        ),
        //Creating a filled button name 'Create'
        SlideInUp(
          child: Buttons.filledButton(
              //Setting contant margin
              containerWidth: FormComponents.kSubmitButtonContainerWidth,
              margin: FormComponents.kSubmitButtonContainerMargin,
              containerPadding: FormComponents.kSubmitButtonContainerPadding,
              //Invoking function when Filledbutton is pressed
              onButtonPressed: () {
                resetButtonOnPress();
              },
              //Labelling filledButton with text
              text: FormComponents.kCodeRequestFButtonLabel),
        ),
        SlideInUp(
          child: FormComponents.verticalMargin(
              child: Custom.text(kInstructionText,
                  fontFamily: Fonts.kInterFont,
                  fontColor: FormComponents.kInstructionTextColor)),
        )
      ]);
}

//Code verification form to verfiy user by submitting code sent to the user Email address
Widget codeVerificationForm({
  required Function() backButtonOnPress,
  required Function() verifyButtonOnPress,
  required Function() resendButtonOnPress,
}) {
  //These constants are used to design or set constant values in the Code varification form
  const String kFormHeading = 'Verify Code'; //Heading of the form
  const String
      kInstructionText = //This is directional Instructions to help getting code
      "A verification code is been sent your Email please check and enter that code to verify your identity.";
  const Icon kSuffixIcon = Icon(Icons.key); //TextField Suffic Icon
  return FormComponents.container(
      topNavBar: FormComponents.backButton(onPressed: () {
        backButtonOnPress();
      }),
      body: [
        //Creating Heading of the form with Slide Up Animation
        SlideInDown(
            child: FormComponents.headingText(formHeading: kFormHeading)),
        //Creating a TextField for code Submission
        SlideInLeft(
          child: FormComponents.verticalMargin(
              child: Custom.textfieldBuilder(
                  hintText: FormComponents.kHintTextVerificationCode,
                  suffixIcon: kSuffixIcon)),
        ),
        //Creating a Filledbutton named 'Verify' with SlideUp Animation
        SlideInUp(
            child: Buttons.filledButton(
                //Setting contant margin
                containerWidth: FormComponents.kSubmitButtonContainerWidth,
                margin: FormComponents.kSubmitButtonContainerMargin,
                containerPadding: FormComponents.kSubmitButtonContainerPadding,
                onButtonPressed: () {
                  verifyButtonOnPress();
                },
                text: FormComponents.kVerifyFButtonLabel)),
        //Creating a Horizontal Text line for resending the code with 'resend' Textbutton With SlideUp Animation
        SlideInUp(
            child: FormComponents.prompt(childern: [
          Custom.text(FormComponents.kCodeResendPromptText,
              fontFamily: Fonts.kInterFont),
          Buttons.textButton(
              onPressed: () {
                resendButtonOnPress();
              },
              text: Custom.text(FormComponents.kResendTButtonText,
                  fontColor: FormComponents.kPromptTButtonColor))
        ])),
        //Adding a String of Instruction for successful code varification process with Slide up animation
        SlideInUp(
            child: FormComponents.verticalMargin(
                child: Custom.text(kInstructionText,
                    fontFamily: Fonts.kInterFont,
                    fontColor: FormComponents.kInstructionTextColor))),
      ]);
}

//New password Creation Form to create a new password for the user
Widget passwordCreationForm(
    {required Function() backButtonOnPress,
    required Function() createButtonOnPress}) {
  //Constants used to create this form
  const String kFormHeading = 'Create New Password'; //Form Heading Text
  const String kResetDirections =
      "Include: numbers,symbols,upperCase and lowerCase Charactors";
  return FormComponents.container(
      topNavBar: FormComponents.backButton(onPressed: () {
        backButtonOnPress();
      }),
      body: [
        //Setting heading text to the form with Slide Down Animation
        SlideInDown(
            child: FormComponents.headingText(formHeading: kFormHeading)),
        //TextField to create new password
        SlideInLeft(
          child: FormComponents.verticalMargin(
              child: Custom.textfieldBuilder(
                  hintText: FormComponents.kHintTextNewPassword)),
        ),
        //TextField to confirm new password
        SlideInRight(
          child: FormComponents.verticalMargin(
              child: Custom.textfieldBuilder(
                  hintText: FormComponents.kHintTextConfirmPassword)),
        ),
        //Creating Submission FilledButton Labelled as 'RESET'
        SlideInUp(
            child: Buttons.filledButton(
                //Setting contant margin
                containerWidth: FormComponents.kSubmitButtonContainerWidth,
                margin: FormComponents.kSubmitButtonContainerMargin,
                containerPadding: FormComponents.kSubmitButtonContainerPadding,
                onButtonPressed: () {
                  createButtonOnPress();
                },
                text: FormComponents.kResetFButtonLabel)),
        SlideInUp(
            child: Custom.text(kResetDirections,
                fontFamily: Fonts.kInterFont,
                fontColor: FormComponents.kInstructionTextColor))
      ]);
}

//Confirmation Message to the user
Widget confirmationForm({required Function() okButtonOnPress}) {
  //constants use to design this form
  const String kFormHeading =
      'Password was successfully updated'; //heading text
  const Duration kBtnAnimationDelay = Duration(milliseconds: 600);
  return FormComponents.container(body: [
    //Setting Heading of this form with slide down animation
    SlideInUp(
      child: FormComponents.headingText(
        formHeading: kFormHeading,
      ),
    ),
    //Adding a Submission FilledButton Labelled as 'Login' with SlideUp Animation
    FadeIn(
        delay: kBtnAnimationDelay,
        child: Buttons.filledButton(
            //Setting contant margin
            containerWidth: FormComponents.kSubmitButtonContainerWidth,
            margin: FormComponents.kSubmitButtonContainerMargin,
            containerPadding: FormComponents.kSubmitButtonContainerPadding,
            onButtonPressed: () {
              okButtonOnPress();
            },
            text: FormComponents.kDoneFButtonLabel))
  ]);
}
