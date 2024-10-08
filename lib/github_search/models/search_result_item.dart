import 'package:flutter_bloc_state_management/github_search/github_search_commom.dart';

class SearchResultItem {
  const SearchResultItem({
    required this.fullName,
    required this.htmlUrl,
    required this.owner,
  });

  factory SearchResultItem.fromJson(Map<String, dynamic> json) {
    return SearchResultItem(
      fullName: json['full_name'] as String,
      htmlUrl: json['html_url'] as String,
      owner: GithubUser.fromJson(json['owner'] as Map<String, dynamic>),
    );
  }

  final String fullName;
  final String htmlUrl;
  final GithubUser owner;
}
