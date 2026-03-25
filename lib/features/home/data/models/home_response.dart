import 'package:json_annotation/json_annotation.dart';

part 'home_response.g.dart';
@JsonSerializable()

@JsonSerializable()
class HomeResponse {
  final String message;
  final List<Specialization> data;
  final bool status;
  final int code;

  HomeResponse({
    required this.message,
    required this.data,
    required this.status,
    required this.code,
  });

  factory HomeResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HomeResponseToJson(this);
}


@JsonSerializable()
class Specialization {
  final int id;
  final String name;
  final List<Doctor> doctors;

  Specialization({
    required this.id,
    required this.name,
    required this.doctors,
  });

  factory Specialization.fromJson(Map<String, dynamic> json) =>
      _$SpecializationFromJson(json);

  Map<String, dynamic> toJson() => _$SpecializationToJson(this);
}

@JsonSerializable()
class Doctor {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String degree;
  final SpecializationInfo specialization;
  @JsonKey(name: 'appoint_price')
  final int appointPrice;
  @JsonKey(name: 'start_time')
  final String startTime;
  @JsonKey(name: 'end_time')
  final String endTime;

  Doctor({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.degree,
    required this.specialization,
    required this.appointPrice,
    required this.startTime,
    required this.endTime,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) =>
      _$DoctorFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorToJson(this);
}

@JsonSerializable()
class SpecializationInfo {
  final int id;
  final String name;

  SpecializationInfo({
    required this.id,
    required this.name,
  });

  factory SpecializationInfo.fromJson(Map<String, dynamic> json) =>
      _$SpecializationInfoFromJson(json);

  Map<String, dynamic> toJson() => _$SpecializationInfoToJson(this);
}
