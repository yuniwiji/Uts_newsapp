import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/models/tech_news_model.dart';

class TechNewsProvider with ChangeNotifier {
  List<TechNewsModel> _techList = [];
  bool _isLoading = false;

  List<TechNewsModel> get techList => _techList;
  bool get isLoading => _isLoading;

  Future<void> fetchTechNews() async {
    _isLoading = true;
    notifyListeners();

    final url =
        Uri.parse('https://api-berita-indonesia.vercel.app/antara/tekno/');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body)['data'];
        _techList = [TechNewsModel.fromJson(data)];
      }
    } catch (error) {
      rethrow;
    }

    _isLoading = false;
    notifyListeners();
  }
}
