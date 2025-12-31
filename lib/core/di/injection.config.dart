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

import '../../features/auth/data/datasources/auth_remote_data_source.dart'
    as _i107;
import '../../features/auth/data/datasources/mock_auth_data_source.dart'
    as _i944;
import '../../features/auth/data/repositories/auth_repository_impl.dart'
    as _i153;
import '../../features/auth/domain/repositories/auth_repository.dart' as _i787;
import '../../features/auth/domain/usecases/login_usecase.dart' as _i188;
import '../../features/auth/presentation/cubit/login_cubit.dart' as _i69;
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
    gh.lazySingleton<_i107.AuthRemoteDataSource>(
        () => _i944.MockAuthDataSource());
    gh.lazySingleton<_i787.AuthRepository>(
        () => _i153.AuthRepositoryImpl(gh<_i107.AuthRemoteDataSource>()));
    gh.lazySingleton<_i188.LoginUsecase>(
        () => _i188.LoginUsecase(gh<_i787.AuthRepository>()));
    gh.singleton<_i207.ApiConsumer>(
        () => _i82.DioConsumer(client: gh<_i361.Dio>()));
    gh.factory<_i69.LoginCubit>(
        () => _i69.LoginCubit(gh<_i188.LoginUsecase>()));
    return this;
  }
}

class _$ThirdPartyModule extends _i811.ThirdPartyModule {}
