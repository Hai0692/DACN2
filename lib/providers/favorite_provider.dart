import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteProvider extends ChangeNotifier {
  late SharedPreferences _prefs;
  Map<String, dynamic> _jobFavorites = {};

  FavoriteProvider() {
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    try {
      _prefs = await SharedPreferences.getInstance();
      String favoritesString = _prefs.getString('favorites') ?? '{}';
      _jobFavorites = jsonDecode(favoritesString);
      notifyListeners();
    } catch (e) {
      print('Error loading preferences: $e');
    }
  }

  bool isInFavorites(int jobId) {
    return _jobFavorites.containsKey(jobId.toString()) ? _jobFavorites[jobId.toString()]! : false;
  }

  void setInFavorites(int jobId, bool value) {
    _jobFavorites[jobId.toString()] = value;
    _savePreferences();
    notifyListeners();
  }

  Future<void> _savePreferences() async {
    try {
      String favoritesString = jsonEncode(_jobFavorites);
      await _prefs.setString('favorites', favoritesString);
    } catch (e) {
      print('Failed to save favorites to SharedPreferences: $e');
    }
  }
}





