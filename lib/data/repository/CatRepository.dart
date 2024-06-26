import 'dart:convert';
import 'package:flutter_application_1/data/model/CatBreed.dart';
import 'package:http/http.dart' as http;

class CatRepository {
  final String _baseUrl = 'https://api.thecatapi.com/v1/images/search';
  final String _apiKey = 'DEMO-API-KEY';

  Future<List<CatBreed>> fetchCatBreeds(String breedId) async {
    final response = await http.get(
      Uri.parse(breedId == ""
          ? '$_baseUrl?format=json&has_breeds=true&order=RANDOM&page=0&limit=10'
          : '$_baseUrl?format=json&has_breeds=true&order=RANDOM&page=0&limit=10&breed_ids=$breedId'),
      headers: {
        'Content-Type': 'application/json',
        'x-api-key': _apiKey,
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> catList = json.decode(response.body);
      return catList.map((json) => CatBreed.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load cats');
    }
  }
}
