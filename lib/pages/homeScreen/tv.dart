/// Important essential packages required for the design.
import 'package:flutter/material.dart'; // Material design package.
import 'package:streamx/utils/api/api_service.dart';
import 'package:streamx/utils/custom_widgets.dart';

class TvTab extends StatefulWidget {
  const TvTab({super.key});
  @override
  TvTabState createState() => TvTabState();
}

class TvTabState extends State<TvTab> {
  // List of Container future list of TVShows.
  late Future<List<TVShow>?> trendingTvShows = TMDBTvShows.trending();
  late Future<List<TVShow>?> discoverTvShows = TMDBTvShows.discover();
  late Future<List<TVShow>?> topRatedTvShows = TMDBTvShows.topRated();
  late Future<List<TVShow>?> popularTvShows = TMDBTvShows.popular();
  late List<Future<List<TVShow>?>> tvshowsCategories = [
    trendingTvShows,
    discoverTvShows,
    topRatedTvShows,
    popularTvShows
  ];
  // List of _each rows titles.
  final List<String> _categoryTitle = [
    "Trending",
    "Discover",
    "Top Rated",
    "Popular"
  ];
  final EdgeInsets kPagePadding = EdgeInsets.only(top: 10);
  @override
  // Building context bu overriding build() method.
  Widget build(BuildContext context) {
    // Returing Scaffold widget.
    return Scaffold(
        body: Padding(
            // Setting Padding to the Row's list container.
            padding: kPagePadding,
            child: ListView.builder(
                itemCount: tvshowsCategories.length,
                itemBuilder: (context, index) {
                  // Returning CustomFutureBuilder.
                  return CustomFutureBuilder(
                      future: tvshowsCategories[index],
                      whenHasData: (data) {
                        return PosterRowGenerator(
                            title: _categoryTitle[index],
                            itemCount: data.length,
                            poster: (index) {
                              return Poster(
                                  posterPath: data[index].posterPath,
                                  navigateTo: Container());
                            });
                      });
                })));
  }
}
