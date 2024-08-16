import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_state_management/github_search/github_search_commom.dart';
import 'package:flutter_bloc_state_management/github_search/views/search_form.dart';
import 'package:flutter_bloc_state_management/theme/theme.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key, required this.githubRepository});

  final GithubRepository githubRepository;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Github Search",
      theme: FlutterTodosTheme.light,
      darkTheme: FlutterTodosTheme.dark,
      home: Scaffold(
        appBar: AppBar(title: const Text('Github Search')),
        body: BlocProvider(
          create: (_) => GithubSearchBloc(githubRepository: githubRepository),
          child: const SearchForm(),
        ),
      ),
    );
  }
}
