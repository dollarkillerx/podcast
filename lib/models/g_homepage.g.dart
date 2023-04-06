// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'g_homepage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomePageResponse _$HomePageResponseFromJson(Map<String, dynamic> json) =>
    HomePageResponse(
      carousel: (json['carousel'] as List<dynamic>)
          .map((e) => Carousel.fromJson(e as Map<String, dynamic>))
          .toList(),
      boxs: (json['boxs'] as List<dynamic>)
          .map((e) => Box.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HomePageResponseToJson(HomePageResponse instance) =>
    <String, dynamic>{
      'carousel': instance.carousel,
      'boxs': instance.boxs,
    };

Box _$BoxFromJson(Map<String, dynamic> json) => Box(
      title: json['title'] as String,
      books: (json['books'] as List<dynamic>)
          .map((e) => BookLetter.fromJson(e as Map<String, dynamic>))
          .toList(),
      arrangement: $enumDecode(_$BoxArrangementEnumMap, json['arrangement']),
    );

Map<String, dynamic> _$BoxToJson(Box instance) => <String, dynamic>{
      'title': instance.title,
      'books': instance.books,
      'arrangement': _$BoxArrangementEnumMap[instance.arrangement]!,
    };

const _$BoxArrangementEnumMap = {
  BoxArrangement.Horizontal: 'Horizontal',
  BoxArrangement.Vertical: 'Vertical',
};

BookLetter _$BookLetterFromJson(Map<String, dynamic> json) => BookLetter(
      id: json['id'] as String,
      title: json['title'] as String,
      subTitle: json['subTitle'] as String,
      img: json['img'] as String,
      score: (json['score'] as num).toDouble(),
      end: json['end'] as bool,
      episode: json['episode'] as int,
      views: json['views'] as int,
      author: BookAuthor.fromJson(json['author'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BookLetterToJson(BookLetter instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'subTitle': instance.subTitle,
      'img': instance.img,
      'score': instance.score,
      'end': instance.end,
      'episode': instance.episode,
      'views': instance.views,
      'author': instance.author,
    };

BookAuthor _$BookAuthorFromJson(Map<String, dynamic> json) => BookAuthor(
      id: json['id'] as String,
      name: json['name'] as String,
      avatar: json['avatar'] as String,
    );

Map<String, dynamic> _$BookAuthorToJson(BookAuthor instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'avatar': instance.avatar,
    };

Carousel _$CarouselFromJson(Map<String, dynamic> json) => Carousel(
      img: json['img'] as String,
      title: json['title'] as String,
      ad: json['ad'] as bool,
      jumpType: $enumDecode(_$JumpTypeEnumMap, json['jumpType']),
      jumpUrl: json['jumpUrl'] as String,
    );

Map<String, dynamic> _$CarouselToJson(Carousel instance) => <String, dynamic>{
      'img': instance.img,
      'title': instance.title,
      'ad': instance.ad,
      'jumpType': _$JumpTypeEnumMap[instance.jumpType]!,
      'jumpUrl': instance.jumpUrl,
    };

const _$JumpTypeEnumMap = {
  JumpType.InApp: 'InApp',
  JumpType.Web: 'Web',
  JumpType.None: 'None',
};
