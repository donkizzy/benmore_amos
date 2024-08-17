import 'package:benmore_amos/core/network/network_provider.dart';
import 'package:benmore_amos/features/auth/data/repositories/auth_repository.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {

  sl.registerLazySingleton<NetworkProvider>(() => NetworkProvider());
  sl.registerLazySingleton<AuthRepository>(() => AuthRepository(networkProvider: sl<NetworkProvider>()));

}
