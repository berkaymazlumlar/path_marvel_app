import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;
import 'package:path_marvel_app/pages/character_detail_page/model/character_comics_model.dart';
import 'package:path_marvel_app/pages/character_detail_page/model/character_details_model.dart';
import '../../../constants/constants.dart';

class CharacterDetailsService {
  static Future<dynamic> getCharacterDetails({required String id}) async {
    try {
      final String ts = DateTime.now().millisecondsSinceEpoch.toString();
      final String hash = md5
          .convert(
            utf8.encode(ts +
                ApplicationConstants.PRIVATE_KEY +
                ApplicationConstants.PUBLIC_KEY),
          )
          .toString();

      final Uri uri = Uri.parse(
          "${ApplicationConstants.BASE_URL}${ApplicationConstants.GET_CHARACTERS}/$id?ts=$ts&hash=$hash&apikey=${ApplicationConstants.PUBLIC_KEY}");

      final Map<String, String>? headers = {
        "Content-Type": "application/json; charset=utf-8",
      };
      final response = await http.get(
        uri,
        headers: headers,
      );
      if (response.statusCode == 200) {
        return characterDetailsFromJson(response.body);
      } else {
        return "${response.statusCode}";
      }
    } on Exception catch (e) {
      return "$e";
    }
  }

  static Future<dynamic> getCharacterComics({required String id}) async {
    try {
      final String minDate = DateTime(2005, 1, 1).toString().substring(0, 10);
      final String maxDate = DateTime.now().toString().substring(0, 10);
      final String ts = DateTime.now().millisecondsSinceEpoch.toString();
      final String hash = md5
          .convert(
            utf8.encode(ts +
                ApplicationConstants.PRIVATE_KEY +
                ApplicationConstants.PUBLIC_KEY),
          )
          .toString();

      final Uri uri = Uri.parse(
          "${ApplicationConstants.BASE_URL}${ApplicationConstants.GET_CHARACTERS}/$id/comics?dateRange=$minDate,$maxDate&orderBy=-focDate&limit=10&ts=$ts&hash=$hash&apikey=${ApplicationConstants.PUBLIC_KEY}");

      final Map<String, String>? headers = {
        "Content-Type": "application/json; charset=utf-8",
      };
      final response = await http.get(
        uri,
        headers: headers,
      );
      if (response.statusCode == 200) {
        return characterComicsFromJson(response.body);
      } else {
        return "${response.statusCode}";
      }
    } on Exception catch (e) {
      return "$e";
    }
  }
}
