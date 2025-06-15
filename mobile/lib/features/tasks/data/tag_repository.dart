import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/tag.dart';

class TagRepository {
  final String baseUrl;
  final http.Client _client;

  TagRepository({required this.baseUrl, http.Client? client})
      : _client = client ?? http.Client();

  Future<List<Tag>> fetchTags() async {
    final response = await _client.get(Uri.parse('$baseUrl/tags'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List<dynamic>;
      return data.map((e) => Tag.fromJson(e as Map<String, dynamic>)).toList();
    }
    throw Exception('Failed to load tags');
  }
}
