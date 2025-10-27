// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryDto _$CategoryDtoFromJson(Map<String, dynamic> json) => CategoryDto(
  titleEn: json['title_en'] as String?,
  titleAr: json['title_ar'] as String?,
  imageUrl: json['image_url'] as String?,
);

Map<String, dynamic> _$CategoryDtoToJson(CategoryDto instance) =>
    <String, dynamic>{
      'title_en': instance.titleEn,
      'title_ar': instance.titleAr,
      'image_url': instance.imageUrl,
    };
