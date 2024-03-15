/// search.dart
///
/// The 'search.dart' file contains the UI design for the search panel screen.
/// it Provides the user interface to search for movies, poeple and tv shows.
/// This file Inculdes a single class 'SearchPanel' which extends the StateFulWidget class
/// and contains various functions and components necessary for enabling the search functionality
/// within the application.

/// Important essential packages required for the design.
import 'package:animate_do/animate_do.dart'; // Importing Animation package path.
import 'package:flutter/material.dart'; // Material design package.
import 'package:provider/provider.dart';
import 'package:streamx/pages/movie_details.dart';
import 'package:streamx/utils/api/api_service.dart';
import 'package:streamx/utils/custom_widgets.dart';
import 'package:streamx/utils/theme.dart'; // Importing utilities.

/// This statefulWidget class 'SearchPanel' is responsible for rendering an interface
/// that allow user to search for their favorite movies and tv shows.
/// It contains two major compononets:
/// [1] A textfeild to type keyword in.
/// [2] A panel to display searched keyword results.
/// Returns: [scaffold] widget to struct layout of the screen.
/// Parameters: [key].
class SearchPanel extends StatefulWidget {
  // Defining class constructor.
  const SearchPanel({super.key});
  // Overriding createState method.
  @override
  // Creating class state.
  SearchPanelState createState() => SearchPanelState();
}

// Defining class state named 'SearchPanelState'.
class SearchPanelState extends State<SearchPanel> {
  // boolean flags to determine textfeild focus modes.
  bool isFocused = true; // Determines if textFeild is in focus.
  bool isEmptyField = true; // keep account if textfield is empty.
  // Creating TextEditingController Instance.
  final TextEditingController _textEditingController = TextEditingController();
  // Defining future object to store list of upComing movies.
  @override // Overriding build() method.
  Widget build(BuildContext context) {
    // Returning context.
    return Scaffold(
        // Setting scaffold background color to Color role 'background'.
        backgroundColor: Theme.of(context).colorScheme.background,
        // Defining body of the Scaffold.
        // Laying out body of scaffold into vertical list view using CustomScrollView.
        body: CustomScrollView(
            // Defining Keyboard behaviour.
            // It close the keyboard onDrag on the screen.
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            slivers: [
              sliverAppBar(), // Renders search textField.
              upComingMoviesRow(),
              SliverToBoxAdapter(
                  child: isEmptyField
                      ? null
                      : movieSearchResultViewer(
                          keyword: _textEditingController.text)),
              SliverToBoxAdapter(
                  child: isEmptyField
                      ? null
                      : tvShowSearchResultViewer(
                          keyword: _textEditingController.text))
            ]));
  }

  /// The function named 'sliverAppBar' responsible for to display search textfield in the screen.
  /// where user can type keyword to search for movies, tvshows and people profile.
  /// Returns: [SliverAppBar] that contains search TextField.
  /// Parameter: none.
  SliverAppBar sliverAppBar() {
    return // Rendering Medium sized sliverAppBar.
        SliverAppBar.medium(
      // placing textfeild in the bottom of sliverAppBar.
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(0), // Setting Preferred Size.
        // Containing textfeild into Sized container.
        child: Container(
            // Setting Container child's Alignment.
            alignment: Alignment.center,
            // Adding pdding to the child container.
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            // Setting container margin.
            margin: EdgeInsets.only(bottom: 8.0),
            // Decoration textfeild using container.
            child: Container(
              // Padding to the textfeild.
              padding: EdgeInsets.all(4.0),
              // Decorating Textfeild container.
              decoration: BoxDecoration(
                // TextFeild container border radius.
                borderRadius: BorderRadius.circular(28),
                // Setting color to the textfeild container.
                color: Provider.of<ThemeProvider>(context).getThemeData ==
                        AppTheme.darkMode
                    ? AppTheme.extraColorsDark.surfaceContainerHigh
                    : AppTheme.extraColorsLight.surfaceContainerHigh,
              ),
              // Setting height of the textfeild.
              height: 56,
              // Adding animation to the Textfeild to slideInRight.
              child: SlideInRight(
                // Setting animation duration.
                duration: Durations.long2,
                // Defining TextField using TextField widget as a child of
                // SlideInRight's child.
                child: TextField(
                  // Setting auto focus to true so that when user gets navigates
                  // to searchpanel screen, keyboard can be displayed automatically.
                  autofocus: true,
                  // Assigning Textcontroller to the textfield.
                  controller: _textEditingController,
                  // Configuring onTap behaviour on textfield.
                  onTap: () {
                    // on Tapping on textfield, updating the state of
                    // isFocused only if foxused is not true.
                    if (!isFocused) setState(() => isFocused = true);
                  },
                  // Setting isFocused to false if user tap outside the textfeild.
                  onTapOutside: (event) {
                    if (isFocused) setState(() => isFocused = !isFocused);
                  },
                  // On anyChange to the textfield, checking if textfeild is empty.
                  onChanged: (value) {
                    setState(() => isEmptyField = value.isEmpty);
                  },
                  // Decorating Textfeild input.
                  decoration: InputDecoration(
                      // Creating a prefix iconButton allow user to navigate to previous screen.
                      prefixIcon: IconButton(
                          // Adding tooltip to the prefix icon in the textfield.
                          tooltip: 'Go Back Button',
                          // Adding focus node to the IconButton.
                          focusNode: FocusNode(),
                          // Invoking on pressed action.
                          onPressed: () {
                            // Triggering context pop() function.
                            Navigator.of(context).pop();
                          },
                          // Adding IconData to the IconButton.
                          icon: Icon(Icons.arrow_back_rounded)),
                      // Displaying conditional suffixIcon button.
                      /// It displays the clear named icon using to clear input from the
                      /// textfield. if their isnt any text in the textfield it returns nothing.
                      /// we using isEmptyField flag to keep track to the textfield input.
                      suffixIcon: isEmptyField
                          ? null // returning null if their isnt any text.
                          : IconButton(
                              // Returing clear iconButton,
                              onPressed: () {
                                // OnClick on the clear button is clears out textfield.
                                _textEditingController.clear();
                                // And updating isEmptyflag.
                                setState(() {
                                  isEmptyField = true;
                                });
                              },
                              // Setting icon in the IconButton.
                              icon: Icon(Icons.clear)),
                      // Displaying Textfield hint text.
                      hintText: 'Search here...',
                      // styling hintTextStyle.
                      hintStyle: AppTheme.textTheme.bodyLarge,
                      // Setting default Border to none.
                      border: InputBorder.none),
                ),
              ),
            )),
      ),
      // Disabling auto back button rendering.
      automaticallyImplyLeading: false,
      // Setting app bar float behaviour to true.
      floating: true,
    );
  }

  /// This function returns the upcoming movies. It was definied here to provide
  /// preRendered default row in the result panel to facilite user with the upComing
  /// content. Returns: [SliverToBoxAdaptor] that adapts the row of upcoming movies.
  /// Parameters: none.
  SliverToBoxAdapter upComingMoviesRow() {
    const kRowTitle = "UpComing Movies";
    return SliverToBoxAdapter(
        child: CustomFutureBuilder(
            future: TMDBMovies.upcomingMovies(),
            whileProcessing: LinearProgressIndicator(),
            whenHasData: (data) {
              return PosterRowGenerator(
                  title: kRowTitle,
                  itemCount: data.length,
                  poster: (index) {
                    return Poster(
                        posterPath: data[index].posterPath,
                        navigateTo: MovieDetailsViewer(object: data[index]));
                  });
            }));
  } // upComingMovieRow() close.

  /// movieSearchResultViewer function was defined to render result from
  /// movies api using keyword privided inside the textfield.
  /// This function requires the keyword to return results accordingly.
  /// Retunrs: [CustomFutureViewer] that returns resuls based on data recieved from
  /// api request made.
  /// Parameters: [keyword] is of type string required to enable search on.
  Widget movieSearchResultViewer({required String keyword}) {
    const kRowTitle = "Movies Results";
    // Returning CustomFutureBuilder.
    return CustomFutureBuilder(
        // Assigning LinearProgressIndicator.
        whileProcessing: LinearProgressIndicator(),
        // Fetching Data from searchMovies()
        future: TMDBMovies.searchMovies(keyword: keyword),
        // Defining Behaviour or Layout of the Results to the be render when snapShot has data.
        onDataEmpty: Container(),
        whenHasNull: Container(),
        whenHasData: (data) {
          // Returing Result and displaying in the Row.
          return PosterRowGenerator(
              title: kRowTitle,
              // Providing the length of items in row.
              itemCount: data.length,
              // Passing the Poster Widget as a function of type widget, which provides the index from
              // PosterRowGenerator.
              poster: (iterator) {
                return Poster(
                    // Rendering Poster for each movie in the data.
                    posterPath: data[iterator].posterPath,
                    // Providing navigation for the each movie in data list.
                    navigateTo: MovieDetailsViewer(object: data[iterator]));
              });
        });
  } // movieSearchResultViewer() close.

  /// Function named as 'tvShowSearchResultViewer' returns the results obtained
  /// by searching keyword passed inside this function. Returns:
  /// [CustomFuturebuilder] that returns results in a row.
  /// Parameters: [keyword] is of type string required to enable search on.
  Widget tvShowSearchResultViewer({required String keyword}) {
    const kRowTitle = "TV shows Results";
    // Returing CustomFutureBuilder.
    return CustomFutureBuilder(
        // Assigning searchTvShows future List of tvshows provider function.
        future: TMDBTvShows.searchTVShows(keyword: keyword),
        // Passing LinearProcessIndicator.
        whileProcessing: LinearProgressIndicator(),
        // Structuring results into row when snapshot has data.
        onDataEmpty: Container(),
        whenHasNull: Container(),
        whenHasData: (data) {
          return PosterRowGenerator(
              title: kRowTitle,
              // Setting Item length.
              itemCount: data.length,
              // Passing index in the poster function to return each poster from data.
              poster: (iterator) {
                // Returning poster.
                return Poster(
                    // Displaying poster.
                    posterPath: data[iterator].posterPath,
                    navigateTo: Container());
              });
        });
  } // tvShowSearchResultViewer() close.

  @override // Overriding dispose() method.
  void dispose() {
    // disposing class key.
    super.dispose();
    // Disposing TextEditingController String.
    _textEditingController.dispose();
  }
}
