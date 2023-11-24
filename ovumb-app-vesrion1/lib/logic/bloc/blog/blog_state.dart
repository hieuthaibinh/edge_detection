// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:flutter_ovumb_app_version1/data/models/blog/blog.dart';
import 'package:flutter_ovumb_app_version1/data/models/blog/type_blog.dart';

abstract class BlogState extends Equatable {
  final bool isLoading;
  final String? loadingText;
  const BlogState({
    required this.isLoading,
    this.loadingText,
  });

  @override
  List<Object> get props => [];
}

class BlogStateInitial extends BlogState {
  BlogStateInitial({required super.isLoading});
}

class AllBlogState extends BlogState {
  List<TypeBlog> listType;
  List<List<Blog>> listBlogs;
  AllBlogState({
    required super.isLoading,
    required this.listType,
    required this.listBlogs,
  });
}

class Phase5BlogState extends BlogState {
  List<TypeBlog> listType;
  List<List<Blog>> listBlogs;
  Phase5BlogState({
    required super.isLoading,
    required this.listType,
    required this.listBlogs,
  });
}

class HasNoBlogState extends BlogState {
  HasNoBlogState({
    required super.isLoading,
  });
}

class LoadFailure extends BlogState {
  final String error;
  LoadFailure({
    required this.error,
    required super.isLoading,
  });
}

class LoadingState extends BlogState {
  LoadingState({required super.isLoading});
}