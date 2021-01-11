

class Constants {

  // ignore: non_constant_identifier_names
  static String TOP_HEADLINES_URL = 'https://newsapi.org/v2/everything?q=bitcoin&apiKey=60733c00ee634675b6b229f91d587b6c';

  static String headlinesFor(String keyword) {

    return 'https://newsapi.org/v2/everything?q=$keyword&apiKey=60733c00ee634675b6b229f91d587b6c';

  }

}