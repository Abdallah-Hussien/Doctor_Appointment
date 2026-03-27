import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:doc_app/features/home/data/repo/home_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/home_response.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(const HomeState.initial());

  List<Specialization> speciality = [];
  emitHomeStates() async {
    emit(const HomeState.loading());
    final result = await _homeRepo.getSpecialtiesList();
    result.when(
      success: (homeResponse) async{
        speciality = homeResponse.data;
      await Future.delayed(const Duration(seconds: 3));
        emit(HomeState.success(speciality));
        emit(HomeState.doctorSuccess(speciality[0].doctors));
      },
      failure: (e) {
        emit(HomeState.error(
            error: e.apiErrorModel.message ?? 'Error Happened'));
        emit(HomeState.doctorError(
            error: e.apiErrorModel.message ?? 'Error Happened'));
      },
    );
  }

  emitDoctorList(int index) {
    emit(HomeState.doctorSuccess(speciality[index].doctors));
  }
}
