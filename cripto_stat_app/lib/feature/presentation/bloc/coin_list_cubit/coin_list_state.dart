import 'package:cripto_stat_app/feature/domain/entities/coin_entity.dart';
import 'package:equatable/equatable.dart';

abstract class CoinState extends Equatable {
  const CoinState();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CoinEmpty extends CoinState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CoinLoading extends CoinState {
  final List<CoinEntity> oldCoinList;
  final bool isFirstFetch;

  CoinLoading(this.oldCoinList, {this.isFirstFetch = false});

  @override
  // TODO: implement props
  List<Object?> get props => [oldCoinList];
}

class CoinLoaded extends CoinState {
  final List<CoinEntity> coinList;

  CoinLoaded(this.coinList);
  @override
  // TODO: implement props
  List<Object?> get props => [coinList];
}

class CoinError extends CoinState {
  final String message;

  CoinError({required this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
