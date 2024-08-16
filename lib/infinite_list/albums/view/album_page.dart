import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_state_management/infinite_list/albums/album.dart';
import 'package:flutter_bloc_state_management/infinite_list/albums/view/album_list.dart';
import 'package:http/http.dart' as http;

class AlbumPage extends StatelessWidget {
  const AlbumPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            AlbumBloc(httpClient: http.Client())..add(AlbumFetch()),
        child: const AlbumList(),
      ),
    );
  }
}
