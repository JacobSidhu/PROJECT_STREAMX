/// movies.dart
///
/// This file contains the uI design of the movies page within the HomeScreen
/// This movies page only contains the different types of movies isolated from
/// the TV shows. This fill contains the MoviePage class that has many function
/// those are the building UI components of the Movie page page.

/// Importing essesntial packages and utilities.
import 'package:flutter/material.dart';
import 'package:streamx/pages/movie_details.dart';
import 'package:streamx/utils/api/api_service.dart';
import 'package:streamx/utils/custom_widgets.dart';
import 'package:streamx/utils/theme.dart';

/// This class encapsulates the all UI components. It is a StatefulWidget class
/// it retunrs the build() from the StatefulWidget class.
class MoviePage extends StatefulWidget {
  // Defining class constructor.
  const MoviePage({super.key});
  // Overriding the CreateState() function to create state.
  @override
  MoviePageState createState() => MoviePageState();
}

// Defining the MoviePage State.
class MoviePageState extends State<MoviePage> {
  final Future<List<Genre>?> genreList = TMDBMovies.genres();

  @override // Overriding build function.
  Widget build(BuildContext context) {
    // Returning scaffold Widget.
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: listOfPosterRowsLists());
  }

  /// This function renders the list of poster row based on all categories.
  /// Returns [CustomFutureBuilder] that returns the list of poster rows if snapshot has got data.
  /// Parameters: none.
  Widget listOfPosterRowsLists() {
    // Error message to display when data not found.
    const String kErrorOnListEmpty = "No data Found";

    // building future context.
    return CustomFutureBuilder(
        future: genreList, // Future genre list.
        whenHasNull: Container(
          color: Theme.of(context)
              .colorScheme
              .surface, // Error message container color.
          child: Text(TMDBAPIManager.kDataNotFound,
              // Styling message.
              style: AppTheme.textTheme.displaySmall),
        ),
        onDataEmpty:
            Text(kErrorOnListEmpty, style: AppTheme.textTheme.displaySmall),
        whenHasData: (genreListData) {
          // Returing list of poster rows.
          return Expanded(
            child: ListView.builder(
                physics: BouncingScrollPhysics(),
                // Numbers of list to build.
                itemCount: genreListData.length,
                itemBuilder: (context, index) {
                  // Building Poster Rows.
                  return CustomFutureBuilder(
                      // Returing movie list by genre id.
                      future: TMDBMovies.moviesByGenreId(
                          genreID: genreListData[index].id),
                      // If Genre List would not for specific categories, then returning
                      // empty.
                      onDataEmpty: Container(),
                      whenHasNull: Container(),
                      // When snapshot has got data.
                      whenHasData: (movieData) {
                        // Generating poster row.
                        return PosterRowGenerator(
                            title: genreListData[index].name,
                            itemCount: genreListData.length,
                            poster: (index) {
                              // Returing custom poster in the list.
                              return Poster(
                                  posterPath: movieData[index].posterPath,
                                  navigateTo: MovieDetailsViewer(
                                      object: movieData[index]));
                            });
                      });
                }),
          );
        });
  }
}
