import 'package:flutter_bloc_state_management/github_search/github_search_commom.dart';

class GithubCache {
  final _cache = <String, SearchResult>{};

  SearchResult? get(String term) => _cache[term];

  void set(String term, SearchResult result) => _cache[term] = result;

  bool contains(String term) => _cache.containsKey(term);

  void remove(String term) => _cache.remove(term);
}
