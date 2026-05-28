import 'package:get_it/get_it.dart';

import '../../features/auth/data/datasources/auth_remote_datasource.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/domain/usecases/sign_in_usecase.dart';
import '../../features/auth/presentation/bloc/auth_bloc.dart';

import '../../features/call/data/datasources/call_remote_datasource.dart';
import '../../features/call/data/repositories/call_repository_impl.dart';
import '../../features/call/domain/repositories/call_repository.dart';
import '../../features/call/domain/usecases/create_room_usecase.dart';
import '../../features/call/domain/usecases/join_room_usecase.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // --- Auth Feature ---
  // Bloc
  sl.registerFactory(() => AuthBloc(signInUseCase: sl()));

  // Use cases
  sl.registerLazySingleton(() => SignInUseCase(sl()));

  // Repository
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(remoteDataSource: sl()),
  );

  // Data sources
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(),
  );

  // --- Call Feature ---
  // Use cases
  sl.registerLazySingleton(() => CreateRoomUseCase(sl()));
  sl.registerLazySingleton(() => JoinRoomUseCase(sl()));

  // Repository
  sl.registerLazySingleton<CallRepository>(
    () => CallRepositoryImpl(remoteDataSource: sl()),
  );

  // Data sources
  sl.registerLazySingleton<CallRemoteDataSource>(
    () => CallRemoteDataSourceImpl(),
  );
}
