/// home.dart
///
/// This dart file was create to contains the UI design for the homeTab within
/// the HomeScreen which serves as the base UI Screen for other pages.
/// It includes common functionalities and introductions to other available features
/// within the application, providing a central hub for users to navigate through
/// different sections and explore content.

// Essential Importations required for the UI design.
import 'package:flutter/cupertino.dart';
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
      
        ],
      ),
    );
  }

  