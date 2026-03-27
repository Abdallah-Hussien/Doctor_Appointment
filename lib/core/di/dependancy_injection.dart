import 'package:doc_app/core/networking/api_service.dart';
import 'package:doc_app/core/networking/dio_factory.dart';
import 'package:doc_app/features/auth/auth_repo.dart';
import 'package:doc_app/features/auth/login/logic/cubit/login_cubit.dart';
import 'package:doc_app/features/auth/register/logic/cubit/register_cubit.dart';
import 'package:doc_app/features/home/data/repo/home_repo.dart';
import 'package:doc_app/features/home/logic/cubit/home_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  final dio = await DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
  getIt.registerLazySingleton<AuthRepo>(() => AuthRepo(apiService: getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
  getIt.registerFactory<RegisterCubit>(() => RegisterCubit(getIt()));

  // home cubit
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));
  // home repo
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));
}
