import 'package:cripto_stat_app/core/error/failure.dart';
import 'package:cripto_stat_app/core/usecases/use_case.dart';
import 'package:cripto_stat_app/feature/domain/entities/coin_entity.dart';
import 'package:cripto_stat_app/feature/domain/repositories/coin_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class SearchCoin extends UseCase<List<CoinEntity>, QueryCoinParams> {
  final CoinRepository coinRepository;

  SearchCoin(this.coinRepository);

  Future<Either<Failure, List<CoinEntity>>> call(QueryCoinParams params) async {
    return await coinRepository.searchCoin(params.query);
  }
}

class QueryCoinParams extends Equatable {
  final String query;

  QueryCoinParams({required this.query});

  @override
  List<Object?> get props => [query];
}
