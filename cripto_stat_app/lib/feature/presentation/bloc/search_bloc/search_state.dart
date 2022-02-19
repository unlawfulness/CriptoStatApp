import 'package:cripto_stat_app/feature/domain/entities/coin_entity.dart';
import 'package:equatable/equatable.dart';

abstract class CoinSearchState extends Equatable {
  const CoinSearchState();
}

class CoinEmpty extends CoinSearchState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class CoinSearchLoading extends CoinSearchState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class CoinSearchLoaded extends CoinSearchState {
  final List<CoinEntity> coins;

  CoinSearchLoaded({required this.coins});

  @override
  List<Object?> get props => [coins];
}

class CoinsSearchError extends CoinSearchState {
  final String message;

  CoinsSearchError({required this.message});

  @override
  List<Object?> get props => [message];
}
