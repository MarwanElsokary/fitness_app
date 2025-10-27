import 'package:fitness_app/features/workouts/domain/entites/workout_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'workout_response.g.dart';

@JsonSerializable()
class WorkoutResponse {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "musclesGroup")
  final List<MusclesGroup>? musclesGroup;

  WorkoutResponse({this.message, this.musclesGroup});

  factory WorkoutResponse.fromJson(Map<String, dynamic> json) {
    return _$WorkoutResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$WorkoutResponseToJson(this);
  }
}

@JsonSerializable()
class MusclesGroup {
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "name")
  final String? name;

  MusclesGroup({this.id, this.name});

  factory MusclesGroup.fromJson(Map<String, dynamic> json) {
    return _$MusclesGroupFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MusclesGroupToJson(this);
  }

  WorkoutEntity toCategoryEntity() => WorkoutEntity(id: id, name: name);
}
