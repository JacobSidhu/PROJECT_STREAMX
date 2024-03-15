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
    return Scaffold();
  }
}
