import 'package:apod/utils/keys/keys.dart';
const String BASE_URL = "https://api.nasa.gov/planetary/apod?";
Uri getApodDataUrl({String? date}) {
  return Uri.parse(BASE_URL + 'api_key=' + Keys.API_KEY + '&date=' + date!);
}
