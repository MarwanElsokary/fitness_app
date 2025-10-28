import 'package:fitness_app/features/workouts/domain/entites/muscles_response_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'muscles_response.g.dart';

@JsonSerializable()
class MusclesResponse {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "totalMuscles")
  final int? totalMuscles;
  @JsonKey(name: "muscles")
  final List<Muscles>? muscles;

  MusclesResponse({this.message, this.totalMuscles, this.muscles});

  factory MusclesResponse.fromJson(Map<String, dynamic> json) {
    return _$MusclesResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MusclesResponseToJson(this);
  }
}

@JsonSerializable()
class Muscles {
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "image")
  final String? image;

  Muscles({this.id, this.name, this.image});

  factory Muscles.fromJson(Map<String, dynamic> json) {
    return _$MusclesFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MusclesToJson(this);
  }

  MusclesResponseEntity toMusclestEntity() => MusclesResponseEntity(

    id: id,
    name: name,
    image: image
  );
}
