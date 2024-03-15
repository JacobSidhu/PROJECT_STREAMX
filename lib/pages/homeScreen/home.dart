/// home.dart
///
/// This dart file was create to contains the UI design for the homeTab within
/// the HomeScreen which serves as the base UI Screen for other pages.
/// It includes common functionalities and introductions to other available features
/// within the application, providing a central hub for users to navigate through
/// different sections and explore content.

// Essential Importations required for the UI design.
import 'package:flutter/material.dart'; // Material design package.
// Carousel slider package to import carousel_slider api class.
import 'package:carousel_slider/carousel_slider.dart';
import 'package:streamx/pages/all_categories.dart';
import 'package:streamx/pages/homeScreen/search.dart';
import 'package:streamx/pages/movie_details.dart';
import 'package:streamx/utils/api/api_service.dart'; // Importing Api services.
// Importing utilities required for the design implementation.
import 'package:streamx/utils/custom_widgets.dart'; // constant methods.
import 'package:streamx/utils/const_values.dart'; // constant values.
import 'package:streamx/utils/theme.dart'; // Theme for application.

/// Stateful widget class named 'HomePage' is a page within the pageview in HomeScreen class.
/// The class constructor only requires the key it returns the UI design for homeTab that
/// contains the methods and services to navigate to the other functionalities
/// within the application it provides the broad overview of the application functionalities.
class HomePage extends StatefulWidget {
  // Creating class contructor with super key.
  const HomePage({super.key});
  @override // Overriding the createState function.
  // Creating the HomePage State.
  HomePageState createState() => HomePageState();
}

// Defining the HomePageState class.
class HomePageState extends State<HomePage> {
  // Declaring varibale of type Future to fetch nullable List of MovieData.
  late Future<List<MovieData>?> popular;
  // Overriding the initState function.
  @override
  void initState() {
    super.initState();
    // Initializing the popular variable with popularMovies function.
    popular = TMDBMovies.popularMovies();
  }

  // Overriding the abstract build method.
  @override
  Widget build(BuildContext context) {
    // Returing Scaffold Widget.
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Various UI components in the Home Page.
          suggestButtonRow(), // Renders the buttons horizontal list.
          carouselSlider(), // Displays the carousel slider.
          top10TrendingShows(), // Displays the 10 ten trending tv show.s
          tvShowPagePrompt(), // Promptes the user to
          moviesRowsSection1(),
          profileSearchPrompt(),
          moviesRowsSection2(),
          myListPrompt(),
        ],
      ),
    );
  }

  /// This function contains the horizontal ribbon of the suggestion
  /// button. It renders the buttons list using ListView.builder() method
  /// Returns: [SliverToBoxAdaptor] that adapts the buttons list.
  /// Parameters: none.
  SliverToBoxAdapter suggestButtonRow() {
    // List of Constant used within the function.
    const double kRowContainerHeight = 60.0; // Buttons container height.
    const EdgeInsets kButtonPadding = EdgeInsets.all(8.0);
    // Defining the suggestion buttons in the homePage.
    const List<String> kSuggestionButtonLabel = [
      'All Categories',
      'Trending Shows',
      'Discover',
      'TopRated Shows',
    ];

    // Returing sliver adapted list of buttons.
    return SliverToBoxAdapter(
        // Containing button in sized row.
        child: SizedBox(
      height: kRowContainerHeight, // Setting height of row container.
      child: ListView.builder(
          // Adding list stretch bounce effect.
          physics: BouncingScrollPhysics(),
          // Changing scroll direction.
          scrollDirection: Axis.horizontal,
          // Defining the number of items to generate in list.
          itemCount: kSuggestionButtonLabel.length,
          // Building context.
          itemBuilder: (context, index) {
            // Returning padded button.
            return Padding(
              padding: kButtonPadding, // setting padding value.
              // Using outlinedButton to Create buttons.
              child: OutlinedButton(
                  // Defining on pressed functionality.
                  onPressed: () {
                    if (index == 0) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AllCategories()));
                    }
                  },
                  // Labeling each button.
                  child: Text(kSuggestionButtonLabel[index])),
            );
          }),
    ));
  } // suggestButtonRow close.

  /// This carouselSlider function was defined to create render infinite poster
  /// slider in the homescreen. Returns: the careouselSlider widget.
  /// Parameters: none.
  Widget carouselSlider() {
    return SliverToBoxAdapter(
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: FutureBuilder(
                future: popular,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Custom.processIndicator(context: context);
                  } else if (snapshot.hasData) {
                    List<MovieData> movies = snapshot.data!;
                    return CarouselSlider.builder(
                        itemCount: movies.length,
                        itemBuilder: (BuildContext context, index, realIndex) {
                          return SizedBox(
                              width: 360,
                              child: Poster(
                                  posterPath: movies[index].posterPath,
                                  navigateTo: MovieDetailsViewer(
                                      object: movies[index])));
                        },
                        options: CarouselOptions(
                            viewportFraction: 0.7,
                            autoPlay: true,
                            height: 420,
                            enlargeCenterPage: true));
                  } else if (snapshot.data == null) {
                    return Text("Slider is Not Available",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.error));
                  } else {
                    return Text("Something Went Wrong",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.error));
                  }
                })));
  }

  SliverToBoxAdapter top10TrendingShows() {
    const int kNumberOfPosters = 10;
    const String kHeadlineString = "Top 10 Trending Shows";
    const String kSupportingText = "Top 10 Trending shows in United Kingdom";
    const EdgeInsets kContainerPadding = EdgeInsets.symmetric(vertical: 20);
    const EdgeInsets kTitleContainerPadding = EdgeInsets.all(10);
    return SliverToBoxAdapter(
      child: Container(
          padding: kContainerPadding,
          width: double.infinity,
          color: Theme.of(context).colorScheme.surface,
          child: Column(children: [
            Container(
                padding: kTitleContainerPadding,
                alignment: Alignment.center,
                child: Text(kHeadlineString,
                    textAlign: TextAlign.center,
                    style: AppTheme.textTheme.titleLarge)),
            Container(
                padding: kTitleContainerPadding,
                alignment: Alignment.center,
                child: Text(kSupportingText,
                    textAlign: TextAlign.center,
                    style: AppTheme.textTheme.bodySmall)),
            CustomFutureBuilder(
                future: TMDBTvShows.topRated(),
                whenHasData: (data) {
                  return PosterRowGenerator(
                      isTitle: false, // Disabling title
                      itemCount: data.length > kNumberOfPosters
                          ? kNumberOfPosters
                          : data.length,
                      poster: (index) {
                        return Poster(
                            posterPath: data[index].posterPath,
                            navigateTo: Container());
                      });
                })
          ])),
    );
  }

  /// This function creates a section of rows that contains three to four rows of
  /// different types. Retunrs [SliverToBoxApdater] that adapts the list of PosterRows.
  /// Parameters: none.
  SliverToBoxAdapter moviesRowsSection1() {
    // Retuning SliverToBoxAdapter.
    // Numbers of rows.
    const int kActionGenreIDs = 28;
    const int kSciFiGenreIDs = 878;
    const int kHorrorGenreIDs = 27;
    const String kRowTitle1 = "Best in action";
    const String kRowTitle2 = "Just For Sci Fi Lovers";
    const String kRowTitle3 = "Unlock your fear";

    return SliverToBoxAdapter(
        child: Column(
      children: [
        // Defining CustomFutureBuilder.
        CustomFutureBuilder(
            future: TMDBMovies.moviesByGenreId(genreID: kActionGenreIDs),
            whenHasData: (data) {
              // Returing PosterRowGenerator.
              return PosterRowGenerator(
                  title: kRowTitle1,
                  itemCount: data.length,
                  poster: (index) {
                    return Poster(
                        posterPath: data[index].posterPath,
                        navigateTo: MovieDetailsViewer(object: data[index]));
                  });
            }),
        // Future builder for Second row.
        CustomFutureBuilder(
            future: TMDBMovies.moviesByGenreId(genreID: kSciFiGenreIDs),
            whenHasData: (data) {
              return PosterRowGenerator(
                  title: kRowTitle2,
                  itemCount: data.length,
                  poster: (index) {
                    return Poster(
                        posterPath: data[index].posterPath,
                        navigateTo: MovieDetailsViewer(object: data[index]));
                  });
            }),
        // Future builder for third row.
        CustomFutureBuilder(
            future: TMDBMovies.moviesByGenreId(genreID: kHorrorGenreIDs),
            whenHasData: (data) {
              return PosterRowGenerator(
                  title: kRowTitle3,
                  itemCount: data.length,
                  poster: (index) {
                    return Poster(
                        posterPath: data[index].posterPath,
                        navigateTo: MovieDetailsViewer(object: data[index]));
                  });
            })
      ],
    ));
  }

  /// This function creates a section of rows that contains three to four rows of
  /// different types. Retunrs [SliverToBoxApdater] that adapts the list of PosterRows.
  /// Parameters: none.
  SliverToBoxAdapter moviesRowsSection2() {
    // Retuning SliverToBoxAdapter.
    // Numbers of rows.
    const int kMysteryGenreIDs = 9648;
    const int kWarGenreIDs = 10752;
    const int kCrimeGenreIDs = 80;
    return SliverToBoxAdapter(
        child: Column(
      children: [
        CustomFutureBuilder(
            future: TMDBMovies.moviesByGenreId(genreID: kMysteryGenreIDs),
            whenHasData: (data) {
              return PosterRowGenerator(
                  title: "Mystery",
                  itemCount: data.length,
                  poster: (index) {
                    return Poster(
                        posterPath: data[index].posterPath,
                        navigateTo: MovieDetailsViewer(object: data[index]));
                  });
            }),
        CustomFutureBuilder(
            future: TMDBMovies.moviesByGenreId(genreID: kCrimeGenreIDs),
            whenHasData: (data) {
              return PosterRowGenerator(
                  title: "Crime Scenes",
                  itemCount: data.length,
                  poster: (index) {
                    return Poster(
                        posterPath: data[index].posterPath,
                        navigateTo: MovieDetailsViewer(object: data[index]));
                  });
            }),
        CustomFutureBuilder(
            future: TMDBMovies.moviesByGenreId(genreID: kWarGenreIDs),
            whenHasData: (data) {
              return PosterRowGenerator(
                  title: "War",
                  itemCount: data.length,
                  poster: (index) {
                    return Poster(
                        posterPath: data[index].posterPath,
                        navigateTo: MovieDetailsViewer(object: data[index]));
                  });
            })
      ],
    ));
  }

  /// This function renders the layout of for my list.
  /// it is a suggestion and way to navigate to the my list.
  /// Return [SliverToBoxAdaptor] that adapts the layout.
  SliverToBoxAdapter myListPrompt() {
    const String kButtonLabel = "Open Now";
    const String kContainerHeading = "My List";
    const EdgeInsets kContainerPadding = EdgeInsets.all(10);
    const double kContainerHeight = 400;
    const Alignment kMiddleContainerAlignment = Alignment(0, -0.6);
    const Alignment kFirstContainerAlignment = Alignment(0, 0.2);
    const Alignment kLastContainerAlignment = Alignment(0, -1.0);
    const Size kFirstContainer = Size(340, 180);
    const Size kMiddleContainer = Size(300, 180);
    const Size kLastContainer = Size(260, 180);

    // Returing Layout.

    return SliverToBoxAdapter(
        child: Container(
            padding: kContainerPadding,
            height: kContainerHeight,
            child: Column(children: [
              Container(
                padding: kContainerPadding,
                child: Text(kContainerHeading,
                    textAlign: TextAlign.center,
                    style: AppTheme.textTheme.displayLarge),
              ),
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  child: Stack(children: [
                    Align(
                      alignment: kLastContainerAlignment,
                      child: Transform.rotate(
                        angle: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Theme.of(context).colorScheme.outline),
                            color: Color.fromARGB(255, 2, 235, 56),
                            image: DecorationImage(
                                image: AssetImage(LocalImages.kSimpson),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          width: kLastContainer.width,
                          height: kLastContainer.height,
                        ),
                      ),
                    ),
                    Align(
                      alignment: kMiddleContainerAlignment,
                      child: Transform.rotate(
                        angle: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Theme.of(context).colorScheme.outline),
                            image: DecorationImage(
                                image: AssetImage(LocalImages.kposterThumnail1),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.red,
                          ),
                          width: kMiddleContainer.width,
                          height: kMiddleContainer.height,
                        ),
                      ),
                    ),
                    Align(
                      alignment: kFirstContainerAlignment,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Theme.of(context).colorScheme.outline),
                          image: DecorationImage(
                              image: AssetImage(LocalImages.kposterThumnail2),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Color.fromARGB(255, 0, 77, 244),
                        ),
                        width: kFirstContainer.width,
                        height: kFirstContainer.height,
                      ),
                    ),
                  ]),
                ),
              ),
              Custom.buttonContainer(
                  button:
                      FilledButton(onPressed: () {}, child: Text(kButtonLabel)))
            ])));
  }

  /// Function names "tvShowPagePrompt" the layout to navigate to the tv tab
  /// Returns: [SliverToBoxAdaptor] that contains the layout.
  /// Parameters: none.
  SliverToBoxAdapter tvShowPagePrompt() {
    const String kHeading = " What's on TV Tonight?";
    const String kButtonLabel = "CHECK IT OUT";
    const double kContainerHeight = 360;
    const EdgeInsets kContainerPadding = EdgeInsets.all(10);
    const EdgeInsets kContainerMargin = EdgeInsets.all(10);
    const Size kThumbnailSize = Size(200, 120);
    const double kThumnailContainerBorderRadius = 10;
    return SliverToBoxAdapter(
        child: Container(
      margin: kContainerMargin,
      height: kContainerHeight,
      child: Column(
        children: [
          Container(
            padding: kContainerPadding,
            child: Text(kHeading,
                textAlign: TextAlign.center,
                style: AppTheme.textTheme.displaySmall),
          ),
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: Stack(children: [
                Align(
                  alignment: Alignment(0.6, -0.4),
                  child: Transform.rotate(
                    angle: 0.1,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Theme.of(context).colorScheme.outline),
                        image: DecorationImage(
                            image: AssetImage(LocalImages.kBestShowsPoster),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.all(
                            Radius.circular(kThumnailContainerBorderRadius)),
                      ),
                      width: kThumbnailSize.width,
                      height: kThumbnailSize.height,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(-0.6, -0.4),
                  child: Transform.rotate(
                    angle: -0.1,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Theme.of(context).colorScheme.outline),
                        image: DecorationImage(
                            image: AssetImage(LocalImages.kFireCountry),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.all(
                            Radius.circular(kThumnailContainerBorderRadius)),
                      ),
                      width: kThumbnailSize.width,
                      height: kThumbnailSize.height,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0, 0.3),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Theme.of(context).colorScheme.outline),
                      image: DecorationImage(
                          image: AssetImage(LocalImages.kSimpson),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.all(
                          Radius.circular(kThumnailContainerBorderRadius)),
                    ),
                    width: kThumbnailSize.width,
                    height: kThumbnailSize.height,
                  ),
                ),
              ]),
            ),
          ),
          Custom.buttonContainer(
              button: FilledButton(onPressed: () {}, child: Text(kButtonLabel)))
        ],
      ),
    ));
  }

  /// This Function prompt the user with search button to
  /// search for the people profiles. Returns: [SliverToBoxAdapter].
  /// Parameters: none.
  SliverToBoxAdapter profileSearchPrompt() {
    const String kHeadlineString = "People Profiles";
    const String kSupportingText = "Search for you favourite person";
    const String kButtonLabel = "Search Now";
    const EdgeInsets kButtonPadding = EdgeInsets.symmetric(vertical: 20);
    const Size kCenteredImageSize = Size(260, 400);
    const Size kSideImageSize = Size(60, 300);
    const double kContainerRadius = 20.0;
    const EdgeInsets kTitleContainerPadding = EdgeInsets.all(10);
    const EdgeInsets kSupportingTextPadding = EdgeInsets.only(bottom: 20);
    return SliverToBoxAdapter(
        child: Column(children: [
      Container(
          padding: kTitleContainerPadding,
          alignment: Alignment.center,
          child: Text(kHeadlineString,
              textAlign: TextAlign.center,
              style: AppTheme.textTheme.displayMedium)),
      Container(
          padding: kSupportingTextPadding,
          alignment: Alignment.center,
          child: Text(kSupportingText,
              textAlign: TextAlign.center,
              style: AppTheme.textTheme.bodyMedium)),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // This container diaplays image at the Left side.
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(kContainerRadius),
                      bottomRight: Radius.circular(kContainerRadius)),
                  image: DecorationImage(
                      image: AssetImage(LocalImages.kpeopleThumnail1),
                      fit: BoxFit.cover)),
              height: kSideImageSize.height,
              width: kSideImageSize.width),

          Container(
              decoration: BoxDecoration(
                  border:
                      Border.all(color: Theme.of(context).colorScheme.outline),
                  borderRadius: BorderRadius.circular(kContainerRadius),
                  image: DecorationImage(
                      image: AssetImage(LocalImages.kpeopleThumnail2),
                      fit: BoxFit.cover)),
              height: kCenteredImageSize.height,
              width: kCenteredImageSize.width),
          // This container diaplays image at the right side.
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(kContainerRadius),
                      bottomLeft: Radius.circular(kContainerRadius)),
                  image: DecorationImage(
                      image: AssetImage(LocalImages.kpeopleThumnail3),
                      fit: BoxFit.cover)),
              height: kSideImageSize.height,
              width: kSideImageSize.width)
        ],
      ),
      // This button is the filled button that navigate to the search pannel
      Padding(
          padding: kButtonPadding,
          child: Custom.buttonContainer(
              button: FilledButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SearchPanel()));
                  },
                  child: Text(kButtonLabel))))
    ]));
  }
}
