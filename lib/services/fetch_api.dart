import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:fetchapi_riverpod/model/photos.dart';

List<PhotoModel> parsePhotos(String response) {
  var l = json.decode(response) as List<dynamic>;
  List<PhotoModel> photos = l.map((e) => PhotoModel.fromJson(e)).toList();
  return photos;
}

Future<List<PhotoModel>> fetchPhotos() async {
  final response = await http
      .get('https://jsonplaceholder.typicode.com/photos')
      .timeout(Duration(seconds: 5));
  if (response.statusCode == 200)
    return compute(parsePhotos, response.body);
  else
    throw Exception('Couldn\'t load photos');
}
