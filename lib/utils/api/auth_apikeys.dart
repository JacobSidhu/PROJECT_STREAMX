/// This file was created to contains all Authentication api keys
/// and urls from different API provider platform. This file is not for to
/// push onto the github(VCS). Classes are used encapsulate apikeys and
/// urls.

class AuthAPIKeys {
  // This api key is the authentication key for the TVmaze.com.
  static const String kTVmazeApiKey = 'h7BfZ5caWyGBkUIcGRp9UA6QNRP0Y4Ae';
  // Api key to authenticate requests for the The Movie DataBase(TMDB).
  static const String kTMDBApiKey = 'ea5cebc5fadcac78b47a940645746f94';
}

/// This class defined to encapsulate all Api keys used for the TMDB.This
/// class do not have any function.
class TMDBMovieAPIs {
  // This is the baseUrl to fetch image from TMDB server.
  static const String kPosterBaseUrl = 'https://image.tmdb.org/t/p/original/';
  // This is the baseUrl to search for keyword from TMDB server.
  static const String kMovieSearchBaselineUrl =
      'https://api.themoviedb.org/3/search/movie?query=';
  // Genres api key.
  static const String genreListURL =
      'https://api.themoviedb.org/3/genre/movie/list';
  // Popular movies api key.
  static const String popularMoviesUrl =
      'https://api.themoviedb.org/3/movie/popular';
  // Api for Discover movies.
  static const String discoverMoviesUrl =
      'https://api.themoviedb.org/3/discover/movie';
  // Api for top rated movies.
  static const String kTopRatedMoviesUrl =
      'https://api.themoviedb.org/3/movie/top_rated';
  // Base Line url for similar movie request.
  static const String kSimilarMoviesBaselineUrl =
      'https://api.themoviedb.org/3/movie/';
  // This urls used to search for the shows.
  static const String kTVSearchBaselineUrl =
      "https://api.themoviedb.org/3/search/tv?query=";
  // This urls used to get the movie provider data.
  static String movieProviderUrl({required String movieID}) {
    return "https://api.themoviedb.org/3/movie/$movieID/watch/providers";
  }
}
