/// registration_page.dart
///
/// This dart file encapsulates the design and functionality required to implement an
/// account registration interface within the application. Allows the user to
/// signUp and SignIn using this interface for the application. File contains different
/// classes and methods to made up this registration interface.

/// Importing essential packages
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart'; // The core Flutter material library, which includes a variety of widgets aligned with Material Design guidelines.
import 'package:animate_do/animate_do.dart'; // This package provides utilities for adding animations to Flutter widgets.
import 'package:streamx/pages/registration_interface/terms_and_conditions.dart';
import 'package:streamx/utils/custom_widgets.dart';

/// Importing project-specific utilities.
import 'package:streamx/utils/theme.dart'; // Importing theme dart file to access theme data.
import 'package:streamx/utils/const_values.dart'; // Importing Constant classes and methods.

//This class is define to create an Account registration page
class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});
  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController _textfieldEmailController =
      TextEditingController();
  final TextEditingController _textfieldUsernameController =
      TextEditingController();
  final TextEditingController _textfieldPasswordController =
      TextEditingController();
  final PageController _pageController = PageController();
  final List<Color> _gradientDarkColors = [Colors.black87, Colors.black];
  final List<Color> _gradientLightColors = [Colors.transparent, Colors.black];
  List<Color> backGroundColors = [Colors.transparent, Colors.transparent];

  @override
  void initState() {
    super.initState();
    backGroundColors = _gradientLightColors;
  }

  @override
  Widget build(BuildContext context) {
    const String kTermsConditionsLabel = '-  Terms & Conditions  -';
    const MainAxisAlignment kContentAlignemnt = MainAxisAlignment.end;
    const Map<String, int> kPageIndex = {
      'WelcomePage': 0,
      'LoginPage': 1,
      'SignUpPage': 2,
      'IdentificationPage': 3,
      'CodeVerificationPage': 4,
      'PasswordResetPage': 5,
      'ConfirmationPage': 6
    };
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.black,
            resizeToAvoidBottomInset: true,
            body: FadeIn(
              duration: Duration(seconds: 3),
              child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(LocalImages.ksherlockHolmes),
                          fit: BoxFit.cover)),
                  child: AnimatedContainer(
                      duration: Duration(milliseconds: 500),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: backGroundColors,
                              stops: [0.3, 0.7],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter)),
                      child: Column(
                        mainAxisAlignment: kContentAlignemnt,
                        children: [
                          Expanded(
                              child: PageView(
                            physics: NeverScrollableScrollPhysics(),
                            controller: _pageController,
                            onPageChanged: (index) {
                              index == kPageIndex['WelcomePage'] ||
                                      index == kPageIndex['ConfirmationPage']
                                  ? setState(() {
                                      backGroundColors = _gradientLightColors;
                                    })
                                  : setState(() {
                                      backGroundColors = _gradientDarkColors;
                                    });
                            },
                            children: [
                              welcome()
                              // welcome(
                              //     loginButtonOnPressed: () {
                              //       _pageController.jumpToPage(
                              //           kPageIndex['LoginPage'] ?? 0);
                              //     },
                              //     joinButtonOnPressed: () {
                              //       _pageController.jumpToPage(
                              //           kPageIndex['SignUpPage'] ?? 0);
                              //     },
                              //     skipButtonOnPressed: () {}),
                              // loginForm(
                              //     backButtonOnPressed: () {
                              //       _pageController.jumpToPage(
                              //           kPageIndex['WelcomePage'] ?? 0);
                              //     },
                              //     loginButtonOnPressed: () {},
                              //     resetButtonOnPressed: () {
                              //       _pageController.jumpToPage(
                              //           kPageIndex['IdentificationPage'] ?? 0);
                              //     },
                              //     signUpButtonOnPressed: () {
                              //       _pageController.jumpToPage(
                              //           kPageIndex['SignUpPage'] ?? 0);
                              //     }),
                              // signUpForm(
                              //     emailtextController:
                              //         _textfieldEmailController,
                              //     passwordtextController:
                              //         _textfieldPasswordController,
                              //     backButtonOnPressed: () {
                              //       _pageController.jumpToPage(
                              //           kPageIndex['WelcomePage'] ?? 0);
                              //     },
                              //     signUpButtonOnPressed: () async {
                              //       await FirebaseAuth.instance
                              //           .createUserWithEmailAndPassword(
                              //               email:
                              //                   _textfieldEmailController.text,
                              //               password:
                              //                   _textfieldPasswordController
                              //                       .text)
                              //           .then((value) => Navigator.of(context)
                              //                   .push(PageRouteBuilder(
                              //                 pageBuilder: (context, animation,
                              //                     secondaryAnimation) {
                              //                   return FadeIn(
                              //                     duration: Duration(
                              //                         milliseconds: 300),
                              //                     child: FeedBackForm(),
                              //                   );
                              //                 },
                              //               )))
                              //           .onError((error, stackTrace) {
                              //         print('sxushdusfsdgdddddddddd');
                              //       });
                              //     },
                              //     loginButtonOnPressed: () {
                              //       _pageController.jumpToPage(
                              //           kPageIndex['LoginPage'] ?? 0);
                              //     }),
                              // codeRequestForm(backButtonOnPressed: () {
                              //   _pageController
                              //       .jumpToPage(kPageIndex['LoginPage'] ?? 0);
                              // }, requestCodeButtonOnPressed: () {
                              //   _pageController.jumpToPage(
                              //       kPageIndex['CodeVerificationPage'] ?? 0);
                              // }),
                              // codeVerificationForm(
                              //     backButtonOnPressed: () {
                              //       _pageController.jumpToPage(
                              //           kPageIndex['IdentificationPage'] ?? 0);
                              //     },
                              //     verifyButtonOnPressed: () {
                              //       _pageController.jumpToPage(
                              //           kPageIndex['PasswordResetPage'] ?? 0);
                              //     },
                              //     resendButtonOnPressed: () {}),
                              // passwordCreationForm(backButtonOnPressed: () {
                              //   _pageController.jumpToPage(
                              //       kPageIndex['CodeVerificationPage'] ?? 0);
                              // }, createButtonOnPressed: () {
                              //   _pageController.jumpToPage(
                              //       kPageIndex['ConfirmationPage'] ?? 0);
                              // }),
                              // confirmationForm(doneButtonOnPressed: () {}),
                            ],
                          )),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            FadeIn(child: Policies())));
                              },
                              child: Text(kTermsConditionsLabel,
                                  style: AppTheme.textTheme.labelSmall))
                        ],
                      ))),
            )));
  }

  /// Displays the welcome page, the main initial screen for the account registration
  /// interface. This screen includes buttons for signing in, signing up, skipping, and
  /// showcases the application logo.
  ///
  /// Parameters:
  /// - [loginButtonOnPressed]: The function to be executed when pressing
  ///   the 'LOGIN' button.
  /// - [joinButtonOnPressed]: The function to be executed when pressing
  ///   the 'JOIN' button.
  /// - [skipButtonOnPressed]: The function to be executed when pressing
  ///   the 'skip' button.
  Widget welcome(
      // List of named required parameters.
      // {required Function loginButtonOnPressed,
      // required Function joinButtonOnPressed,
      // required Function skipButtonOnPressed}) {
      // Properties of the Welcome page.
      ) {
    const String kSloganText =
        'Where Every Frame Tells a Story.'; // Logo Slogan.
    const double kSloganTextTopMargin = 10.0;
    const double kSloganTextBottomMargin = 10.0;
    const double kButtonsHorizontalPadding = 20;
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
                onPressed: () {},
                // Access skip button text string from FormComponents class.
                child: Text(FormComponents.kSkipButtonText,
                    // Styling TextButton Text.
                    style: TextStyle(
                        color: FormComponents.kBodyTextColor,
                        fontSize: AppTheme.textTheme.bodyMedium!.fontSize))),
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
                child: Custom.logo(context: context)),
            // Displaying slogan of the application logo.
            SlideInUp(
                // Invkoing Customzied container with fixed vertical margin.
                child: Custom.spaceArround(
                    marginBottom: kSloganTextBottomMargin,
                    marginTop: kSloganTextTopMargin,
                    // Calling Custom text widget to display application slogan text.
                    child: Text(
                      kSloganText,
                      style: TextStyle(color: FormComponents.kBodyTextColor),
                    ))),
            // Creating 'Join' and 'Login' button in a horizontal row container.
            // Wrapping sized Row with SlideUp animation.
            SlideInUp(
              // Defining the size of the row.
              child: SizedBox(
                  // Setting Both buttons Containers Width.
                  width: FormComponents.kButtonsContainerWidth,
                  // Invoking customized outlinedButton to create 'Join' button.
                  child: Custom.buttonContainer(
                      horizontalPadding: kButtonsHorizontalPadding,
                      button: FilledButton(
                          style: FilledButton.styleFrom(
                              backgroundColor:
                                  FormComponents.kFButtonContainerColor),
                          onPressed: () {},
                          child: Text(FormComponents.kLoginFButtonLabel,
                              style: TextStyle(
                                  color: FormComponents.kLabelTextColor))))),
            ),
            SlideInUp(
              // Defining the size of the row.
              child: SizedBox(
                  // Setting Both buttons Containers Width.
                  width: FormComponents.kButtonsContainerWidth,
                  // Invoking customized outlinedButton to create 'Join' button.
                  child: Custom.buttonContainer(
                      horizontalPadding: kButtonsHorizontalPadding,
                      button: OutlinedButton(
                          onPressed: () {},
                          child: Text(FormComponents.kJoinFButtonLabel,
                              style: TextStyle(
                                  color: FormComponents.kLabelTextColor))))),
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
    required Function backButtonOnPressed,
    required Function signUpButtonOnPressed,
    required Function loginButtonOnPressed,
    required Function resetButtonOnPressed,
  }) {
    const String kLoginHeading = "Enter Login Details";
    // Returing customized form container.
    return FormComponents.formContainer(
        // Creating navigation bar.
        topNavBar: FormComponents.backButton(onPressed: backButtonOnPressed),
        body: [
          // Displaying page/form heading.
          SlideInDown(
              child: FormComponents.headingText(
                  formHeading: kLoginHeading, context: context)),
          // Building different TextFields.
          SlideInLeft(
              // Encapsulating textfeild into customized container.
              child: FormComponents.verticalMargin(
                  // Creating a textfeild to get username input.
                  child: Custom.spaceArround(child: TextField()))),
          // Creating a textfeild to get password input.
          SlideInRight(
              // Encapsulating textfeild into customized container.
              child: FormComponents.verticalMargin(
                  // Invoking customzied textfield.
                  child: Custom.spaceArround(
            child: TextField(
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () {}, icon: Icon(Icons.visibility)),
                    hintText: FormComponents.kHintTextPassword)),
          ))),
          // Creating a Horizontal prompt line for signing up with slideUp Animation.
          SlideInUp(
            child: FormComponents.prompt(childern: [
              // Displaying Prompt Text String.
              Text(
                FormComponents.kNewToScreamXPromptText,
                style: AppTheme.textTheme.bodySmall,
              ),
              // Adding Space between.
              Spacer(),
              // Creating a text button for signUp.
              TextButton(
                  onPressed: signUpButtonOnPressed(),
                  child: Text(FormComponents.kSignUpTButtonText,
                      style: AppTheme.textTheme.labelSmall))
            ]),
          ),
          // Creating a filled button Labelled 'LOGIN'.
          SlideInUp(
              // Configuring properties of the filled button container.
              child: Custom.buttonContainer(
                  button: FilledButton(
                      onPressed: loginButtonOnPressed(),
                      child: Text(FormComponents.kLoginFButtonLabel,
                          style: AppTheme.textTheme.labelLarge)))),
          //creating a horizontal line for password reset
          SlideInUp(
              child: FormComponents.prompt(childern: [
            // Displaying password forget prompt string.
            Text(FormComponents.kPasswordResetPromptText,
                style: AppTheme.textTheme.bodyMedium),
            TextButton(
                onPressed: signUpButtonOnPressed(),
                child: Text(FormComponents.kSignUpTButtonText,
                    style: AppTheme.textTheme.labelSmall))
          ]))
        ]);
  }

  /// Function 'signUpForm' generates the signUp interface so to allow user to create new
  /// account with the application if user do not have account already. It will allow user to create new account
  /// by providing username, email address and password.
  ///
  /// Paramters:
  /// [backButtonOnPressed] - This is requires the function to pass on pressing back navigation button.
  /// [signUpButtonOnPressed] - This is function Invokes the action when user press the signUp Button.
  /// [loginButtonOnPressed] - This function is the action to be taken while pressing prompted login button in the view.
  Widget signUpForm({
    required Function backButtonOnPressed,
    required Function signUpButtonOnPressed,
    required Function loginButtonOnPressed,
    TextEditingController? emailtextController,
    TextEditingController? passwordtextController,
  }) {
    //Constant value used in the form
    const String kFormHeading = 'Create New Account'; //Form heading Text
    // Returing formContainer to encapsulate signUp page/form.
    return FormComponents.formContainer(
        // Creating back navigation button.
        topNavBar: FormComponents.backButton(
            // Invoking on pressing button action.
            onPressed: backButtonOnPressed),

        /// Body content of the signUp form.
        body: [
          // Wrapping form heading in SlideInDown Animation.
          SlideInDown(
              child: FormComponents.headingText(
                  context: context,
                  // Creating Form heading title.
                  formHeading: kFormHeading)), //Heading text Of the form.
          //Building different TextFields by wrapping in slide Left and Right Animation.
          SlideInLeft(child: FormComponents.textfield()),
          SlideInRight(
              child: FormComponents.verticalMargin(
                  // Email textField.
                  child: FormComponents.textfield())),
          SlideInLeft(
              child: FormComponents.verticalMargin(
                  // Password textField.
                  child: FormComponents.textfield())),
          // Creating a filled button name 'Create'.
          SlideInUp(
              child: FilledButton(
                  onPressed: signUpButtonOnPressed(),
                  child: Text(FormComponents.kCreateFButtonLabel,
                      style: AppTheme.textTheme.labelLarge))),
          //creating a horizonal prompt for login instead of signUp.
          SlideInUp(
            child: FormComponents.prompt(childern: [
              // Displaying prompt text string.
              Text(FormComponents.kAlreadyHaveAccountPromptText),
              // Creating prompt 'login' text button.
              Custom.buttonContainer(
                  button: TextButton(
                      onPressed: loginButtonOnPressed(),
                      child: Text(FormComponents.kLoginTButtonText,
                          style: AppTheme.textTheme.bodyMedium)))
            ]),
          ),
        ]);
  }

  /// 'codeRequestForm' generates the interface for the user if user forget the password and it verifies
  /// the valid user identity by sending code to their email address.
  ///
  /// Parameters:
  /// [backButtonOnPressed] - This function required to be invoked when user press back navigation button.
  /// [requestCodeButtonOnPressed] - This function required to take action on pressing 'request code' button.
  Widget codeRequestForm(
      {required Function backButtonOnPressed,
      required Function requestCodeButtonOnPressed}) {
    //Constant value used in the form
    const String kFormHeading = 'Reset Password'; // Form heading title.
    const String kCodeRequestInstructions =
        "Please enter username or email address to get validation code to reset password";
    // Returing form container to contain code request page.
    return FormComponents.formContainer(
        // Creating back navigation button.
        topNavBar: FormComponents.backButton(
            // Invoking on pressing back nav button.
            onPressed: backButtonOnPressed),
        // Main body content of the code request form/page.
        body: [
          // Creating the heading title for the page.
          SlideInDown(
              child: FormComponents.headingText(
                  context: context, formHeading: kFormHeading)),
          // Building different TextFields by wrapping in specific slide animation.
          SlideInLeft(
            // Adding fixed margin to textfield.
            child: FormComponents.verticalMargin(
                // Username textField.
                child: FormComponents.textfield(
                    hintText: FormComponents.kHintTextUsername)),
          ),
          FadeIn(
            child: FormComponents.verticalMargin(
                // Adding a Divider between two textField.
                child: FormComponents.prompt(childern: [
              //Adding a divder line '------or------'
              Expanded(
                  // Creating dividing horizontal line.
                  child: Custom.divider()),
              // Adding 'or' text between the two dividing lines.
              Text(FormComponents.kOrText),
              // Creating another dividing horizontal line.
              Expanded(child: Custom.divider()),
            ])),
          ),
          SlideInRight(
            child: FormComponents.verticalMargin(
                // Email address textfield.
                child: FormComponents.textfield(
                    hintText: FormComponents.kHintTextEmail)),
          ),
          // Creating a filled button name 'Create' and wrapping in slide Up animation widget..
          SlideInUp(
              child: Custom.buttonContainer(
                  button: FilledButton(
                      onPressed: requestCodeButtonOnPressed(),
                      child: Text(FormComponents.kCreateFButtonLabel,
                          style: AppTheme.textTheme.labelLarge)))),
          // Displaying Instructions about the code request.
          SlideInUp(
              // Encapsulating Instrcutions into fixed margin container.
              child: FormComponents.verticalMargin(
                  child: Text(
            kCodeRequestInstructions,
            style: AppTheme.textTheme.bodyMedium,
          )))
        ]);
  }

  /// Functions contains the functionality to verify the user by validating requested
  /// code to proceed for updating password.This function also allow user to regenerate or resend
  /// code if user won't receive validation code because of numerious techniqual reasons.
  ///
  /// Parameters:
  /// [backButtonOnPressed] - This function required to Invoke action on press nav back button.
  /// [verifyButtonOnPressed] - Requires the action/function to be called on pressing verify button.
  /// [resendButtonOnPressed] - Function that generate verification code if user dosent code any.
  Widget codeVerificationForm({
    required Function backButtonOnPressed,
    required Function verifyButtonOnPressed,
    required Function resendButtonOnPressed,
  }) {
    //These constants are used to design or set constant values in the Code varification form
    const String kFormHeading = 'Verify Code'; //Heading of the form
    //This is directional Instructions to help getting code
    const String kDirectionText =
        "A verification code is been sent your Email please check and enter that code to verify your identity.";
    const Icon kSuffixIcon =
        Icon(Icons.key); // verify code textField Suffic Icon.
    // Returing custom form container scaffold.
    return FormComponents.formContainer(
        // Adding a back Navigation button.
        topNavBar: FormComponents.backButton(
            // Calling back navigation on press function.
            onPressed: backButtonOnPressed),
        // Content body of the code validation form/page.
        body: [
          // Creating Heading of the form with Slide Up Animation.
          SlideInDown(
              child: FormComponents.headingText(
                  context: context, formHeading: kFormHeading)),
          //Creating a TextField for code Submission
          SlideInLeft(
            // Containing textfield into fixed margin.
            child: FormComponents.verticalMargin(
                child: FormComponents.textfield(
                    // Displaying textfield placeHolder and adding in textfield icon.
                    hintText: FormComponents.kHintTextVerificationCode,
                    suffix: kSuffixIcon)),
          ),
          // Creating a Filledbutton named 'Verify' with SlideUp Animation.
          SlideInUp(
              child: Custom.buttonContainer(
                  button: FilledButton(
                      onPressed: verifyButtonOnPressed(),
                      child: Text(FormComponents.kVerifyFButtonLabel,
                          style: AppTheme.textTheme.labelLarge)))),
          // Creating prompt for reseting password.
          SlideInUp(
              // Displaying prompt.
              child: FormComponents.prompt(childern: [
            Text(FormComponents.kResendTButtonText),
            // Creating prompt textbutton.
            // definin the color of the prompt textbutton.
            TextButton(
                onPressed: resendButtonOnPressed(),
                child: Text(FormComponents.kResendTButtonText,
                    style: AppTheme.textTheme.bodySmall))
          ])),
          // Displaying a String of Instruction for successful code varification process with Slide up animation
          SlideInUp(
              child: FormComponents.verticalMargin(
                  child: Text(
            kDirectionText,
            style: AppTheme.textTheme.bodySmall,
          ))),
        ]);
  }

  /// Function allowed user to create new strong password after the
  /// successful user validation.
  ///
  /// Parameters:
  /// [backButtonOnPressed] - Back navigation function on pressing back button.
  /// [CreateButtonOnPressed] - Function required to be Invoked on Pressing 'Create' button.
  Widget passwordCreationForm(
      {required Function backButtonOnPressed,
      required Function createButtonOnPressed}) {
    // Constants used to create this form.
    const String kFormHeading = 'Create New Password'; // Form Heading Text.
    const String kResetDirections =
        "Include: numbers,symbols,upperCase and lowerCase Charactors";
    // Returing customized form Container.
    return FormComponents.formContainer(
        topNavBar: FormComponents.backButton(
            // Invoking backButtonOnPressed function to navigate to previous page.
            onPressed: backButtonOnPressed),
        body: [
          //Setting heading text to the form with Slide Down Animation
          SlideInDown(
              child: FormComponents.headingText(
                  context: context, formHeading: kFormHeading)),
          // TextField to create new password.
          SlideInLeft(
            child: FormComponents.verticalMargin(
                // Displaying Textfield with hintText.
                child: FormComponents.textfield(
                    hintText: FormComponents.kHintTextNewPassword)),
          ),
          // TextField to confirm new password.
          SlideInRight(
            child: FormComponents.verticalMargin(
                // TextField to recheck or confirm password.
                child: FormComponents.textfield(
                    hintText: FormComponents.kHintTextConfirmPassword)),
          ),
          //Creating Submission FilledButton Labelled as 'RESET'
          SlideInUp(
              child: FormComponents.verticalMargin(
                  child: Custom.buttonContainer(
                      button: FilledButton(
                          onPressed: createButtonOnPressed(),
                          child: Text(FormComponents.kCreateFButtonLabel))))),
          SlideInUp(
              // Displaying Instructions to create a strong password.
              child: Text(kResetDirections))
        ]);
  }

  /// This function indicates the user success message for password been updated.
  ///
  /// Parameters:
  /// [doneButtonOnPressed] - Function to allow user proceed after successfully password update.
  Widget confirmationForm({required Function doneButtonOnPressed}) {
    // Constants use to design this form.
    const String kSuccessMessage =
        'Password was successfully updated'; //heading text
    return FormComponents.formContainer(body: [
      // Setting Heading of this form with slide down animation.
      SlideInUp(
        child: FormComponents.headingText(
            context: context, formHeading: kSuccessMessage),
      ),
      // Adding a Submission FilledButton Labelled as 'Login' with SlideUp Animation.
      FadeIn(
          delay: FormComponents.kDoneButtonAnimationDelay,
          child: Custom.buttonContainer(
              button: FilledButton(
                  onPressed: doneButtonOnPressed(),
                  child: Text(FormComponents.kDoneFButtonLabel))))
    ]);
  }

  /// This dispose method invoked to avoid any memory leak in the application.
  @override
  void dispose() {
    _pageController.dispose(); // Disposing _pageController.
    _textfieldEmailController.dispose(); // Disposing _textfieldEmailController.
    _textfieldPasswordController
        .dispose(); // Disposing _textfieldEmailController.
    super.dispose();
  }
}

/// This class was defined to encapsulate static authentication methods
/// used to register and create new account with the application
class Authenticate {
  // Creating instance of the FirebaseAuth.
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  /// This is funtion was defined to let user create new account with the application.
  /// Function uses the createUserWithEmailAndPassword method from Firebase class
  ///  to create new account.
  static Future<String?> registerWithEmailAndPassword(
      {required String email,
      required String password,
      required String username}) async {
    // Handling error during creating account.
    try {
      // Invoked function to createAccount passing email and password.
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await _auth.currentUser?.updateDisplayName(username.toUpperCase());
      // On returning null if there wasnt any error.
      return null;
    } // Catching exception thrown during registration.
    on FirebaseAuthException catch (e) {
      _auth.currentUser?.delete();
      print(e);
      // Returing execption as a string.
      return e.toString();
    }
  }

  /// This function defined to authenticate user with email and password.
  Future<bool> authenticateWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        return true;
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('Enter username or email not found');
        return false;
      } else if (e.code == 'wrong-password') {
        print("wrong password");
        return false;
      }
    } catch (e) {
      print("Something went wrong Please try again");
      return false;
    }
    return false;
  }
}

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

  static const Color kLabelTextColor = Colors.white;
  static const Color kFButtonContainerColor = Color.fromARGB(255, 152, 18, 9);
  static const Color kBodyTextColor = Color.fromARGB(255, 194, 194, 194);

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
      horizontal: 20, vertical: 20); // Button Container horizontal Margin.

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
      EdgeInsets.symmetric(horizontal: 15); // Login button containers padding.
  static const EdgeInsets kJoinButtonContainerPadding =
      EdgeInsets.symmetric(horizontal: 15); // Login button containers padding.
  static const double kSkipButtonContainerWidth = double.infinity;
  static const Duration kDoneButtonAnimationDelay = Duration(milliseconds: 600);

  /// Custom textfield
  static Widget textfield(
      {String? hintText,
      TextStyle? hintTextStyle,
      Widget? suffix,
      Widget? prefix,
      TextStyle? inputTextStyle}) {
    const double kVerticalMargin = 10.0;
    const double kHorizontalMargin = 10.0;
    const double kConatinerHeight = 56;
    return Container(
      height: kConatinerHeight,
      width: double.infinity,
      margin: EdgeInsets.symmetric(
          vertical: kVerticalMargin, horizontal: kHorizontalMargin),
      child: TextField(
        style: inputTextStyle,
        decoration: InputDecoration(
            hintStyle: hintTextStyle,
            hintText: hintText,
            prefix: prefix,
            suffixIcon: suffix),
      ),
    );
  }

  /// headingText():
  /// This function of type Widget defined to display
  /// customized heading text on each form/page. Function returns the container
  /// encapsulating custom text widget.
  ///
  /// Parameters:
  /// formHeading-(Widget): Requires heading text.
  static Widget headingText(
      {required String formHeading, // Required heading text in the parameter.
      required BuildContext context}) {
    /// Constant default values for heading text container.
    const double kContainerMargin = 20;
    const Alignment kContainerAlignment = Alignment.center;
    const double kContainerWidth = double.infinity;

    /// Constant default text widget properties.
    const TextAlign kHeadingAlignment = TextAlign.center;
    // Returning container containing text widget.
    return Container(
      width: kContainerWidth, // Width of the text container.
      margin: EdgeInsets.symmetric(
          vertical:
              kContainerMargin), // Margin to the content of the container.
      alignment: kContainerAlignment, // Aligning Container child.
      child: Text(
          textAlign: kHeadingAlignment, // Aligning the text.
          formHeading, // Text string passed in the HeadingText().
          /// Styling Text.
          style: AppTheme.textTheme.displayLarge),
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
  static Widget backButton({required Function onPressed}) {
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
                color: AppTheme.darkMode.colorScheme.primary, // Icon Color
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
    // Returning Column Widget with FadeIn Animation
    return FadeIn(
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
