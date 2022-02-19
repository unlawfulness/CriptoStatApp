import 'package:cripto_stat_app/core/platform/network_info.dart';
import 'package:cripto_stat_app/feature/data/datasources/coin_local_data_source.dart';
import 'package:cripto_stat_app/feature/data/datasources/coin_remote_data_source.dart';
import 'package:cripto_stat_app/feature/data/repositories/coin_repository_impl.dart';
import 'package:cripto_stat_app/feature/domain/repositories/coin_repository.dart';
import 'package:cripto_stat_app/feature/domain/usecases/get_all_coins.dart';
import 'package:cripto_stat_app/feature/domain/usecases/search_coin.dart';
import 'package:cripto_stat_app/feature/presentation/bloc/coin_list_cubit/coin_list_cubit.dart';
import 'package:cripto_stat_app/feature/presentation/bloc/search_bloc/search_block.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> itin() async {
  //BloC / Cubit
  sl.registerFactory(() => CoinListCubit(getAllCoins: sl()));
  sl.registerFactory(() => CoinSearchBlock(searchCoins: sl()));
  //UseCases
  sl.registerLazySingleton(() => GetAllCoins(sl()));
  sl.registerLazySingleton(() => SearchCoin(sl()));
  //Repository
  sl.registerLazySingleton<CoinRepository>(() => CoinRepositoryImpl(
      remoteDataSource: sl(), coinLocalDataSource: sl(), networkInfo: sl()));
  sl.registerLazySingleton<CoinRemoteDataSource>(
      () => CoinRemoteDataSourceImpl(client: http.Client()));
  sl.registerLazySingleton<CoinLocalDataSource>(
      () => CoinLocalDataSourceImpl(sharedPreferences: sl()));
  //Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  //External
  final sheredPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sheredPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
