import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'g_homepage.g.dart';

@JsonSerializable()
class HomePageResponse {
  List<Carousel> carousel;
  List<Box> boxs;

  HomePageResponse({
    required this.carousel,
    required this.boxs,
  });

  factory HomePageResponse.fromJson(Map<String, dynamic> json) =>
      _$HomePageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HomePageResponseToJson(this);
}

@JsonSerializable()
class Box {
  String title;
  List<BookLetter> books;
  BoxArrangement arrangement;

  Box({
    required this.title,
    required this.books,
    required this.arrangement,
  });

  factory Box.fromJson(Map<String, dynamic> json) => _$BoxFromJson(json);

  Map<String, dynamic> toJson() => _$BoxToJson(this);
}

@JsonSerializable()
class BookLetter {
  String id;
  String title;
  String subTitle;
  String img;
  double score;
  bool end;
  int episode;
  int views;
  BookAuthor author;

  BookLetter({
    required this.id,
    required this.title,
    required this.subTitle,
    required this.img,
    required this.score,
    required this.end,
    required this.episode,
    required this.views,
    required this.author,
  });

  factory BookLetter.fromJson(Map<String, dynamic> json) =>
      _$BookLetterFromJson(json);

  Map<String, dynamic> toJson() => _$BookLetterToJson(this);
}

@JsonSerializable()
class BookAuthor {
  String id;
  String name;
  String avatar;

  BookAuthor({
    required this.id,
    required this.name,
    required this.avatar,
  });

  factory BookAuthor.fromJson(Map<String, dynamic> json) =>
      _$BookAuthorFromJson(json);

  Map<String, dynamic> toJson() => _$BookAuthorToJson(this);
}

@JsonSerializable()
class Carousel {
  String img;
  String title;
  bool ad;
  JumpType jumpType;
  String jumpUrl;

  Carousel({
    required this.img,
    required this.title,
    required this.ad,
    required this.jumpType,
    required this.jumpUrl,
  });

  factory Carousel.fromJson(Map<String, dynamic> json) =>
      _$CarouselFromJson(json);

  Map<String, dynamic> toJson() => _$CarouselToJson(this);
}

enum BoxArrangement {
  @JsonValue('Horizontal')
  Horizontal,
  @JsonValue('Vertical')
  Vertical,
}

enum JumpType {
  @JsonValue('InApp')
  InApp,
  @JsonValue('Web')
  Web,
  @JsonValue('None')
  None,
}

