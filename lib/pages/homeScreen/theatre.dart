// /// theatre.dart
// ///
// /// File 'theatre.dart' contains the UI interface for the application for display
// /// currently playing movies in the theatres, This file serves as the UI page to be used
// /// inside HomeScreen Pageview. It has only one Class named as 'TheatrePage' that
// /// extends with the StatelessWidget.

// /// Importing essential packages and uitilities needed for the implementation of this design.
// import 'package:flutter/material.dart'; // Material design package.
// import 'package:streamx/pages/movie_details.dart';
// import 'package:streamx/utils/api/api_service.dart';
// import 'package:streamx/utils/const_methods.dart';
// import 'package:streamx/utils/theme.dart'; // Importing essential utilities.

// class TheatrePage extends StatelessWidget {
//   const TheatrePage({super.key});
//   @override // overriding abstract build method.
//   // Defining implementation of the build method.
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [pageHeading(context: context), currenltyPlayMoviesGrid()],
//       ),
//     );
//   }

//   /// Function render the headline and time line of the movies in the Theatre.
//   /// This function using the api to fetch time period for the movies in the theatre.
//   /// Returns: [Container] that contains the headline.
//   /// Parameters: [context] to style textLabels based on context theme.
//   Container pageHeading({required BuildContext context}) {
//     // constant padding to the heading container child.
//     const EdgeInsets kPadding = EdgeInsets.all(10.0);
//     const String kHeadline = "Currently In Theatres";
//     // Returing Container containing Text() widget.
//     return Container(
//       // Adding padding to the container child.
//       padding: kPadding,
//       // Structuring Headline String and Timeline in column layout.
//       child: Text(kHeadline,
//           // Styling Headline String.
//           style: AppTheme.textTheme(context: context).textTheme.headlineLarge),
//     );
//   } // pageHeading() close.

//   /// This function returns the grid view of the posters. It uses PosterGridGenerator
//   /// to list the posters in the grid view. Returns: [] that generates list
//   /// of posters in grid view. Parameters: none.
//   Widget currenltyPlayMoviesGrid() {
//     // constant values.
//     const EdgeInsets kDatesMargin = EdgeInsets.all(4.0);
//     const String kDatesPlaceHolder = "Dates were not specified";
//     // Returing Custom PosterGridGenerator inside the CustomFutureBuilder.
//     return FutureBuilder(
//         future: TMDBMovies.currentlyInTheatres(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Custom.processIndicator(context: context);
//           } else if (snapshot.data == null) {
//             return Center(child: Text(TMDBAPIManager.kDataNotFound));
//           } else if (snapshot.hasData) {
//             TheatreData data = snapshot.data!;
//             return Column(
//               children: [
//                 if (data.maxDate != null && data.minDate != null) ...[
//                   Container(
//                       margin: kDatesMargin,
//                       child: Text(
//                         "From ${data.minDate} till ${data.maxDate}",
//                         style: AppTheme.textTheme(context: context)
//                             .textTheme
//                             .bodySmall,
//                       ))
//                 ] else ...[
//                   Container(
//                       margin: kDatesMargin,
//                       child: Text(
//                         kDatesPlaceHolder,
//                         style: AppTheme.textTheme(context: context)
//                             .textTheme
//                             .bodySmall,
//                       ))
//                 ],
//                 if (data.movies != null) ...[
//                   GridView.builder(
//                       itemCount: data.movies!.length,
//                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                           crossAxisCount: 3),
//                       itemBuilder: (context, index) {
//                         return Poster(
//                             posterPath: data.movies![index].posterPath,
//                             navigateTo: MovieDetailsViewer(
//                                 object: data.movies![index]));
//                       })
//                 ] else ...[
//                   Center(
//                       child: Text(TMDBAPIManager.kDataNotFound,
//                           textAlign: TextAlign.center,
//                           style: AppTheme.textTheme(context: context)
//                               .textTheme
//                               .headlineLarge))
//                 ]
//               ],
//             );
//           } else {
//             return Center(
//                 child: Text(TMDBAPIManager.kSomethingWrong,
//                     textAlign: TextAlign.center,
//                     style: AppTheme.textTheme(context: context)
//                         .textTheme
//                         .headlineLarge));
//           }
//         });
//   }
// }
