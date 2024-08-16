part of 'album_bloc.dart';

sealed class AlbumEvent extends Equatable {
  @override
  List<Object> get props => [];
}

final class AlbumFetch extends AlbumEvent {}
