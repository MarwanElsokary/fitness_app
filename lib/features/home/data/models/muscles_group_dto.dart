import 'package:json_annotation/json_annotation.dart';

import 'muscle_group_dto.dart';

part 'muscles_group_dto.g.dart';

@JsonSerializable()
class MusclesGroupDto {
  final String? message;
  @JsonKey(name: 'musclesGroup')
  final List<MuscleGroupDto>? musclesGroup;

  MusclesGroupDto(this.message, this.musclesGroup);

  factory MusclesGroupDto.fromJson(Map<String, dynamic> json) =>
      _$MusclesGroupDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MusclesGroupDtoToJson(this);
}
