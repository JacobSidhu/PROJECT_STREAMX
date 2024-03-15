/// 'movie_details.dart'
///
/// This dart file contains the UI design of the movie poster details Viewer screen, that
/// shows the detailed overview about the movie. It has only one stateful class
/// to render UI in the application.

/// Essential imported packages, dependencies and utitlites required for the completion
/// of the design UI.
import 'package:animate_do/animate_do.dart'; // Importing 'animate_do' dependency.
import 'package:flutter/material.dart'; // Importing 'Material' package.
import 'package:streamx/utils/api/api_service.dart'; // Importing 'api' file.
import 'package:streamx/utils/custom_widgets.dart'; // Importing utitlies needed.
import 'package:streamx/utils/theme.dart'; // Importing theme of the application.

/// MovieDetailsViewer class was defined to design the UI components
/// required for the implementation of the movie poster detailed view.
/// this class has only one MovieData type member and a constructor that
/// requires the MovieData object and key. It has various UI components separated
/// into each corresponding functions that renders the UI on the screen.
/// it extends to the statefulWidget to update UI components during runTime.
class MovieDetailsViewer extends StatefulWidget {
  final MovieData object; // Empty MovieData Object.
  const MovieDetailsViewer({super.key, required this.object});
  @override // Creating Widget Class State.
  MovieDetailsViewerState createState() => MovieDetailsViewerState();
} // MovieDetailsViewer close.

/// Defining MovieDetailsViewer State.
class MovieDetailsViewerState extends State<MovieDetailsViewer> {
  // Instantiating page Controller to controll the pageView.
  final PageController _pageController = PageController();
  // To keep track of current page Index within PageView.
  int currentPageIndex = 0;
  @override // Overriding the abstract build function from StatefulWidget class.
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        // Rendering AppBar with function.
        appBar: posterViewerAppBar(),
        // Retunring body content from bodyContent() function.
        body: bodyContent());
  } // MoviePosterViewerState close.

  /// This function of type AppBar was defined to return the Customized AppBar
  /// for the movie poster viewer body. It has its own required configurational
  /// const values. Returns: [AppBar] class. Parameters: none.
  AppBar posterViewerAppBar() {
    // Close Icon Button Size.
    const double kIconButtonSize = 38;
    // Returning Customized AppBar Class Widget.
    return AppBar(
        // AppBar Containments Container background Color.
        backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
        // Setting Default backArrow IconButton off to render automatically.
        automaticallyImplyLeading: false,
        actions: [
          // Poping off the Context with close IconButton.
          IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Icon(Icons.close_rounded, size: kIconButtonSize))
        ]);
  } // posterViewerAppBar() Close.

  /// Function named as bodyContent encapsulate all UI components within the body.
  /// It lists the body content into the vertical scroll view layout. It has
  /// 5 broad UI components in the contained in the singleChildScrollView class.
  /// Returns: [SingleChildScrollView] class. Parameters: none.
  Widget bodyContent() {
    // Returning other functions within SignleChildScrollView Widget.
    return SingleChildScrollView(
        child: Column(children: [
      posterBackDrop(),
      posterInfo(),
      Custom.divider(),
      pagesTabsRibbon(),
      pageViewer()
    ]));
  } // bodyContent() close.

  /// PosterBackDrop function is responsible for displaying the poster backdrop
  /// within the scene. It has its own constant values required to configure and
  /// and to set properties for the backdrop container. Returns: [Container] that
  /// contains the posterBackdrop into the landscape orientation.
  Widget posterBackDrop() {
    // BackDrop Container size.
    const Size kContainerSize = Size(double.infinity, 240);
    // Container linear gradiant colors stops.
    const List<double> gradiantColorsExtensions = [0.001, 0.999];
    // Image Container margin.
    const EdgeInsets kImageMargin =
        EdgeInsets.only(top: 20.0, right: 20, left: 20, bottom: 20);
    // Linear gradiant Color.
    final List<Color> linearGradientColors = [
      Theme.of(context).colorScheme.surfaceVariant,
      Theme.of(context).colorScheme.surface
    ];
    // Returing Poster Container.
    return Container(
        // Setting the dimensions of the Contaniner.
        height: kContainerSize.height,
        width: kContainerSize.width,
        // Decorating the backdrop container with linear gradient effect.
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: linearGradientColors,
                // Defining the stops for the gradient colors.
                stops: gradiantColorsExtensions,
                // Defining the Begin and end for the linear colors path.
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        // Encapsulating Container child in Hero animation Widget.
        child: Hero(
          // Adding a Tag for the Hero class.
          tag: 'Hello',
          // Defining the backDrop Image Container.
          child: Container(
            // Setting up Margin to the image.
            margin: kImageMargin,
            // Decorating Image Contaniner.
            decoration: BoxDecoration(
                // Setting Image Backgroung Shadow.
                boxShadow: [
                  // Configuring Shadow properties.
                  BoxShadow(
                      // Color of the Shadow effect.
                      color: Theme.of(context).colorScheme.shadow,
                      offset: Offset.zero, // Overriding Offset.
                      spreadRadius: 1, // Setting Shodow spread radius.
                      blurRadius: 10) // Adding Blur to the Shadow color.
                ],
                // Setting border Color.
                border:
                    Border.all(color: Theme.of(context).colorScheme.outline),
                // Loading Network Image.
                image: DecorationImage(
                    image: NetworkImage(widget.object.backDrop),
                    fit: BoxFit.cover), // Setting BoxFit properties.
                // Setting Image container Border radius.
                borderRadius: BorderRadius.circular(20)),
          ),
        ));
  } // posterBackDrop() close.

  /// This posterInfo() function is responsible for to render poster broad overview
  /// for instance title, duration, categories and adult rating in a row. This
  /// function returns numbers of column and rows as a child to layout the information
  /// in a title. Returns: Container that contains the contains info about poster.
  /// Parameters: none.
  Widget posterInfo() {
    // List of Required constant values.
    const EdgeInsets kMargin = EdgeInsets.all(10.0);
    const EdgeInsets kPadding = EdgeInsets.only(left: 10);
    const Size kContainerDimensions = Size(double.infinity, 68.0);
    const double kIconSize = 28;
    const double kIconLabelSize = 12;
    const List<String> kIconButtonLabels = ["Like", "Save"];
    const List<IconData> kButtonIconData = [
      Icons.thumb_up,
      Icons.add_to_photos_outlined
    ];
    const double kIconButtonClickableTargetArea = 48;
    // Return Information Container.
    return Container(
      alignment: Alignment.topCenter, // Container Alignment .
      margin: kMargin, // COntainer Margin.
      height: kContainerDimensions.height,
      width: kContainerDimensions.width,
      // Creating a row of poster related information and save and like button.
      child: Row(
        children: [
          Expanded(
              child: Column(
            children: [
              Expanded(
                // Expanding the title container in a column.
                child: Container(
                  // Title container.
                  padding: kPadding, // Title container padding.
                  alignment: Alignment.bottomLeft, // Container child alignment.
                  width: double.infinity, // Container width within outer row.
                  // Containing title text into the singleChildScrollView.
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal, // scrollDirection.
                    child: Text(
                      // Creating title text.
                      widget.object.title, // Title string.
                      textAlign: TextAlign.left, // Title text alignment.
                      // Title text Textstyle.
                      style: AppTheme.textTheme.titleLarge,
                    ),
                  ),
                ),
              ),
              // Release date and adult rating text string Container.
              Container(
                padding: kPadding, // Container padding.
                width: double.infinity, // Container Width.
                // Creating Text within the container.
                child: Text(
                    'Release: ${widget.object.releaseData} | ${widget.object.isAdult ? "18+" : "12+"}',
                    // Styling the text.
                    style: AppTheme.textTheme.bodySmall),
              ),
              // Encapsulating duration and genre of the poster within the container.
              Container(
                padding: kPadding, // Container Padding.
                width: double.infinity, // Container width.
                // Displaying text.
                child: Text('Duration: 01:22.0 | Action, Adventure, Drama',
                    // Styling Text Starting.
                    style: AppTheme.textTheme.bodySmall),
              )
            ],
          )),
          // This column Contains and the button rows and buttons label row.
          Column(
            children: [
              Row(
                // Buttons icon row.
                children: [
                  for (IconData iterator in kButtonIconData)
                    IconButton(
                        // Creating Like IconButton to let user like show.
                        // Action on hitting like button.
                        onPressed: () {},
                        // Creating Icon of the IconButton.
                        icon: Icon(
                          iterator, // Like Button Icon.
                          color: Colors.grey, // Setting Icon Color.
                          size: kIconSize, // Icon Size.
                        ))
                ],
              ),
              // This row is the second row within the Column with contains the
              // buttons labels and their corresponding styling.
              Row(
                children: [
                  // Creating the label underneath the Icon Button.
                  for (String iterator in kIconButtonLabels)
                    // Icon label Sized Container.
                    SizedBox(
                        width: kIconButtonClickableTargetArea,
                        // Displaying Text label string.
                        child: Text(iterator,
                            // Setting Text alignment.
                            textAlign: TextAlign.center,
                            // Label string Styling.
                            style: TextStyle(fontSize: kIconLabelSize)))
                ],
              ) // Icon labels row close.
            ],
          ) // IconButton and Labels Column close.
        ],
      ), // Poster info and Buttons row close.
    );
  } // posterInfo() close.

  /// The Function pageTabsRibbion  function serves as a methods to navigate
  /// between the pageview. It renders the button ribben with contains three
  /// buttons. Returns: [SizeBox] that encapsulate the page tabs. Parameters:
  /// none.
  Widget pagesTabsRibbon() {
    // Ribbon buttons Labels String List.
    const List<String> textButtons = ["More alike", "Overview", "Available on"];
    const double ktabsContainerHeight = 48;
    const EdgeInsets kTabButtonContainerPadding =
        EdgeInsets.symmetric(horizontal: 20.0);
    // Retunring the SizedBox Container.
    return SizedBox(
        // Sized Box Height.
        height: ktabsContainerHeight,
        // Generating the list of Buttons or tabs using list builder.
        child: ListView.builder(
            // defining th scroll direction.
            scrollDirection: Axis.horizontal,
            // Setting List items length.
            itemCount: textButtons.length,
            // Building Context.
            itemBuilder: (context, index) {
              // Returing Button list with constant padding arround them.
              return Padding(
                  // Setting padding arround the buttons.
                  padding: kTabButtonContainerPadding,
                  // Creating Tab button using textButton class.
                  child: TextButton(
                      // Invoking action on pressing textButton.
                      onPressed: () {
                        // Updating currentPageIndex.
                        setState(() {
                          currentPageIndex = index;
                        });
                        // Jumping to the page corresponding page.
                        _pageController.jumpToPage(index);
                      },
                      // Labeling TextButton with String Labels.
                      child: Text(textButtons[index],
                          // Styling label Text.
                          style: TextStyle(
                              // Setting color for the label based on the active
                              // page.
                              color: currentPageIndex == index
                                  ? Theme.of(context).colorScheme.onSurface
                                  : Theme.of(context)
                                      .colorScheme
                                      .onSurface
                                      .withOpacity(0.5)))));
            }));
  } // pagesTabsRibbon() close.

  /// pageViewer() function responsible for to view different pages in the view.
  /// It pageview widget had been assigned to the PageController to controll all
  /// the pages into the PageView. Returns: [SizedBox] that contains the size page
  /// view frame. Parameters: none.
  Widget pageViewer() {
    // Constant Values required for the sizedBox pageview.
    const double kPageViewFrameHeight = 440;
    // List of Widgets that used within the Pageview.
    List<Widget> pages = [
      SlideInUp(child: similarPostersGridPage()),
      SlideInUp(child: posterOverviewPage()),
      SlideInUp(child: watchProvidersPage())
    ];
    // Returning sized pageview frame.
    return SizedBox(
        // Setting height the pageView.
        height: kPageViewFrameHeight,
        // Defining the Pageview.
        child: PageView(
            // Disabling manual controll by the user.
            physics: NeverScrollableScrollPhysics(),
            // Assigning pageController to the PageView Widget.
            controller: _pageController,
            // Accessing Childern pages within the PageView.
            children: pages));
  } // pageViewer() close.

  /// This function named "similarPostersGridPage()" loading the similar movies
  /// to the current access poster. It using the Custom Future builder to load
  /// similar movies. And if there its'nt any similar movies and loading
  /// discover movies api. Retunrs: [CustomFutureBuilder] class. Paramters:
  /// none.
  Widget similarPostersGridPage() {
    // List of constant values required for this component design.
    const double kChildAspectRatio = 0.6; // Aspect ratio of each item in grid.
    const double kCrossAxisSpacing = 2.0; // space between column.
    const int kCrossAxisCount = 3; // Number of columns in grid.
    // Returing CustomfutureBuilder Widget Class.
    return CustomFutureBuilder(
      // Assigning similarMovies provider api to Future.
      future: TMDBMovies.moviesByGenreId(genreID: widget.object.genre[0]),
      // Designing the context snapshot succesfully has data.
      whenHasData: (data) {
        // Returning GridViewBuilder.
        return PosterGridGenerator(
            object: data,
            itemsCount: data.length,
            poster: (index) {
              // Returing Poster.
              return Poster(
                  posterPath: data[index].posterPath, // Accessing Poster Path.
                  // On click navigating to movieDetails Viewer.
                  navigateTo: MovieDetailsViewer(object: data[index]));
            });
      },
      // Invoking Action when data was empty.
      // Displaying discover movies.
      onDataEmpty: CustomFutureBuilder(
          // Assigning discoverMovie Api.
          future: TMDBMovies.discoverMovies(),
          // When has data.
          whenHasData: (data) {
            return GridView.builder(
                // Disabling manual scroll behaviour.

                // Defining the Item number and spacing between the grid items.
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: kChildAspectRatio,
                    crossAxisSpacing: kCrossAxisSpacing,
                    crossAxisCount: kCrossAxisCount),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  // Returing the Poster.
                  return Poster(
                      posterPath: data[index].posterPath,
                      navigateTo: MovieDetailsViewer(object: data[index]));
                });
          }),
    );
  } // SimilarPosterGridPage() close.

  /// This page provides the overview About the movie.
  /// Retunrs [Center] widget that contains the centred Text if
  /// string if is empty and if not then returns the constant padded
  /// string of overview. Parameters: none.
  Widget posterOverviewPage() {
    // Constant padding arround the string.
    const EdgeInsets kpadding = EdgeInsets.all(20);
    // Checking if movie overview is empty.
    if (widget.object.overview.isEmpty) {
      // if empty returing 'no information' string.
      return Center(
          child: Text("No Information Available",
              // Styling the TextString.
              style: AppTheme.textTheme.displayMedium));
    } else {
      // if overview is not empty then returning the overview within the
      // padding widget.
      return Padding(
          padding: kpadding,
          child: SelectableText(widget.object.overview,
              // Styling string.
              style: AppTheme.textTheme.bodySmall));
    }
  }

  /// watchProviderPage() function providers the information about the movie
  /// providers even on rent and to buy. it function also use the watchProvider
  /// api to fetch details about the stream providers.
  /// Returns the [Futurebuilder]. Paramters: none.
  Widget watchProvidersPage() {
    // Returns the FutureBuilder.
    return FutureBuilder(
      // Assigning TMDBmovies.watchprovider API url.
      future: TMDBMovies.watchProvider(movieId: widget.object.id),
      // Building Context.
      builder: (context, snapshot) {
        // Checking if Connection state is in waiting state.
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Then Returing Custom processIndicator.
          return Custom.processIndicator(context: context);
        } // Checking Response was null.

        else if (snapshot.data == null) {
          print(
              "watchProvider SnapShot was null in movieProvidersPage function");
          // Returns suitable feedback when there is'nt any data.
          return Center(
            child: Text(
              TMDBAPIManager.kDataNotFound,
              textAlign: TextAlign.center,
              // Styling feedback string.
              style: AppTheme.textTheme.displaySmall,
            ),
          );
        }
        // Checking when snapshot has data.
        else if (snapshot.hasData) {
          WatchProviders data = snapshot.data!;
          print("has got data in movieProvidersPage function");
          // Assigning data to the WatchProviders datatype.
          // Constant Values and labels.
          const double kRowPadding = 10; // Padding for rent row Container.
          const double kRowHeight = 220; // Padding for rent row Container.
          const Size kSizeOfLogo = Size(120, 120); // Logo container dimensions.
          const double kLogoBorderRadius = 24.0;
          const String kRentRowLabel =
              "Available to Rent: "; // Rent providers row label.
          const String kBuyRowLabel =
              "Available to Buy:"; // To Buy providers row label.
          const EdgeInsets kRowLabelContainerPadding = EdgeInsets.all(10);
          // Retunring the Column of Rows of movies on rent and movie to buy provider's
          // information.
          return Column(
              // Setting cross Alignment to start.
              crossAxisAlignment: CrossAxisAlignment.start,
              // Returing Row based on movie is availble for.
              children: [
                // If movie is avaiable to rent on specific platforms.
                if (data.rent != null) ...[
                  // Returing Sized row of movie to rent providers info.
                  SizedBox(
                      height: kRowHeight, // Setting row height.
                      // Displaying Movies providers logo and name in column layout.
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Displaying the Row Label within the constant
                          // padding.
                          Padding(
                              padding: kRowLabelContainerPadding,
                              child: Text(
                                kRentRowLabel, // Label String.
                                // Styling the Label of the Row.
                                style: AppTheme.textTheme.titleMedium,
                              )),
                          // Listing the information in a row using ListView builder.
                          Expanded(
                            child: ListView.builder(
                                // Setting item count based on numbers of providers.
                                itemCount: data.rent!.length,
                                // Defining the scroll direction.
                                scrollDirection: Axis.horizontal,
                                // Building context.
                                itemBuilder: (context, index) {
                                  // Returing the list of Movies providers logo
                                  // and their corresponding names.
                                  return Container(
                                      // Setting Logo and label container margin.
                                      margin: EdgeInsets.symmetric(
                                          horizontal: kRowPadding),
                                      child: Column(children: [
                                        // Returing logo Container
                                        Container(
                                          // Provider's logo dimensions.
                                          height: kSizeOfLogo.height,
                                          width: kSizeOfLogo.width,
                                          // Decoration provider's logo container.
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      kLogoBorderRadius),
                                              // Fetching Network Image.
                                              image: DecorationImage(
                                                  filterQuality:
                                                      FilterQuality.high,
                                                  image: NetworkImage(data
                                                      .rent![index].logoPath),
                                                  fit: BoxFit.cover)),
                                        ),
                                        // Creating or displaying label underneath the logo.
                                        Text(data.rent![index].providerName,
                                            // styling the Label text.
                                            style:
                                                AppTheme.textTheme.titleMedium)
                                      ]));
                                }),
                          ),
                        ],
                      ))
                ] else ...[
                  // If Movie is not available for renting .
                  Padding(
                      padding: kRowLabelContainerPadding,
                      // Displaying unavailability for to rent.
                      child: Text(
                        "Not Available To Rent",
                        // Displaying Api Reponse message.
                        textAlign: TextAlign.center,
                        // Styling Information string.
                        style: AppTheme.textTheme.labelLarge,
                      ))
                ],
                // Also checking if the Movie is avaible for to rent.
                if (data.rent != null) ...[
                  SizedBox(
                      // Defining the height of the Row.
                      height: kRowHeight,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Creating the label of the row.
                            Padding(
                                // Setting padding to the row label.
                                padding: kRowLabelContainerPadding,
                                // Displaying Text using Text() widget.
                                child: Text(
                                  kBuyRowLabel, // 'Buy' label String.
                                  // Styling the Label String..
                                  style: AppTheme.textTheme.titleMedium,
                                )),
                            // // Building the list of the movie provider to buy.
                            Expanded(
                              child: ListView.builder(
                                  // Assinging the number of the movie providers.
                                  itemCount: data.buy!.length,
                                  // defining the scroll direction.
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    // Building and returns the context.
                                    return Container(
                                        // Buy provider's list container margin.
                                        margin: EdgeInsets.symmetric(
                                            horizontal: kRowPadding),
                                        // defining a column to layout the logo and its
                                        // label underneath.
                                        child: Column(children: [
                                          // Logo container.
                                          Container(
                                            // Configuring the logo dimensions
                                            height: kSizeOfLogo.height,
                                            width: kSizeOfLogo.width,
                                            // Decorating the Logo .
                                            decoration: BoxDecoration(
                                                // Setting logo border radius.
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        kLogoBorderRadius),
                                                // Decorating logo image.
                                                image: DecorationImage(
                                                    // Fetching logo though network image class.
                                                    image: NetworkImage(data
                                                        .buy![index].logoPath),
                                                    fit: BoxFit.cover)),
                                          ),
                                          // Displaying the row of the labels under the movie providers.
                                          Text(data.buy![index].providerName,
                                              // styling the label.
                                              style: AppTheme
                                                  .textTheme.titleMedium)
                                        ]));
                                  }),
                            )
                          ]))
                ]
                // Movie is not available to buy.
                else ...[
                  // Displaying unavailable Message.
                  Padding(
                      padding: kRowLabelContainerPadding,
                      // Creating or rendering text string.
                      child: Text(
                        "Not Available To Buy",
                        // Styling Message.
                        style: AppTheme.textTheme.labelLarge,
                      ))
                ]
              ]);
        }
        // If there is a Error in the snapshot then.
        else {
          print(
              "when snapshot wsnt workded so retunrs errir from the function");
          // Returing the Error message.
          return Center(
            child: Text(
              "Something Went Wrong!",
              // Styling error message.
              style: AppTheme.textTheme.displayLarge,
            ),
          );
        }
      },
    );
  }

// Overriding the dispose function.
  @override
  void dispose() {
    super.dispose();
    // Disposing _pageController.
    _pageController.dispose();
  }
}
