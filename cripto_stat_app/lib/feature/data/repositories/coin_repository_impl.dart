import 'package:cripto_stat_app/core/error/exception.dart';
import 'package:cripto_stat_app/core/platform/network_info.dart';
import 'package:cripto_stat_app/feature/data/datasources/coin_local_data_source.dart';
import 'package:cripto_stat_app/feature/data/datasources/coin_remote_data_source.dart';
import 'package:cripto_stat_app/feature/data/models/coin_model.dart';
import 'package:cripto_stat_app/feature/domain/entities/coin_entity.dart';
import 'package:cripto_stat_app/core/error/failure.dart';
import 'package:cripto_stat_app/feature/domain/repositories/coin_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

class CoinRepositoryImpl implements CoinRepository {
  final CoinRemoteDataSource remoteDataSource;
  final CoinLocalDataSource coinLocalDataSource;
  final NetworkInfo networkInfo;

  CoinRepositoryImpl(
      {required this.remoteDataSource,
      required this.coinLocalDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, List<CoinEntity>>> getAllCoins(int page) async {
    return await _getCoins(() {
      return remoteDataSource.getAllCoins(page);
    });
  }

  @override
  Future<Either<Failure, List<CoinEntity>>> searchCoin(String query) async {
    return await _getCoins(() {
      return remoteDataSource.searchCoin(query);
    });
  }

  Future<Either<Failure, List<CoinModel>>> _getCoins(
      Future<List<CoinModel>> Function() getCoins) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteCoin = await getCoins();
        coinLocalDataSource.coinsToCache(remoteCoin);
        return Right(remoteCoin);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localCoin = await coinLocalDataSource.getLastCoinsFromCache();
        return Right(localCoin);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
