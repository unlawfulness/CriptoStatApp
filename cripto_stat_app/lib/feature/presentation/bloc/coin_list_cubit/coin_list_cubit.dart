import 'dart:io';

import 'package:cripto_stat_app/core/error/failure.dart';
import 'package:cripto_stat_app/feature/domain/entities/coin_entity.dart';
import 'package:cripto_stat_app/feature/domain/usecases/get_all_coins.dart';
import 'package:cripto_stat_app/feature/presentation/bloc/coin_list_cubit/coin_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const SERVER_FAILURE_MESSAGE = 'Server Failure';
const CACHED_FAILURE_MESSAGE = 'Cache Failure';

class CoinListCubit extends Cubit<CoinState> {
  final GetAllCoins getAllCoins;

  CoinListCubit({required this.getAllCoins}) : super(CoinEmpty());

  int page = 0;

  void loadCoin() async {
    if (state is CoinLoading) return;

    final currentState = state;

    var oldCoins = <CoinEntity>[];
    if (currentState is CoinLoaded) {
      oldCoins = currentState.coinList;
    }

    emit(CoinLoading(oldCoins, isFirstFetch: page == 0));

    final failureOrPerson = await getAllCoins(PageCoinParams(page: page));

    failureOrPerson
        .fold((error) => CoinError(message: _mapFailureToMassage(error)),
            (character) {
      page++;
      final coins = (state as CoinLoading).oldCoinList;
      coins.addAll(character);
      emit(CoinLoaded(coins));
    });
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
