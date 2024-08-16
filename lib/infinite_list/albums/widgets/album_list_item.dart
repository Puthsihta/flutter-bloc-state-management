import 'package:flutter/material.dart';
import 'package:flutter_bloc_state_management/infinite_list/albums/album.dart';

class AlbumListItem extends StatelessWidget {
  const AlbumListItem({required this.album, super.key});

  final Album album;

  @override
  Widget build(BuildContext context) {
    // final textTheme = Theme.of(context).textTheme;
    return Material(
      child: ListTile(
        // leading: Text('${album.id}', style: textTheme.bodySmall),
        leading: Image.network(
          album.url,
          width: 50,
          height: 50,
        ),
        title: Text(album.title),
        // isThreeLine: true,
        // subtitle: Text(album.title),
        // dense: true,
      ),
    );
  }
}
