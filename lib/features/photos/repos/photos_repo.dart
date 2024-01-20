import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:photos/features/photos/models/photo_data_model.dart';

class PhotosRepo {
  static Future<List<PhotosDataModel>> fetchPosts() async {
    var client = http.Client();
    final List<PhotosDataModel> photos = [];
    try {
      const String clientId = '8fZZLAtYG6LkkNbNsa7-_35CESYO-62CM5zQfc_-Nas';
      const String baseUrl = 'https://api.unsplash.com/photos/';

      final url = Uri.parse("$baseUrl?client_id=$clientId");

      var response = await client.get(
        url, /*headers: headers*/
      );

      List result = jsonDecode(response.body);
      for (int i = 0; i < result.length; i++) {
        PhotosDataModel photo = PhotosDataModel.fromMap(result[i]);
        photos.add(photo);
        print(result[i]['user']['name']);
      }
      return photos;
    } catch (e) {
      print(e.toString());
      return [];
    } finally {
      client.close();
    }
  }
}
