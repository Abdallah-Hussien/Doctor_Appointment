part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.loading() = Loading;
  const factory HomeState.success(List<Specialization> specializationList) = Success;
  const factory HomeState.error({required String error}) = Error;

  //docto
  const factory HomeState.doctorSuccess(List<Doctor> doctorsList) = DoctorSuccess;
  const factory HomeState.doctorError({required String error}) = DoctorError;
}
