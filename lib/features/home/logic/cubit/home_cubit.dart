import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:doc_app/features/home/data/repo/home_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(HomeState.initial());

  emitHomeStates() async {
    emit(const HomeState.loading());
    log("INa HAMEL CALL", name: "m");
    final result = await _homeRepo.getSpecialtiesList();
    log("INa KHALAST CALLfff", name: "m");

    result.when(
      success: (homeResponse) {
        log("INa FILL SUCCESS ", name: "m");

        emit(HomeState.success(homeResponse));
      },
      failure: (e) {
        log("INa FILL ERROE ", name: "m");

        emit(HomeState.error(
            error: e.apiErrorModel.message ?? 'Error Happened'));
      },
    );
  }
}
