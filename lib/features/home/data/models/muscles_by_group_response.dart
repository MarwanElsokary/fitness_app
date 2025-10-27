import 'package:json_annotation/json_annotation.dart';

import 'muscle_dto.dart';
import 'muscle_group_dto.dart';

part 'muscles_by_group_response.g.dart';

@JsonSerializable()
class MusclesByGroupResponse {
  @JsonKey(name: 'message')
  final String message;
  @JsonKey(name: 'muscleGroup')
  final MuscleGroupDto muscleGroup;
  @JsonKey(name: 'muscles')
  final List<MuscleDto> muscles;

  MusclesByGroupResponse(this.message, this.muscleGroup, this.muscles);

  factory MusclesByGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$MusclesByGroupResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MusclesByGroupResponseToJson(this);
}
