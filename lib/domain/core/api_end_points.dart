import 'package:netflix_clone/core/Strings.dart';
import 'package:netflix_clone/infrastructure/api_key.dart';

class ApiEndPoints {
  static const downloads = "$kBaseUrl/trending/all/day?api_key=$apiKey";
  static const search =
      '$kBaseUrl/search/movie?api_key=$apiKey&query=spiderman';
  static const newAndHotMovie = '$kBaseUrl/discover/movie?api_key=$apiKey';
  static const newAndHotTv = '$kBaseUrl/discover/tv?api_key=$apiKey';
}
