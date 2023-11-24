// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:equatable/equatable.dart';

abstract class BlogEvent extends Equatable {
  const BlogEvent();

  @override
  List<Object> get props => [];
}

class AllBlogEvent extends BlogEvent {
  int phase;
  AllBlogEvent({
    required this.phase,
  });
}

class Phase5BlogEvent extends BlogEvent {
  int phase;
  Phase5BlogEvent({
    required this.phase,
  });
}
