/// theatre.dart
///
/// File 'theatre.dart' contains the UI interface for the application for display
/// currently playing movies in the theatres, This file serves as the UI page to be used
/// inside HomeScreen Pageview. It has only one Class named as 'TheatrePage' that
/// extends with the StatelessWidget.

/// Importing essential packages and uitilities needed for the implementation of this design.
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'; // Material design package.
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:streamx/pages/movie_details.dart';
import 'package:streamx/utils/api/api_service.dart';
import 'package:streamx/utils/custom_widgets.dart';
import 'package:streamx/utils/theme.dart'; // Importing essential utilities.

class TheatrePage extends StatelessWidget {
  const TheatrePage({super.key});
  @override // overriding abstract build method.
  // Defining implementation of the build method.
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          pageHeading(context: context),
          currenltyPlayMoviesGrid(context: context)
        ],
      ),
    );
  }

  /// Function render the headline and time line of the movies in the Theatre.
  /// This function using the api to fetch time period for the movies in the theatre.
  /// Returns: [Container] that contains the headline.
  /// Parameters: [context] to style textLabels based on context theme.
  Container pageHeading({required BuildContext context}) {
    // constant padding to the heading container child.
    const EdgeInsets kPadding = EdgeInsets.symmetric(horizontal: 10.0);
    const String kHeadline = "Currently In Theatres";
    // Returing Container containing Text() widget.
    return Container(
      // Adding padding to the container child.
      padding: kPadding,
      // Structuring Headline String and Timeline in column layout.
      child: Text(kHeadline,
          // Styling Headline String.
          style: AppTheme.textTheme.titleMedium),
    );
  } // pageHeading() close.

  /// This function returns the grid view of the posters. It uses PosterGridGenerator
  /// to list the posters in the grid view. Returns: [SingleChildScrollView] that generates list
  /// of posters in grid view. Parameters: none.
  Widget currenltyPlayMoviesGrid({required BuildContext context}) {
    // constant values.
    const String kDatesPlaceHolder = "Dates were not specified";
    const EdgeInsets kPadding = EdgeInsets.all(10.0);
    // Returing Custom PosterGridGenerator inside the CustomFutureBuilder.
    return SingleChildScrollView(
      child: FutureBuilder(
          future: TMDBMovies.currentlyInTheatres(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Custom.processIndicator(context: context);
            } else if (snapshot.data == null) {
              return Center(child: Text(TMDBAPIManager.kDataNotFound));
            } else if (snapshot.hasData) {
              String? maxDate = snapshot.data!.maxDate;
              String? minDate = snapshot.data!.minDate;
              List<MovieData>? movies = snapshot.data!.movies;
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (maxDate != null && minDate != null) ...[
                    Container(
                      padding: kPadding,
                      child: Text(
                        "From $minDate till $maxDate",
                        style: AppTheme.textTheme.bodySmall,
                      ),
                    )
                  ] else ...[
                    Text(
                      kDatesPlaceHolder,
                      style: AppTheme.textTheme.bodySmall,
                    )
                  ],
                  if (movies != null) ...[
                    SizedBox(
                      height: MediaQuery.of(context).size.height - 209,
                      child: AnimationLimiter(
                        child: GridView.builder(
                            physics: BouncingScrollPhysics(),
                            itemCount: 18,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
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
                                          posterPath: movies[index].posterPath,
                                          navigateTo: MovieDetailsViewer(
                                            object: movies[index],
                                          )),
                                    ),
                                  ));
                            }),
                      ),
                    )
                  ] else ...[
                    Center(
                        child: Text(TMDBAPIManager.kDataNotFound,
                            textAlign: TextAlign.center,
                            style: AppTheme.textTheme.headlineLarge))
                  ]
                ],
              );
            } else {
              return Center(
                  child: Text(TMDBAPIManager.kSomethingWrong,
                      textAlign: TextAlign.center,
                      style: AppTheme.textTheme.headlineLarge));
            }
          }),
    );
  }
}
