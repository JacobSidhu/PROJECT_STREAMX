/// custom_widgets.dart
///
/// This dart file contains the all the customized widget need in the application
/// development. its contains custom contains, class etc.

// Imoprting essential packages.
import 'package:flutter/material.dart'; // Material Design.
import 'package:google_fonts/google_fonts.dart'; // Google fonts package.
import 'package:streamx/pages/movie_details.dart';
import 'package:streamx/utils/api/api_service.dart'; // Accessing Api services.
import 'package:streamx/utils/theme.dart'; // Importing required utilities.
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

///The class Custom defined to encapsulate customized widget those are
///important and required to render along development process of this
///application. Class contains the static functions to be access by
///class itself without instantiating any object.
class Custom {
  /// This function returns the Container that takes values of add space arround its
  /// child. Returns [Container]. Parameters:
  /// [paddingLeft] to add space inside the container to the child.
  /// [paddingRight] to add space on right inner side.
  /// [paddingTop] to add space on Top inner side.
  /// [paddingBottom] to add space on Bottom inner side.
  /// [marginTop] to add space on Top outer side.
  /// [marginBottom] to add space on Bottom outer side.
  /// [marginLeft] to add space on left outer side.
  /// [marginRight] to add space on right outer side.
  static spaceArround(
      {required Widget child,
      double? paddingTop,
      double? paddingBottom,
      double? paddingRight,
      double? paddingLeft,
      double? marginLeft,
      double? marginRight,
      double? marginBottom,
      double? marginTop}) {
    const double kEmptyPlaceHolder = 0.0;
    return Container(
      margin: EdgeInsets.only(
          top: marginTop ?? kEmptyPlaceHolder,
          bottom: marginBottom ?? kEmptyPlaceHolder,
          right: marginRight ?? kEmptyPlaceHolder,
          left: marginLeft ?? kEmptyPlaceHolder),
      padding: EdgeInsets.only(
          top: paddingTop ?? kEmptyPlaceHolder,
          bottom: paddingBottom ?? kEmptyPlaceHolder,
          right: paddingRight ?? kEmptyPlaceHolder,
          left: paddingLeft ?? kEmptyPlaceHolder),
      child: child,
    );
  }

  Widget listTile(
      {required BuildContext context,
      required String posterPath,
      required String title,
      required bool isAdult,
      required String releasedOn}) {
    // Constant used for to create tile.
    const double kTileHeight = 80;
    const double kTitleContainerHeight = 75.0;
    const double kIconButtonContainerWidth = 60;
    const EdgeInsets kTitleContainerPadding = EdgeInsets.all(4.0);
    const double kImageContainerWidth = 100;
    const double kImageContainerBorderRadius = 4.0;
    const String kIconButtonLabel = "Delete";
    const String kAdultLabel = "18+";
    const String kChildLabel = "12+";
    return SizedBox(
      // Setting height.
      height: kTileHeight,
      // Layout content of tile in row.
      child: Row(
        children: [
          // Image Container configurations.
          Container(
            // Image container Width.
            width: kImageContainerWidth,
            // Decoration image.
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                    Radius.circular(kImageContainerBorderRadius)),
                border:
                    Border.all(color: Theme.of(context).colorScheme.outline),
                color: Theme.of(context).colorScheme.onBackground,
                image: DecorationImage(
                    image: NetworkImage(posterPath), fit: BoxFit.cover)),
          ),
          Expanded(
            child: Container(
              height: kTitleContainerHeight,
              color: Theme.of(context).colorScheme.surfaceVariant,
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                    padding: kTitleContainerPadding,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Text(
                            title,
                            style: AppTheme.textTheme.titleMedium,
                          ),
                        ),
                        Text(
                          "Released: $releasedOn",
                          style: AppTheme.textTheme.bodySmall,
                        ),
                        Text(
                          "Adult rating: ${isAdult ? kAdultLabel : kChildLabel}",
                          style: AppTheme.textTheme.bodySmall,
                        ),
                      ],
                    ),
                  )),
                  // This sizedbox contains the icon button in the tile.
                  SizedBox(
                    // Width of icon Container.
                    width: kIconButtonContainerWidth,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Laying out IconButton and Icon label in column view.
                        IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
                        // Icon label.
                        Text(
                          kIconButtonLabel,
                          // Styling Icon label string.
                          style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant,
                              fontFamily: "Inter",
                              fontSize: AppTheme.textTheme.labelSmall!.fontSize,
                              fontWeight:
                                  AppTheme.textTheme.labelSmall!.fontWeight),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  /// This function renders the divider line.
  /// It returns the Container that is filled with the color.
  static Widget divider(
      {Color? color, double? height, EdgeInsets? margin, double? width}) {
    // Constant Used.
    const Color kColor = Colors.grey;
    const double kHeight = 2;
    const EdgeInsets kMargin = EdgeInsets.symmetric(horizontal: 5);
    return Container(
      margin: margin ?? kMargin,
      width: width,
      color: color ?? kColor,
      height: height ?? kHeight,
    );
  }

  /// This function was defined to contains buttons with
  /// proper margin and size.Returns [Container]. Parameters none.
  static Widget buttonContainer(
      {required Widget button, double? horizontalPadding}) {
    // Constant values.
    const double kContainerHeight = 54.0;
    const double kTopMargin = 10;
    const double kBottomMargin = 10;
    const double kPaddingHorizontal = 80;
    // Returing button container.
    return Container(
      // Button container configurations.
      height: kContainerHeight,
      width: double.infinity,
      margin: EdgeInsets.only(top: kTopMargin, bottom: kBottomMargin),
      padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding ?? kPaddingHorizontal),
      child: button,
    );
  }

  ///logo() type Widget function returns the container that
  /// contains the logo of the app into the text form
  /// Returns: [Row]
  ///Parameters:
  /// [context] - BuildContext: required to change color.
  ///Returns - (Widget)
  static Widget logo({required BuildContext context}) {
    // list of constant used.
    const kLogoStringStream = 'Stream';
    const kLogoStrinX = 'X';
    const Color kXstringColor = Color.fromARGB(255, 208, 14, 0);
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(kLogoStringStream, style: AppTheme.textTheme.titleLarge),
      Text(kLogoStrinX,
          style: GoogleFonts.tradeWinds(
              fontSize: AppTheme.textTheme.titleLarge?.fontSize,
              fontWeight: AppTheme.textTheme.titleLarge?.fontWeight,
              color: kXstringColor))
    ]);
  }

  static Widget processIndicator({required BuildContext context}) {
    return Center(
        child: CircularProgressIndicator(
      semanticsLabel: 'Processing',
      color: Theme.of(context).colorScheme.primary,
    ));
  }
}

/// this is place Holder screen for tvshows details viewer
/// returns: [Widget]. parameters: none.
Widget tvShowsDetailsView() {
  // Place holder appbar title.
  const String kTitle = "Tv shows preview";
  const String kMessage = "Details Not Available Yet !";
  return Scaffold(
      appBar: AppBar(title: Text(kTitle)), body: Center(child: Text(kMessage)));
}

/// This class was definied to create the custom grid the view.
/// returns gridView Geneates. Paramaters: object of type T, itemsCount, poster.
class PosterGridGenerator<T> extends StatelessWidget {
  final T object;
  final int itemsCount;
  final Widget Function(int) poster;
  // Defining class constructor to initialize class members.
  const PosterGridGenerator(
      {super.key,
      required this.object,
      required this.itemsCount,
      required this.poster});
  @override
  Widget build(BuildContext context) {
    // List of constant values required for this component design.
    const double kChildAspectRatio = 0.6; // Aspect ratio of each item in grid.
    const double kCrossAxisSpacing = 2.0; // space between column.
    const int kCrossAxisCount = 3; // Number of columns in grid.
    return GridView.builder(
        // Disabling manual scroll controll.
        physics: NeverScrollableScrollPhysics(),
        // Defining the dimensions of the grid.
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: kChildAspectRatio,
            crossAxisSpacing: kCrossAxisSpacing,
            crossAxisCount: kCrossAxisCount),
        itemCount: itemsCount, // Grid items lenght.
        itemBuilder: (context, index) {
          // Building and Returing custom poster() widget.
          return poster(index);
        });
  }
}

/// The 'PosterRowGenerator' class generates the horizontal row of posters.
/// It is genric type of class. Template was used to pass any object type within the
/// class, so to use for poster. it is a stateless widget as it do not change in
/// widget state. Returns: [ListView.separator()] that returns the poster row list.
/// Parameters:
/// [T] of genre T type to get the object of any type.
/// [itemCount] of type int to get the number of items to list.
/// [poster] function of type widget that invoks within the class and passes the index.
/// [isTitle] Determines the rendering of the title.
/// [title] takes the string of for the title.
/// [containerheight] takes the container height.
class PosterRowGenerator<T> extends StatelessWidget {
  // List of optional required and nullable variables.
  final int itemCount; // To store items count.
  final Widget Function(int) poster; // To pass Poster instance.
  final bool isTitle; // To get title of the row.
  final String? title; // Determines whether to display title or not.
  final double? containerHeight; // Takes the height of the Row Container.
  // Defining the Constructor of the class.
  const PosterRowGenerator(
      {super.key,
      required this.itemCount,
      required this.poster,
      this.containerHeight,
      this.isTitle = true,
      this.title});
  // Overriding the abstract build method.
  @override
  // Defining the build() methods by passing context.
  Widget build(BuildContext context) {
    /// List of constants used within the row generator.
    const EdgeInsets kRowTitlePadding = EdgeInsets.symmetric(
        vertical: 5.0, horizontal: 8.0); // Row title padding.
    const String kTitlePlaceHolder = 'Row Title'; // Default title String.
    const EdgeInsets kListContainerPadding =
        EdgeInsets.only(top: 5.0, left: 5.0); // Height of the list Container.
    const double kContainerWithTitleHeight = 260; // Height of Row.
    const double kContainerWithOutTitleHeight = 220; // Height of Row.
    const double kSpacing = 5.0; // Spacing between the list items.
    // Returning list row into padded and sized container.
    return Container(

        /// List Container configurations.
        height: isTitle
            ? kContainerWithTitleHeight
            : kContainerWithOutTitleHeight, // Setting height of Row.
        padding: kListContainerPadding, // Setting the Padding for the Row.
        // laying out Row into the column widget.
        child: Column(
          // Setting column's Axis alignments.
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          // Putting childern widgets into the childer array of column widget.
          children: [
            // Rendering optional title.
            if (isTitle) ...[
              Container(

                  /// Title container Configurations.
                  alignment: Alignment.centerLeft, // Alignment.
                  width: double.infinity, // Width of title container.
                  padding: kRowTitlePadding, // Padding of title container.
                  child: Text(title ?? kTitlePlaceHolder,
                      style: AppTheme.textTheme.titleMedium))
            ],
            // Expanding the list in the sized container.
            Expanded(
              // Generating list of posters in a row.
              child: ListView.separated(
                  // Adding bounce effect to the list when it got stretched.
                  physics: BouncingScrollPhysics(),
                  // Setting the scroll direction of the list.
                  scrollDirection: Axis.horizontal,
                  // Building Context.
                  itemBuilder: (context, index) {
                    // Retunring poster function by passing index in it.
                    return poster(index);
                  },
                  // Separating each items in the list with the constant space.
                  separatorBuilder: (context, index) {
                    // Returing fixed sized width to add space.
                    return SizedBox(
                      width: kSpacing,
                    );
                  },
                  // Defining list items count.
                  itemCount: itemCount),
            )
          ],
        ));
  }
} // PosterRowGenerator() close.

/// This class was defined to view movies provides the category.
/// It build the grid of movies. Returns [Scaffold] widget.
/// Parameters: category id and poster.
/// Define
class MovieCategoryViewer extends StatelessWidget {
  final Future<List<MovieData>?> object;
  final String? title;
  const MovieCategoryViewer({super.key, required this.object, this.title});
  @override
  Widget build(BuildContext context) {
    // Default appBar title
    const String kTitle = "Movies";
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            title ?? kTitle,
            style: AppTheme.textTheme.titleMedium,
          ),
          actions: [
            Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(
                      Icons.close_rounded,
                      size: 36.0,
                    )))
          ],
        ),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: CustomFutureBuilder(
                future: object,
                whenHasData: (data) {
                  return AnimationLimiter(
                    child: GridView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: 18,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 0.65, crossAxisCount: 3),
                        itemBuilder: (context, index) {
                          return AnimationConfiguration.staggeredGrid(
                              position: index,
                              columnCount: 3,
                              duration: Durations.long2,
                              child: FadeInAnimation(
                                child: SlideAnimation(
                                  delay: Durations.short2,
                                  child: Poster(
                                      posterPath: data[index].posterPath,
                                      navigateTo: MovieDetailsViewer(
                                        object: data[index],
                                      )),
                                ),
                              ));
                        }),
                  );
                })));
  }
}

/// [Poster] class was defined to create a rounded rectangular shaped poster
/// that can be clicked to navigate to the posterView screen. The class
/// requires the context to navigate.
/// Returns:
/// [GestureDetector] of type widget.
/// Parameters:
/// [navigateTo]  of type widget to navigate to the poster viewer.
/// [posterPath] of type String: toLoad Image.
class Poster extends StatefulWidget {
  final double _posterBorderRadius = 16.0;
  final double _posterWidth = 130;
  final double _posterHeight = 190;
  final double _posterShadowSpreadRadius = 0.5;
  final double _posterShadowBlurRadius = 5.0;
  final double _posterExpandedWidth = 135;
  final double _minimumVerticalMargin = 5.0;
  final double _verticalMargin = 10;
  final double _horizontalMargin = 1.0;
  final String posterPath;
  final Widget navigateTo;
  const Poster(
      {super.key,
      required this.posterPath,
      required this.navigateTo}); // Creating a Constructor.
  @override // Overriding the createState function to create PosterState.
  PosterState createState() => PosterState();
}

// Defining the PosterState class.
class PosterState extends State<Poster> {
  double verticalMargin = 10;
  double posterWidth = 130;
  double top = 10;
  bool isheld = false;
  @override // Overriding the buildd function.
  Widget build(BuildContext context) {
    // Retruning Gesture Detector widget.
    return GestureDetector(
      // Defining behaviour of the Poster on tap.
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => widget.navigateTo));
      },
      // Defining the behaviour of the poster when it longPressed.
      onLongPress: () {
        setState(() {
          // On longPress Changing Dimensions
          isheld = true;
          verticalMargin = widget._minimumVerticalMargin;
          posterWidth = widget._posterExpandedWidth;
        });
      },
      // Defining behaviour of the poster container when long press is released.
      onLongPressEnd: (details) {
        setState(() {
          // ReEstablishing the dimensions
          isheld = false;
          verticalMargin = widget._verticalMargin;
          posterWidth = widget._posterWidth;
        });
      },
      child: AnimatedContainer(
        margin: EdgeInsets.symmetric(
            horizontal: widget._horizontalMargin, vertical: verticalMargin),
        width: posterWidth, // Dynamic Width of Container.
        height: widget._posterHeight, // Height of Container.
        decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).colorScheme.outline),
            // If poster is long pressed and held there will be shadow.
            boxShadow: isheld
                ? [
                    BoxShadow(
                      color:
                          Theme.of(context).colorScheme.shadow.withOpacity(0.5),
                      offset: Offset.zero, // Setting Offset to zero.
                      blurRadius:
                          widget._posterShadowBlurRadius, // Shadow radius.
                      spreadRadius: widget
                          ._posterShadowSpreadRadius, // Shadow Spread Radius.
                    )
                  ]
                : null,
            // Setting Background Colors of the poster.
            color: Theme.of(context).colorScheme.onBackground,
            image: DecorationImage(
                // Decorating Network Image.
                image: NetworkImage(widget.posterPath),
                fit: BoxFit.cover),
            // Setting Border Radius.
            borderRadius: BorderRadius.circular(widget._posterBorderRadius)),
        duration: Durations.short2, // Animation duration interval.
      ),
    );
  }
}

/// CustomFutureBuilder is the genric type of class that takes different types
/// of future data. It was definied to minimize code repetition. It is extends the
/// stateLessWidget and has a build function in it. Returns: [FutureBuilder] that builds
/// context based on futuristic response from api requests.
/// Parameter: [future] request to future type instance to build context.
/// [whenHasData] function of type widget that invokes inside the class and passes
/// the object of type.
/// [onDataEmpty] : nullable widget when data fetched is empty.
/// [onNetworkError]: nullable widget that can be passed when more specific action is required.
/// [whileProcessing]: nullable whileProcessing that can be used to take widget when its process
/// the request.
class CustomFutureBuilder<T> extends StatelessWidget {
  // List of nullable and required paramters.
  final Future<List<T>?>? future;
  final Widget Function(List<T>) whenHasData;
  final Widget? onDataEmpty;
  final Widget? whenHasNull;
  final Widget? onNetworkError;
  final Widget? whileProcessing;
  // Defining Class constructor and initializing class members.
  const CustomFutureBuilder(
      {super.key,
      required this.future,
      required this.whenHasData,
      this.onDataEmpty,
      this.onNetworkError,
      this.whenHasNull,
      this.whileProcessing});

  // Overriding build methods.
  @override
  Widget build(BuildContext context) {
    // Returning FutureBuilder Widget.
    return FutureBuilder(
        future: future, // Assigning future object.
        // Building context on snapshot.
        builder: (context, snapshot) {
          // Checking connection states.
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Connection is on waiting state.
            return whileProcessing ?? Custom.processIndicator(context: context);
          } // if data retrieved is null.
          else if (snapshot.data == null) {
            // Returning Suitable Feedback message.
            return whenHasNull ??
                Center(
                    // Displaying feebback.
                    child: Text(TMDBAPIManager.kDataNotFound,
                        // Aligning text.
                        textAlign: TextAlign.center,
                        // Styling Text.
                        style: AppTheme.textTheme.displaySmall));
          } // Checking if data fetched is empty.
          else if (snapshot.data!.isEmpty) {
            // onDataEmpty widget is null and then defining custom behaviour.
            return onDataEmpty ??
                // Defining custom behaviour.
                Center(
                    // Displaying text.
                    child: Text(TMDBAPIManager.kDataNotFound,
                        // Alignment of the text
                        textAlign: TextAlign.center,
                        // Styling Text.
                        style: AppTheme.textTheme.displayLarge));
          } // Defining the widget when snapshot has data.
          else if (snapshot.hasData) {
            // Retuning whenHasData function and passing data in it.
            return whenHasData(snapshot.data!);
          }
          // Checking if there is any else error.
          else {
            // onNetworkError was not defined then returning custom behaviour.
            return onNetworkError ??
                // Displaying feedback text string.
                Center(
                    child: Text(TMDBAPIManager.kHttpError,
                        // Setting alignment.
                        textAlign: TextAlign.center,
                        // Styling Text.
                        style: AppTheme.textTheme.displayLarge));
          }
        });
  }
}
