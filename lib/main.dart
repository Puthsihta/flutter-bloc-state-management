import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_state_management/form_validation/app.dart';
// import 'package:flutter_bloc_state_management/github_search/github_search_commom.dart';
// import 'package:flutter_bloc_state_management/github_search/views/view.dart';
// import 'package:flutter_bloc_state_management/infinite_list/app.dart';
// import 'package:flutter_bloc_state_management/infinite_list/simple_bloc_observer.dart';
import 'package:flutter_bloc_state_management/theme/theme.dart';
import 'package:flutter_bloc_state_management/todos/l10n/l10n.dart';
import 'package:flutter_bloc_state_management/todos/repository/todos_repository.dart';
// import 'package:shared_preferences/shared_preferences.dart';

import 'todos/home/home.dart';
// import 'todos/local_storage/local_storage_todos_api.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // final todosApi = LocalStorageTodosApi(
  //   plugin: await SharedPreferences.getInstance(),
  // );
  // final todosRepository = TodosRepository(todosApi: todosApi);
  // Bloc.observer = const SimpleBlocObserver();
  // runApp(
  //   MyApp(
  //     todosRepository: todosRepository,
  //   ),
  // );
  // final githubRepository = GithubRepository(
  //   GithubCache(),
  //   GithubClient(),
  // );
  // runApp(const App());
  // runApp(SearchPage(
  //   githubRepository: githubRepository,
  // ));
  runApp(const FormApp());
}

class MyApp extends StatelessWidget {
  const MyApp({required this.todosRepository, super.key});

  final TodosRepository todosRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: todosRepository,
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: FlutterTodosTheme.light,
      darkTheme: FlutterTodosTheme.dark,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const HomePage(),
    );
  }
}
