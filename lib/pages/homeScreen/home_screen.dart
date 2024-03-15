/// home.dart
///
/// This Dart file defines the layout and functionality of the home screen in the application.
/// Serving as the centralized location, the home screen provides navigation to various pages
/// and access to diverse functionalities. It acts as the foundation upon which users
/// explore different features and content within the application.

/// Important essential packages required for the design.
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart'; // Material design package.
import 'package:flutter/services.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:streamx/pages/feedBackScreen.dart';
import 'package:streamx/pages/homeScreen/home.dart';
import 'package:streamx/pages/homeScreen/movies.dart';
import 'package:streamx/pages/homeScreen/search.dart';
import 'package:streamx/pages/homeScreen/theatre.dart';
import 'package:streamx/pages/homeScreen/tv.dart';
import 'package:streamx/utils/custom_widgets.dart';
import 'package:streamx/utils/theme.dart'; // Importing utilities.

/// [HomeScreen] class defined to encapsulate the design of the home page.
/// This class contains the different navigation screens.
/// This class is a stateful widget, returns the build() function of type Widget.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  // Overriding the abstract createState() function
  // to return state of the HomeScreen.
  @override
  // Creating the State of the HomeScreen
  HomeScreenState createState() => HomeScreenState();
}

// Defining state of homescreen.
class HomeScreenState extends State<HomeScreen> {
  // List of pages in homeScreen.
  final List<Widget> _homeScreenPages = [
    HomePage(),
    MoviePage(),
    TvTab(),
    TheatrePage()
  ];
  // Initializing PageController.
  final PageController _pageController = PageController();
  // Overriding abstract build() function
  @override
  // Defining build funtion.
  Widget build(BuildContext context) {
    // Retuning Scaffold widget.
    return Scaffold(
        appBar: homeScreenAppBar(), // Creating AppBar.
        drawer: leftDrawer(), // Rendering Left drawer.
        // Building the page view within the homeScreen body.
        body: bodContent());
  }

  /// List Of Components used within the HomeScreen.

  /// bottomNavBar() function creates the bottom navBar for the HomeScreen.
  /// function requires the context
  Widget bottomNavBar() {
    return Container(
      padding: const EdgeInsets.all(5.0),
      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(40)),
          boxShadow: [BoxShadow(color: Theme.of(context).colorScheme.shadow)],
          color: Provider.of<ThemeProvider>(context).getThemeData ==
                  AppTheme.darkMode
              ? AppTheme.extraColorsDark.surfaceContainer
              : AppTheme.extraColorsLight.surfaceContainer),
      child: GNav(
        tabBackgroundColor: Theme.of(context).colorScheme.secondary,
        activeColor: Theme.of(context).colorScheme.secondaryContainer,
        hoverColor: Theme.of(context).colorScheme.onPrimary,
        padding: EdgeInsets.all(15),
        tabMargin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
        gap: 10,
        tabs: [
          GButton(
            iconColor: Theme.of(context).colorScheme.onSurfaceVariant,
            icon: Icons.home_rounded,
            onPressed: () {
              if (_pageController.page != 0) {
                _pageController.jumpToPage(0);
              }
            },
            text: 'Home',
          ),
          GButton(
            onPressed: () {
              HapticFeedback.heavyImpact();
              if (_pageController.page != 1) {
                _pageController.jumpToPage(1);
              }
            },
            iconColor: Theme.of(context).colorScheme.onSurfaceVariant,
            icon: Icons.movie_outlined,
            text: 'Movies',
          ),
          GButton(
            iconColor: Theme.of(context).colorScheme.onSurfaceVariant,
            icon: Icons.tv_outlined,
            onPressed: () {
              if (_pageController.page != 2) {
                _pageController.jumpToPage(2);
              }
            },
            text: 'ON TV',
          ),
          GButton(
            iconColor: Theme.of(context).colorScheme.onSurfaceVariant,
            icon: Icons.theater_comedy_outlined,
            text: 'Theater',
            onPressed: () {
              if (_pageController.page != 3) {
                _pageController.jumpToPage(3);
              }
            },
          )
        ],
      ),
    );
  }

  /// BodyContent() contains the body of the scaffload.
  Widget bodContent() {
    return Stack(
      children: [
        PageView(
            controller: _pageController, // Assigning Page controller.
            physics: NeverScrollableScrollPhysics(), // Disabling scroll.
            children: _homeScreenPages),
        Align(
          alignment: Alignment.bottomCenter,
          child: bottomNavBar(),
        )
      ],
    );
  }

  /// HomeScreenAppBar() function was defined to render the Top App Bar for the
  /// home screen. This function is of type Widget that contains the AppBar component.
  /// Returns:
  /// [AppBar Widget]
  /// Parameters: none.

  AppBar homeScreenAppBar() {
    // List of local constants required for the AppBar configurations.
    const double appBarElevation = 1.0; // appBa Eleveation level.
    const String kSearchIconTooltip = 'Search'; // Search Icon toolTip String.
    return AppBar(
      // Returning SliverAppBar.
      backgroundColor:
          Theme.of(context).colorScheme.surface, // Color of the AppBar.
      centerTitle: true, // Centering appbar titile.
      scrolledUnderElevation: appBarElevation, // elevation on scroll.
      title: Custom.logo(context: context), // Displaying custom Logo.
      actions: [
        IconButton(
            tooltip: kSearchIconTooltip, // Setting toolTip for the IconButton.
            focusColor: Theme.of(context)
                .colorScheme
                .onSurfaceVariant, // Constant IconButton Focus color.
            hoverColor: Theme.of(context)
                .colorScheme
                .onSurfaceVariant, // IconButton Hover color.
            splashColor:
                Theme.of(context).colorScheme.onSurfaceVariant, // Splash color
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => FadeIn(child: SearchPanel())),
              );
            },
            icon: Icon(
              Icons.search_rounded, // Search Icon for IconButton.
              color: Theme.of(context).colorScheme.onSurface,
            ))
      ],
    );
  }

  /// LeftDrawer() function are responsible for to render leftDrawer in the HomeScreen.
  /// Function do not requires any paramter nor it has any nullable optional parameters.
  /// it returns the NavigationDrawer class.
  /// Retunrs:
  /// [NavigationDrawer] Widget : retunrs naviagtionDrawer type widget.
  /// Parameters: none.
  NavigationDrawer leftDrawer() {
    const double drawerChildContainerMargin = 14.0;
    const double kDrawerChildContainerPadding = 14.0;
    const double listItemContainerheight = 72.0;
    const double listItemElementPadding = 16.0;
    const double listItemContainerPaddingVertical = 8.0;
    const double listItemContainerPaddingHorizontal = 16.0;
    const String kMyListButtonLabel = "My Watch List";
    const String kTermsAndCondButtonLabel = "Terms and Conditions";
    const String kFeedBackButtonLabel = "Feedback";
    const String kThemeButtonLabel = "SwitchTheme";
    const String kLogOutButtonLabel = "Log Out";

    return NavigationDrawer(
        backgroundColor: Theme.of(context).colorScheme.surface,
        surfaceTintColor: Theme.of(context).colorScheme.surfaceTint,
        children: [
          Container(
            margin: EdgeInsets.all(drawerChildContainerMargin),
            child: Column(children: [
              Container(
                  padding: EdgeInsets.all(kDrawerChildContainerPadding),
                  width: double.infinity,
                  child: Text("Account Info",
                      style: AppTheme.textTheme.titleSmall)),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                    vertical: listItemContainerPaddingVertical,
                    horizontal: listItemContainerPaddingHorizontal),
                alignment: Alignment.centerLeft,
                color: Theme.of(context).colorScheme.surface,
                height: listItemContainerheight,
                child: Row(
                  children: [
                    Container(
                        padding: EdgeInsets.only(right: listItemElementPadding),
                        child: Icon(Icons.person)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Username', style: AppTheme.textTheme.bodyLarge),
                        Text(
                          'Alexander383',
                          style: AppTheme.textTheme.bodyMedium,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                    vertical: listItemContainerPaddingVertical,
                    horizontal: listItemContainerPaddingHorizontal),
                color: Theme.of(context).colorScheme.surface,
                height: listItemContainerheight,
                child: Row(
                  children: [
                    Container(
                        padding: EdgeInsets.only(right: listItemElementPadding),
                        child: Icon(Icons.email_rounded)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Email', style: AppTheme.textTheme.bodyLarge),
                        Text(
                          'example@gmail.com',
                          style: AppTheme.textTheme.bodyMedium,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                  padding: EdgeInsets.symmetric(
                      vertical: kDrawerChildContainerPadding),
                  child: Custom.divider(
                      color: Theme.of(context).colorScheme.outline)),
              SizedBox(
                height: listItemContainerheight,
                width: double.infinity,
                child: FilledButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent),
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(
                          Icons.list_alt_rounded,
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                        SizedBox(
                          width: kDrawerChildContainerPadding,
                        ),
                        Text(
                          textAlign: TextAlign.left,
                          kMyListButtonLabel,
                          style: TextStyle(
                              fontFamily:
                                  AppTheme.textTheme.labelLarge!.fontFamily,
                              fontSize: AppTheme.textTheme.labelLarge!.fontSize,
                              fontWeight:
                                  AppTheme.textTheme.labelLarge!.fontWeight,
                              color: Theme.of(context).colorScheme.onSurface),
                        )
                      ],
                    )),
              ),
              SizedBox(
                height: listItemContainerheight,
                width: double.infinity,
                child: FilledButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent),
                    onPressed: () {
                      Provider.of<ThemeProvider>(context, listen: false)
                          .toggleTheme();
                    },
                    child: Row(
                      children: [
                        Icon(
                            Provider.of<ThemeProvider>(context).getThemeData ==
                                    AppTheme.darkMode
                                ? Icons.dark_mode_rounded
                                : Icons.light_mode_rounded,
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant),
                        SizedBox(
                          width: kDrawerChildContainerPadding,
                        ),
                        Text(
                          textAlign: TextAlign.left,
                          kThemeButtonLabel,
                          style: TextStyle(
                              fontFamily:
                                  AppTheme.textTheme.labelLarge!.fontFamily,
                              fontSize: AppTheme.textTheme.labelLarge!.fontSize,
                              fontWeight:
                                  AppTheme.textTheme.labelLarge!.fontWeight,
                              color: Theme.of(context).colorScheme.onSurface),
                        )
                      ],
                    )),
              ),
              SizedBox(
                height: listItemContainerheight,
                width: double.infinity,
                child: FilledButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FeedBackForm()));
                    },
                    child: Row(
                      children: [
                        Icon(Icons.feedback_rounded,
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant),
                        SizedBox(
                          width: kDrawerChildContainerPadding,
                        ),
                        Text(
                          textAlign: TextAlign.left,
                          kFeedBackButtonLabel,
                          style: TextStyle(
                              fontFamily:
                                  AppTheme.textTheme.labelLarge!.fontFamily,
                              fontSize: AppTheme.textTheme.labelLarge!.fontSize,
                              fontWeight:
                                  AppTheme.textTheme.labelLarge!.fontWeight,
                              color: Theme.of(context).colorScheme.onSurface),
                        )
                      ],
                    )),
              ),
              SizedBox(
                height: listItemContainerheight,
                width: double.infinity,
                child: FilledButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent),
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(Icons.policy_rounded,
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant),
                        SizedBox(
                          width: kDrawerChildContainerPadding,
                        ),
                        Text(
                          textAlign: TextAlign.left,
                          kTermsAndCondButtonLabel,
                          style: TextStyle(
                              fontFamily:
                                  AppTheme.textTheme.labelLarge!.fontFamily,
                              fontSize: AppTheme.textTheme.labelLarge!.fontSize,
                              fontWeight:
                                  AppTheme.textTheme.labelLarge!.fontWeight,
                              color: Theme.of(context).colorScheme.onSurface),
                        )
                      ],
                    )),
              ),
              SizedBox(
                height: listItemContainerheight,
                width: double.infinity,
                child: FilledButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent),
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(Icons.logout_rounded,
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant),
                        SizedBox(
                          width: kDrawerChildContainerPadding,
                        ),
                        Text(
                          textAlign: TextAlign.left,
                          kLogOutButtonLabel,
                          style: TextStyle(
                              fontFamily:
                                  AppTheme.textTheme.labelLarge!.fontFamily,
                              fontSize: AppTheme.textTheme.labelLarge!.fontSize,
                              fontWeight:
                                  AppTheme.textTheme.labelLarge!.fontWeight,
                              color: Theme.of(context).colorScheme.onSurface),
                        )
                      ],
                    )),
              ),
            ]),
          )
        ]);
  }
}
