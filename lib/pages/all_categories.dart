import 'package:flutter/material.dart';
import 'package:streamx/utils/api/api_service.dart';
import 'package:streamx/utils/custom_widgets.dart';

/// all_categories.dart
///
/// This file contains the UI design of the all the screens.
/// This class list all categories in the different screen and let user choose categories.
class AllCategories extends StatelessWidget {
  const AllCategories({super.key});
  @override
  // Building context.
  Widget build(BuildContext context) {
    const String kTitle = "All Categories";
    const EdgeInsets kPadding = EdgeInsets.all(10.0);
    return Scaffold(
        // Creating appbar.
        appBar: AppBar(
          title: Text(kTitle),
          leading: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Icon(Icons.arrow_back)),
        ),

        /// Returing CustomFutureBuilder
        body: CustomFutureBuilder(
            future: TMDBMovies.genres(),
            whenHasData: (data) {
              return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Center(
                        child: Padding(
                      padding: kPadding,
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MovieCategoryViewer(
                                        title: data[index].name,
                                        object: TMDBMovies.moviesByGenreId(
                                            genreID: data[index].id))));
                          },
                          child: Text(data[index].name)),
                    ));
                  });
            }));
  }
}
