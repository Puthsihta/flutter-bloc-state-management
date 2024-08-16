import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_state_management/infinite_list/albums/album.dart';
import 'package:http/http.dart' as http;
import 'package:stream_transform/stream_transform.dart';

part 'album_event.dart';
part 'album_state.dart';

const _postLimit = 20;
const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class AlbumBloc extends Bloc<AlbumEvent, AlbumState> {
  AlbumBloc({required this.httpClient}) : super(const AlbumState()) {
    on<AlbumFetch>(
      _onPostFetched,
      transformer: throttleDroppable(throttleDuration),
    );
  }

  final http.Client httpClient;

  Future<void> _onPostFetched(
    AlbumFetch event,
    Emitter<AlbumState> emit,
  ) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == AlbumStatus.initial) {
        final posts = await _fetchPosts(1);
        return emit(
          state.copyWith(
            status: AlbumStatus.success,
            albums: posts,
            hasReachedMax: false,
          ),
        );
      }
      final page = (state.albums.length / _postLimit).ceil();
      final albums = await _fetchPosts(page + 1);
      albums.isEmpty
          ? emit(state.copyWith(hasReachedMax: true))
          : emit(
              state.copyWith(
                status: AlbumStatus.success,
                albums: List.of(state.albums)..addAll(albums),
                hasReachedMax: false,
              ),
            );
    } catch (_) {
      emit(state.copyWith(status: AlbumStatus.failure));
    }
  }

  Future<List<Album>> _fetchPosts([int page = 1]) async {
    print("page : $page");
    final response = await httpClient.get(
      Uri.https(
        'jsonplaceholder.typicode.com',
        '/photos',
        <String, String>{'_page': '$page', '_limit': '$_postLimit'},
      ),
    );
    if (response.statusCode == 200) {
      final body = json.decode(response.body) as List;
      return body.map((dynamic json) {
        final map = json as Map<String, dynamic>;
        return Album(
          id: map['id'] as int,
          title: map['title'] as String,
          url: map['url'] as String,
        );
      }).toList();
    }
    throw Exception('error fetching posts');
  }
}
