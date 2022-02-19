import 'dart:async';

import 'package:cripto_stat_app/core/error/failure.dart';
import 'package:cripto_stat_app/feature/domain/usecases/search_coin.dart';
import 'package:cripto_stat_app/feature/presentation/bloc/search_bloc/search_event.dart';
import 'package:cripto_stat_app/feature/presentation/bloc/search_bloc/search_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const SERVER_FAILURE_MESSAGE = 'Server Failure';
const CACHED_FAILURE_MESSAGE = 'Cache Failure';

class CoinSearchBlock extends Bloc<CoinsSearchEvent, CoinSearchState> {
  final SearchCoin searchCoins;
  
  CoinSearchBlock({required this.searchCoins}) : super(CoinEmpty()) {
    on<SearchCoins>(_onEvent);
  }

  FutureOr<void> _onEvent(
      SearchCoins event, Emitter<CoinSearchState> emit) async {
    emit(CoinSearchLoading());
    final failureOrCoin =
        await searchCoins(QueryCoinParams(query: event.personQuery));

    emit(failureOrCoin.fold(
        (failure) => CoinsSearchError(message: _mapFailureToMassage(failure)),
        (coin) => CoinSearchLoaded(coins: coin)));
  }

  String _mapFailureToMassage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHED_FAILURE_MESSAGE;
      default:
        return 'unexpected Error';
    }
  }
}
