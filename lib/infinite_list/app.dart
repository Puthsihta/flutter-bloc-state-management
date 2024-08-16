import 'package:flutter/material.dart';
import 'package:flutter_bloc_state_management/infinite_list/albums/view/album_page.dart';
// import 'package:flutter_bloc_state_management/infinite_list/posts/posts.dart';

class App extends MaterialApp {
  const App({super.key}) : super(home: const AlbumPage());
}
