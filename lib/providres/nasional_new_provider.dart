import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/models/nasional_news_models.dart';

class NasionalNewProvider with ChangeNotifier {
  List<NasionalNewsModels> _nasionalList = [];
  bool _isLoading = false;

  List<NasionalNewsModels> get nasionalList => _nasionalList;
  bool get isLoading => _isLoading;

  Future<void> fetchNasionalNews() async {
    _isLoading = true;
    notifyListeners();

    final url =
        Uri.parse('https://api-berita-indonesia.vercel.app/cnn/nasional/');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body)['data'];
        _nasionalList = [NasionalNewsModels.fromJson(data)];
      }
    } catch (error) {
      rethrow;
    }

    _isLoading = false;
    notifyListeners();
  }
}
