import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/models/ekonomi_news_models.dart';

class EkonomiNewProvider with ChangeNotifier {
  List<EkonomiNewsModels> _ekonomiList = [];
  bool _isLoading = false;

  List<EkonomiNewsModels> get ekonomiList => _ekonomiList;
  bool get isLoading => _isLoading;

  Future<void> fetchEkonomiNews() async {
    _isLoading = true;
    notifyListeners();

    final url =
        Uri.parse('https://api-berita-indonesia.vercel.app/cnn/ekonomi/');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body)['data'];
        _ekonomiList = [EkonomiNewsModels.fromJson(data)];
      }
    } catch (error) {
      rethrow;
    }

    _isLoading = false;
    notifyListeners();
  }
}
