import 'package:cripto_stat_app/feature/domain/entities/coin_entity.dart';
import 'package:cripto_stat_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class CoinRepository{
  Future<Either<Failure, List<CoinEntity>>> getAllCoins(int page);
  Future<Either<Failure, List<CoinEntity>>> searchCoin(String query);
}