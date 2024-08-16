import 'package:equatable/equatable.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Album extends Equatable {
  final int id;
  final String title;
  final String url;

  const Album({
    required this.id,
    required this.title,
    required this.url,
  });

  @override
  List<Object> get props => [id, title, url];
}
