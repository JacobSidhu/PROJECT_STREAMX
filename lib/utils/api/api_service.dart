/// api_service.dart
///
/// This Dart file created to fetch data from THE MOVIE DATABASE server,
/// used to fetch data, make requests and to constructor json data using
/// various classes and functions.

/// Importing Packages and Utilities required for this file.
// Importing http package to make internet requests.
import 'package:http/http.dart' as http;
import 'dart:convert'; // Importing dart convert json to convert data.
import 'package:streamx/utils/api/auth_apikeys.dart';
import 'package:streamx/utils/const_values.dart';

/// The Class 'TMDBAPIManager' was defined to manage and organize the
/// comman components related to the TMDB APIs. It contains the common error
/// messages related to the TMDB server API requests.
class TMDBAPIManager {
  /// Response Codes
  static const int kSuccessCode = 200; // Success response code.
  static const int kFailureCode = 404; // Failed response code.

  /// This asynchronous function of Future<List<MovieData>?> makes the API request to get
  /// the list of movies from the TMDB. This function invoked the
  /// makeRequest() to get the response from the API requese.
  /// It returns the List of movieData.
  /// Parameters: none.
  static Future<List<MovieData>?> getMovies({required String url}) async {
    print("from getmovie function");
    // To capturing the response returned from makeRequest function.
    final response = await makeRequest(url: url);
    // Checking response.
    if (response.statusCode == kSuccessCode) {
      print("true response");
      // If response was the success
      // Returning list of movies by accessing "results" from response body.
      final List<dynamic>? moviesList = jsonDecode(response.body)['results'];
      // Checking for Null response from json body.
      if (moviesList != null && moviesList.isNotEmpty) {
        // Returning the list of object MovieFrame class.
        return moviesList.map((data) => MovieData.fromJson(data)).toList();
      }
      return null;
    } else {
      // Throwing exceptions if response was unsuccessful.
      print("Response was false in getMovie Methods");
      print(http.Response(response.body, response.statusCode));
      throw Exception(http.Response(response.body, response.statusCode));
    }
  }

  /// This asynchronous function makes the API request to get
  /// the list of shows from the TMDB. This function uses the
  /// makeRequest() to get the response from the API requese.
  /// It returns the List of MovieData.
  /// Parameters: none.
  static Future<List<TVShow>?> getShows({required String url}) async {
    // To capturing the response returned from makeRequest function.
    final response = await http.get(Uri.parse(url));
    print("After response in getshow function logFrom: getshows ");
    print(response.statusCode);
    // Checking response
    if (response.statusCode == kSuccessCode) {
      print("After succes response from http request logFrom: Getshows");
      // If response was the success then returning list of required movies from response body.
      final List<dynamic>? tvShowsList = jsonDecode(response.body)['results'];
      // Checking for null response.
      if (tvShowsList != null && tvShowsList.isNotEmpty) {
        // Returning the list of object MovieFrame class.
        return tvShowsList.map((data) => TVShow.fromJson(data)).toList();
      }
      print("results in the getshows function was null or has no value");
      return null; // Returing null if response was null.
    } else {
      // Throwing Exception if http request returned fail.
      print("Response was false in getMovie Methods");
      print(http.Response(response.body, response.statusCode));
      throw Exception(http.Response(response.body, response.statusCode));
    }
  }

  /// imageLoaderUrl() defined to load the image by
  /// providing authentication APi key and base line url
  /// just to load images from TMDB server this function
  /// returns the appended string as a url.
  /// Parameter:
  /// [imagePath] - required to load the image from TMDB
  static String imageLoaderUrl({required String imagePath}) {
    // Returning appended complete url to load image
    return '${TMDBMovieAPIs.kPosterBaseUrl}$imagePath?api_key=${AuthAPIKeys.kTMDBApiKey}';
  }

  /// Function "Future<http.Response>" is defined to fetch response from an API endpoint
  /// and returns the response generated by the api request.
  /// Parameter:
  /// [url] required the url or link to make request to.
  static Future<http.Response> makeRequest({required String url}) async {
    // Appending authentication key.
    final String key = '$url?api_key=${AuthAPIKeys.kTMDBApiKey}';
    // Returning response generated by the http get() request.
    return http.get(Uri.parse(key));
  }
} // TMDBAPIManager close.

/// WatchProviderInfo class provides the data structure for the WatchProviders
/// it has two members in this class.
class WatchProviderInfo {
  final String logoPath; // To store logo path of the watchProvidering service.
  final String providerName; // To store watch provider name.

  // Defining the class constructor.
  WatchProviderInfo({
    required this.logoPath,
    required this.providerName,
  });
  // This factory constructor is responsible for taking json data
  // and fetch required information from the json and assign it to the
  // class member and returns the class instance.
  factory WatchProviderInfo.fromJson(Map<String, dynamic> json) {
    return WatchProviderInfo(
      // If there isnt any logo_path, assigning the default placeholder for the poster.
      logoPath: json['logo_path'] == null
          ? LocalImages.kPosterPlaceHolder
          : TMDBAPIManager.imageLoaderUrl(imagePath: json["logo_path"]),
      providerName: json['provider_name'] ?? "Service",
    );
  }
} // WatchProviderInfo close.

/// This class was defined to store the lists of the movie or show buy and rent providers.
/// class has two constructor factory and default. it do not has any methods.
class WatchProviders {
  final List<WatchProviderInfo>? rent; // Nullable List of rent providers.
  final List<WatchProviderInfo>? buy; // Nullable List of buy providers.

  // Assigning the class members with constructor.
  WatchProviders({required this.rent, required this.buy});
  // Factory constructor that stores recieve the json data and assign to the constructor.
  factory WatchProviders.fromJson(Map<String, dynamic> json) {
    List<dynamic>? rentList =
        json['rent']; // Fetching list of rent providers from json.
    List<dynamic>? buyList =
        json['buy']; // Fetching list of rent providers from json.
    List<WatchProviderInfo>?
        rentProviders; // Creating watchProviderInfo instance for rent providers.
    List<WatchProviderInfo>?
        buyProviders; // Creating watchProviderInfo instance for buy providers.
    // Checking for null value. If Not null then creating list of type watchProviderInfo.
    if (rentList != null) {
      rentProviders =
          rentList.map((item) => WatchProviderInfo.fromJson(item)).toList();
    }
    // Checking if buyList is null.
    if (buyList != null) {
      buyProviders =
          buyList.map((item) => WatchProviderInfo.fromJson(item)).toList();
    }
    // Returing nullable value.
    return WatchProviders(rent: rentProviders, buy: buyProviders);
  }
} // WatchProviders close.

/// This class was defined to struct the data related the TV shows recieved from json.
/// class has factory constructor that takes json data and to assign the class constructor.
class TVShow {
  // List of variables to store required information from json.
  final int id; // Store the Show ID.
  final String originalLanguage; // Store Original language that the Show in.
  final String backDrop; // To store the backdrop image path.
  final String originalName; // Contains the original name of the show.
  final String title; // Contains known title for the show.
  final String posterPath; // To store show poster path.
  final String overview; // Stores the overview of the show.

  // Class Constructor requires the information.
  TVShow(
      {required this.id,
      required this.originalLanguage,
      required this.originalName,
      required this.title,
      required this.posterPath,
      required this.backDrop,
      required this.overview});

  // Defining the factory constructor that takes json data and returns the TVShow constructor.
  factory TVShow.fromJson(Map<String, dynamic> json) {
    // Assigning information from json to class members.
    return TVShow(
        id: json["id"] ?? 0,
        originalLanguage: json["original_language"] ?? "Unknown",
        originalName: json["original_name"] ?? json["name"] ?? "UnKnown",
        title: json["name"] ?? json["original_name"] ?? "No Title",
        // Appending the TMDB image loader with the poster.
        posterPath:
            TMDBAPIManager.imageLoaderUrl(imagePath: json["poster_path"]),
        backDrop:
            TMDBAPIManager.imageLoaderUrl(imagePath: json["backdrop_path"]),
        overview: json["overview"] ?? "Overview not Found");
  }
}

/// The class 'Genre' was definined tp create the constructor for to
/// store Genre of the movies. it store the genre Id and genre String.
class Genre {
  // These member are defined to hold the value of the genre.
  final int id; // Genre id.
  final String name; // Genre name.
  // Initializing the Class constructor.
  Genre({required this.id, required this.name});

  /// Defining the factory constructor to access the json values.
  /// It takes the json data in and pass the required values
  /// into the class constructor to return it.
  factory Genre.fromJson(Map<String, dynamic> json) {
    // Invoking and returning the constructor.
    return Genre(id: json["id"], name: json["name"]);
  }
} // Genre close.

/// This class defined to construct the data required for the movie.
/// It has factor constructor that returns the Constructor of the class.
class MovieData {
  // List of class members to store the data for the movie.
  final String title; // Movie title.
  final String originalTitle; // Movie's original title.
  final bool isAdult; // Boolean flag to identify adult content.
  final String posterPath; // To store poster path as a string.
  final String backDrop; // To store the backdrop of the movie.
  final int id; // To store the movie ID.
  final List<int> genre; // To store the list of genres.
  final String overview; // String to store the overview of the movie.
  final String releaseData; // To store the realease date.
  // Initializing the class constructor.
  MovieData(
      {required this.title,
      required this.originalTitle,
      required this.isAdult,
      required this.posterPath,
      required this.backDrop,
      required this.id,
      required this.genre,
      required this.overview,
      required this.releaseData});

  /// This factor construtor is defined to take json data
  /// and assign the required information from the json to
  /// the class constructor and returns from the json into constructor.
  factory MovieData.fromJson(Map<String, dynamic> json) {
    // Returning class Constructor.
    return MovieData(
        // Accessing required values from the json by checking null values.
        title: json["title"] ?? "No title",
        originalTitle: json["original_title"] ?? json["title"] ?? "Unknown",
        isAdult: json["adult"] ?? false,
        // Appending the TMDB image loader with the poster.
        posterPath:
            TMDBAPIManager.imageLoaderUrl(imagePath: json["poster_path"]),
        backDrop:
            TMDBAPIManager.imageLoaderUrl(imagePath: json["backdrop_path"]),
        id: json["id"] ?? 0,
        genre: List<int>.from(json["genre_ids"] ?? []),
        overview: json["overview"] ?? "Information unavailable.",
        releaseData: json["release_date"] ?? "Not Specified");
  }
} // MovieData close.

/// This class all ecapsulates all api services relates to the movies
/// from the TMDB. It has all static function member in it.
class TMDBMovies {
  /// This asynchronous function makes the API request to get
  /// the list of all genres from the TMDB. This function invoked the
  /// makeRequest() to get the response from the API requese.
  /// It returns the List of all genres or categories.
  /// Parameters: none.
  static Future<List<Genre>?> genres() async {
    // To capturing the response returned from makeRequest function.
    final response =
        await TMDBAPIManager.makeRequest(url: TMDBMovieAPIs.genreListURL);
    // Checking response
    if (response.statusCode == TMDBAPIManager.kSuccessCode) {
      // If response was the success then returning list of genre from response body.
      final List<dynamic>? genres = jsonDecode(response.body)['genres'];
      if (genres != null) {
        // returning the list of object Genre class.
        List<Genre> genreList =
            genres.map((data) => Genre.fromJson(data)).toList();
        return genreList;
      }
      print("Genre was null ! from genre function");
      return null;
    } else {
      print("Exception thrown from genre function from http response");
      // Throwing exceptions if response was unsuccessful.
      throw http.Response(response.body, response.statusCode);
    }
  }

  /// This function makes the API request to get
  /// to search for the movies or keyword passed into the function
  /// makeRequest() to get the response from the API requese.
  /// It returns the List of popular movie or categories.
  /// Parameters:
  /// [keyword] - required to serach for related content.
  static Future<List<MovieData>?> searchMovies(
      {required String keyword, String? page = "1"}) async {
    // Appending search API url.
    String urlLink =
        '${TMDBMovieAPIs.kMovieSearchBaselineUrl}$keyword&$page&api_key=${AuthAPIKeys.kTMDBApiKey}';
    final http.Response response = await http.get(Uri.parse(urlLink));
    // Checking response
    if (response.statusCode == TMDBAPIManager.kSuccessCode) {
      // If response was the success then returning list of required movies from response body.
      final List<dynamic>? moviesList = jsonDecode(response.body)['results'];
      if (moviesList != null) {
        // Returning the list of object MovieFrame class.
        return moviesList.map((data) => MovieData.fromJson(data)).toList();
      }
      print("results was null from searchMovie function");
      // Returning the null if there isnt any result from search Movie function.
      return null;
    } else {
      print("Expection thrown from searchMovies with no http response");
      // Throwing exceptions if response was unsuccessful.
      throw http.Response(response.body, response.statusCode);
    }
  }

  /// This Future returns the List of the Instance of the movies
  /// that are similar to the movie id been passed into the function
  /// paramter.
  /// Parameters:
  /// [movieId] - required to serach for related content.
  static Future<List<MovieData>?> similarMovies({required int movieId}) async {
    print("from await function");
    // Appending similar movie request baseline url.
    String requestUrls = 'https://api.themoviedb.org/3/movie/$movieId/similar';
    // Returning list similar movies.
    return await TMDBAPIManager.getMovies(url: requestUrls);
  }

  /// This Function makes the request to fetch popular movies from TMDB.
  static Future<List<MovieData>?> popularMovies() async {
    return await TMDBAPIManager.getMovies(url: TMDBMovieAPIs.popularMoviesUrl);
  }

  /// This Function makes the request to fetch discovering movies from TMDB.
  static Future<List<MovieData>?> discoverMovies() async {
    return await TMDBAPIManager.getMovies(url: TMDBMovieAPIs.discoverMoviesUrl);
  }

  /// This function fetchs the upcoming movies.
  static Future<List<MovieData>?> upcomingMovies() async {
    // Api url to make request to.
    const String baseUrl = "https://api.themoviedb.org/3/movie/upcoming";
    return await TMDBAPIManager.getMovies(url: baseUrl);
  }

  // This function fetchs the list of movies that are currently in theatre.
  static Future<List<MovieData>?> inTheatres() async {
    // Api urls for request data.
    String baseUrls = "https://api.themoviedb.org/3/movie/now_playing";
    return await TMDBAPIManager.getMovies(url: baseUrls);
  }

  /// This Function makes the request to fetch top-Rated movies from TMDB.
  static Future<List<MovieData>?> topRatedMovies() async {
    return await TMDBAPIManager.getMovies(url: TMDBMovieAPIs.discoverMoviesUrl);
  }

  /// This function was defined to porivder the details of the movie providers.
  static Future<WatchProviders?> watchProvider({required int movieId}) async {
    String apiUrl =
        "https://api.themoviedb.org/3/movie/$movieId/watch/providers";
    final response = await TMDBAPIManager.makeRequest(url: apiUrl);
    if (response.statusCode == TMDBAPIManager.kSuccessCode) {
      print('success response from api url logform: watchProvider function');
      final Map<String, dynamic>? jsonResponse = json.decode(response.body);
      final Map<String, dynamic>? results = jsonResponse?["results"];
      if (results != null && results.isNotEmpty) {
        print("results wasnt null in watchProvider function");
        final Map<String, dynamic>? gbData = results["GB"];
        if (gbData != null) {
          print("results wasnt null in watchProvider function");
          final WatchProviders gbProviders = WatchProviders.fromJson(gbData);
          return gbProviders;
        } else {
          print("GB was not found in results in watchProvder functions");
          return null;
        }
      } else {
        print("Results was null in watchprovider function");
        return null;
      }
    } else {
      print("Expection throwen from watchProvider");
      throw Exception("Failed To receive response from Internet");
    }
  }
} // TMDBMovies close.

/// This class contains the api functions to retrieve various TV shows related
/// Information. Class named 'TMDBTvShows' has all its members as static. class do not
/// have any private field or member of the class.
class TMDBTvShows {
  /// This function fetches the top rated shows from TMDB server.
  /// Returns: [List<TVshows?>] that contains the list of TVShows.
  /// Parameters: none.
  static Future<List<TVShow>?> topRated() async {
    // Api url to fetch top rated shows.
    const String apiUrl = "https://api.themoviedb.org/3/tv/top_rated";
    // Returing list of TV Shows.
    return TMDBAPIManager.getShows(url: apiUrl);
  }

  static Future<List<TVShow>?> discover() async {
    // Base Api url link
    const String apiUrls =
        "https://api.themoviedb.org/3/discover/tv?api_key=${AuthAPIKeys.kTMDBApiKey}";
    return await TMDBAPIManager.getShows(url: apiUrls);
  }

  /// This Function search for Tv shows from TMDB.
  static Future<List<TVShow>?> searchTVShows({required String keyword}) async {
    // BaseLine url for to search TV shows.
    String baseUrl =
        "https://api.themoviedb.org/3/search/tv?query=$keyword&api_key=${AuthAPIKeys.kTMDBApiKey}";
    return await TMDBAPIManager.getShows(url: baseUrl);
  }

  /// trending () funtion was defined to fetch trending tv shows
  /// from the TMDB. It is a static function of type Future<List<TVshow>>
  /// Returns: getShows() function. Paramters: [time] requires the time period.
  static Future<List<TVShow>?> trending({String? time = "day"}) async {
    // Api url for trending shows.
    String apiUrl = "https://api.themoviedb.org/3/trending/tv/$time";
    return await TMDBAPIManager.getShows(url: apiUrl);
  }

  /// This function retrieves the popular tv shows. using Api request to
  /// tmdb. This function uses the getShows function from TMDB manager class.
  /// Returns: [TMDBManager.getShows()] which returns TV show list.
  /// Parameters: none.
  static Future<List<TVShow>?> popular() async {
    // Api url  for to fetch popular tv shows.
    String apiUrl = "https://api.themoviedb.org/3/tv/popular";
    return await TMDBAPIManager.getShows(url: apiUrl);
  }
}
