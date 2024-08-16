import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_state_management/infinite_list/albums/album.dart';

class AlbumList extends StatefulWidget {
  const AlbumList({super.key});

  @override
  State<AlbumList> createState() => _AlbumListState();
}

class _AlbumListState extends State<AlbumList> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AlbumBloc, AlbumState>(
      builder: (context, state) {
        switch (state.status) {
          case AlbumStatus.failure:
            return const Center(child: Text('failed to fetch album list'));
          case AlbumStatus.initial:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case AlbumStatus.success:
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return index >= state.albums.length
                    ? const BottomLoader()
                    : AlbumListItem(album: state.albums[index]);
              },
              itemCount: state.hasReachedMax
                  ? state.albums.length
                  : state.albums.length + 1,
              controller: _scrollController,
            );
        }
      },
    );
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) context.read<AlbumBloc>().add(AlbumFetch());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
