import 'package:cripto_stat_app/core/usecases/use_case.dart';
import 'package:cripto_stat_app/feature/domain/repositories/coin_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../core/error/failure.dart';
import '../entities/coin_entity.dart';

class GetAllCoins extends UseCase<List<CoinEntity>, PageCoinParams> {
  final CoinRepository coinRepository;

  GetAllCoins(this.coinRepository);

  Future<Either<Failure, List<CoinEntity>>> call(PageCoinParams params) async {
    return await coinRepository.getAllCoins(params.page);
  }
}

class PageCoinParams extends Equatable {
  final int page;

  PageCoinParams({required this.page});

  @override
  List<Object?> get props => [page];
}
