import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;
import 'package:path_marvel_app/pages/homepage/model/characters_model.dart';

import '../../../constants/constants.dart';

class HomepageService {
  static Future<dynamic> getCharacters({required int offset}) async {
    try {
      final String ts = DateTime.now().millisecondsSinceEpoch.toString();
      final String hash = md5
          .convert(utf8.encode(ts +
              ApplicationConstants.PRIVATE_KEY +
              ApplicationConstants.PUBLIC_KEY))
          .toString();

      final Uri uri = Uri.parse(
          "${ApplicationConstants.BASE_URL}${ApplicationConstants.GET_CHARACTERS}?ts=$ts&hash=$hash&limit=30&offset=$offset&apikey=${ApplicationConstants.PUBLIC_KEY}");

      final Map<String, String>? headers = {
        "Content-Type": "application/json; charset=utf-8",
      };
      final response = await http.get(
        uri,
        headers: headers,
      );

      if (response.statusCode == 200) {
        return charactersFromJson(response.body);
      } else {
        return "${response.statusCode}";
      }
    } on Exception catch (e) {
      return "$e";
    }
  }
}
