part of 'album_bloc.dart';

enum AlbumStatus { initial, success, failure }

final class AlbumState extends Equatable {
  const AlbumState({
    this.status = AlbumStatus.initial,
    this.albums = const <Album>[],
    this.hasReachedMax = false,
  });

  final AlbumStatus status;
  final List<Album> albums;
  final bool hasReachedMax;

  AlbumState copyWith({
    AlbumStatus? status,
    List<Album>? albums,
    bool? hasReachedMax,
  }) {
    return AlbumState(
      status: status ?? this.status,
      albums: albums ?? this.albums,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  String toString() {
    return '''AlbumState { status: $status, hasReachedMax: $hasReachedMax, albums: ${albums.length} }''';
  }

  @override
  List<Object> get props => [status, albums, hasReachedMax];
}
