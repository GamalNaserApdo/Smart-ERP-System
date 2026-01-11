// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

import '../../features/auth/data/datasources/auth_remote_data_source.dart'
    as _i107;
import '../../features/auth/data/datasources/supabase_auth_data_source.dart'
    as _i857;
import '../../features/auth/data/repositories/auth_repository_impl.dart'
    as _i153;
import '../../features/auth/domain/repositories/auth_repository.dart' as _i787;
import '../../features/auth/domain/usecases/login_usecase.dart' as _i188;
import '../../features/auth/presentation/cubit/login_cubit.dart' as _i69;
import '../../features/home/data/data_source/home_remote_data_source.dart'
    as _i283;
import '../../features/home/data/repositories/home_repository.dart' as _i736;
import '../../features/home/data/repositories/home_repositry_impl.dart'
    as _i823;
import '../../features/home/domain/usecases/get_all_employees_use_case.dart'
    as _i550;
import '../../features/home/domain/usecases/get_employees_count_use_case.dart'
    as _i890;
import '../../features/home/presentation/cubit/home_cubit.dart' as _i9;
import '../api/api_consumer.dart' as _i207;
import '../api/dio_consumer.dart' as _i82;
import 'third_party_module.dart' as _i811;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final thirdPartyModule = _$ThirdPartyModule();
    gh.singleton<_i361.Dio>(() => thirdPartyModule.dio);
    gh.lazySingleton<_i454.SupabaseClient>(
        () => thirdPartyModule.supabaseClient);
    gh.lazySingleton<_i107.AuthRemoteDataSource>(
        () => _i857.SupabaseAuthDataSource());
    gh.lazySingleton<_i283.HomeRemoteDataSource>(
        () => _i283.HomeRemoteDataSourceImpl(gh<_i454.SupabaseClient>()));
    gh.lazySingleton<_i787.AuthRepository>(
        () => _i153.AuthRepositoryImpl(gh<_i107.AuthRemoteDataSource>()));
    gh.lazySingleton<_i188.LoginUsecase>(
        () => _i188.LoginUsecase(gh<_i787.AuthRepository>()));
    gh.singleton<_i207.ApiConsumer>(
        () => _i82.DioConsumer(client: gh<_i361.Dio>()));
    gh.lazySingleton<_i736.HomeRepository>(() => _i823.HomeRepositryImpl(
        remoteDataSource: gh<_i283.HomeRemoteDataSource>()));
    gh.lazySingleton<_i550.GetAllEmployeesUseCase>(() =>
        _i550.GetAllEmployeesUseCase(repository: gh<_i736.HomeRepository>()));
    gh.lazySingleton<_i890.GetEmployeesCountUseCase>(
        () => _i890.GetEmployeesCountUseCase(gh<_i736.HomeRepository>()));
    gh.factory<_i69.LoginCubit>(
        () => _i69.LoginCubit(gh<_i188.LoginUsecase>()));
    gh.factory<_i9.HomeCubit>(() => _i9.HomeCubit(
          gh<_i890.GetEmployeesCountUseCase>(),
          getAllEmployeesUseCase: gh<_i550.GetAllEmployeesUseCase>(),
        ));
    return this;
  }
}

class _$ThirdPartyModule extends _i811.ThirdPartyModule {}
