import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class SearchResultProvider with ChangeNotifier {
  String _displayText = "";
  String _searchResultJsonResonse = "";
  bool _isFetchingSearchResults = false;
  bool showResultContainer = false;
  bool get isFetching => _isFetchingSearchResults;

  Future<void> fetchData(String searchUrl) async {
    print(searchUrl);
    _isFetchingSearchResults = true;
    notifyListeners();

    var response = await http.get(Uri.parse(searchUrl));
    if (response.statusCode == 200) {
      _searchResultJsonResonse = response.body;
    }
    print(response.statusCode);
    _isFetchingSearchResults = false;
    notifyListeners();
  }

  String get getResponseText => _searchResultJsonResonse;

  bool get shouldShowResultContainer {
    return showResultContainer;
  }

  void changeShowResultContainer(bool choice) {
    choice ? showResultContainer = true : showResultContainer = false;
    notifyListeners();
  }

  void setDisplayText(String text) {
    _displayText = text;
    notifyListeners();
  }

  String get getDisplayText => _displayText;

  List<dynamic> getResponseJson() {
    if (_searchResultJsonResonse.isNotEmpty) {
      // print(_searchResultJsonResonse);
      Map<String, dynamic> json = jsonDecode(_searchResultJsonResonse);
      print(json['response']['sections'][0]['hits']);
      // print(json['data']['avatar']);
      return json['response']['sections'][0]['hits'];
    }
    return [];
  }
}
